
require 'xmlsimple'

class AssemblyParser
	attr_reader :ki_partlist

	def self.from_config(config)
		parser = AssemblyParser.new(config["netlist"], config["positionlist"])

		if(config["component_selection"])
			parser.apply_partno_mapping(config["component_selection"])
		end

		if(config["parts_config"])
			cfg = config["parts_config"]

			parser.apply_component_mapping(cfg["components"]) if cfg.include? "components"
			parser.apply_footprint_mapping(cfg["footprints"]) if cfg.include? "footprints"
		end

		if(config["generate"])
			gen = config["generate"]

			parser.generate_bom(gen["bom"]) if gen.include? "bom"
			parser.generate_cpl(gen["cpl"]) if gen.include? "cpl"
		end

		parser
	end

	def initialize(netlist, positionlist)
		read_netlist(netlist);
		read_positionlist(positionlist);

		assign_bom_part_no();
	end

	def read_netlist(netlist) 
		@ki_partlist = {}
		
		XmlSimple.xml_in(File.read(netlist))["components"].each do |c|
			c["comp"].each do |component|
				fields = {};

				begin
					component["fields"][0]["field"].each do |field|
						fields[field["name"]] = field["content"]
					end
				rescue
				end

				new_part = {
					value: component["value"][0],
					package: component["footprint"][0],
					fields: fields,
				};

				[:dax, :day, :r, :dry, :drx].each do |key|
					if(fields[key.to_s])
						new_part[key] = fields[key.to_s];
					end
				end

				@ki_partlist[component["ref"]] = new_part; 
			end
		end
	end

	def read_positionlist(positionlist)
		File.read(positionlist).split("\n").each do |l| 
			m = /"(?<id>.+)","(?<val>.+)","(?<package>.+)",(?<px>.+),(?<py>.+),(?<rot>.+),(?<layer>top|bottom)/.match(l)
			next if m.nil?

			new_data = {
				px: m["px"].to_f,
				py: m["py"].to_f,
				r:  m["rot"].to_f,
				l:  m["layer"],
				val: m["val"],
				package: m["package"]
			}

			@ki_partlist[m["id"]].merge!(new_data);
		end
	end

	def assign_bom_part_no()
		@ki_partlist.each_key do |key|
			part = @ki_partlist[key]

			if(part[:fields]["JLCPART"])
				part[:part_no] = part[:fields]["JLCPART"]
				next;
			end

			(part[:fields].values + [part[:value]]).each do |field_entry|
				m = /^(C\d+)$/.match field_entry
				next if m.nil?

				part[:part_no] = m[1]
			end
		end
	end

	def modify_component(key, extra_data)
		extra_data = extra_data.dup
		part = @ki_partlist[key]

		[:dax, :day, :r, :dy, :dx].each do |key|
			if(extra_data[key.to_s])
				part[key] = (part[key] || 0) + extra_data[key.to_s];
				extra_data.delete key.to_s
			end
		end

		@ki_partlist[key] = extra_data.merge(part)
	end

	def apply_component_mapping(components)
		components.each_key do |key|
			modify_component(key, components[key])
		end
	end

	def apply_footprint_mapping(footprints)
		footprints.each_key do |key|
			@ki_partlist.each_key do |pk|
				if(@ki_partlist[pk][:package] == key)
					modify_component(pk, footprints[key])
				end
			end
		end
	end

	def apply_partno_mapping(value_map)
		@ki_partlist.each_key do |key|
			next unless @ki_partlist[key][:part_no].nil?
			next unless value_map.include? @ki_partlist[key][:value]

			@ki_partlist[key][:part_no] = value_map[@ki_partlist[key][:value]];
		end
	end

	def generate_bom(file)
		bomlist = {}

		@ki_partlist.each do |key, part|

			bomlist[part[:part_no]] ||= {
				designators: [],
				comment: part[:value],
				footprint: part[:package],
				part_no: part[:part_no]
			}

			bomlist[part[:part_no]][:designators] << key 
		end

		out_str = '"Comment","Designator","Footprint","LCSC Part #"' + "\n"

		bomlist.each do |key, part|
			out_str += "\"#{part[:comment]}\",\"#{part[:designators].join(",")}\",\"#{part[:footprint]}\",\"#{part[:part_no]}\"\n"
		end

		File.write(file, out_str)
	end

	def generate_cpl(file)
		out_str = "Designator,Val,Package,Mid X,Mid Y,Rotation,Layer\r\n"

		@ki_partlist.each do |key, part|
			begin
				r  = part[:r];

				part[:dx] ||= 0;
				part[:dy] ||= 0;

				drx = part[:dx] * Math.cos(Math::PI*r/180) - part[:dy] * Math.sin(Math::PI*r/180)
				dry = part[:dy] * Math.cos(Math::PI*r/180) + part[:dx] * Math.sin(Math::PI*r/180)

				px = part[:px] + (part[:dax] || 0) + drx;
				py = part[:py] + (part[:day] || 0) + dry;

				out_str += "#{key},#{part[:value]},#{part[:package]},#{px},#{py},#{r},#{part[:l]}\r\n"
			rescue
			end
		end
		File.write(file, out_str)
	end
end