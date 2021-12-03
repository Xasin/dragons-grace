
require 'yaml'
require_relative 'assembly_parse.rb'

tParser = AssemblyParser.from_config(YAML.load(File.read('assembly.yaml')))

puts tParser.ki_partlist["C102"].to_s 