EESchema Schematic File Version 4
LIBS:board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L dk_PMIC-Voltage-Regulators-Linear:AP2114H-3_3TRG1 U101
U 1 1 617AA2A6
P 1975 3575
F 0 "U101" H 1925 3862 60  0000 C CNN
F 1 "C23984" H 1925 3756 60  0000 C CNN
F 2 "digikey-footprints:SOT-223" H 2175 3775 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP2114.pdf" H 2175 3875 60  0001 L CNN
F 4 "AP2114H-3.3TRG1DICT-ND" H 2175 3975 60  0001 L CNN "Digi-Key_PN"
F 5 "AP2114H-3.3TRG1" H 2175 4075 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 2175 4175 60  0001 L CNN "Category"
F 7 "PMIC - Voltage Regulators - Linear" H 2175 4275 60  0001 L CNN "Family"
F 8 "https://www.diodes.com/assets/Datasheets/AP2114.pdf" H 2175 4375 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/diodes-incorporated/AP2114H-3.3TRG1/AP2114H-3.3TRG1DICT-ND/4505142" H 2175 4475 60  0001 L CNN "DK_Detail_Page"
F 10 "IC REG LINEAR 3.3V 1A SOT223" H 2175 4575 60  0001 L CNN "Description"
F 11 "Diodes Incorporated" H 2175 4675 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2175 4775 60  0001 L CNN "Status"
F 13 "C23984" H 1975 3575 50  0001 C CNN "JLCPART"
	1    1975 3575
	1    0    0    -1  
$EndComp
NoConn ~ 1750 1250
NoConn ~ 1750 1150
$Comp
L power:+3.3V #PWR0101
U 1 1 617AAD61
P 4700 4000
F 0 "#PWR0101" H 4700 3850 50  0001 C CNN
F 1 "+3.3V" H 4715 4173 50  0000 C CNN
F 2 "" H 4700 4000 50  0001 C CNN
F 3 "" H 4700 4000 50  0001 C CNN
	1    4700 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C102
U 1 1 617AAED8
P 3600 4250
F 0 "C102" V 3371 4250 50  0000 C CNN
F 1 "100nF 0402" V 3462 4250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3600 4250 50  0001 C CNN
F 3 "~" H 3600 4250 50  0001 C CNN
F 4 "C307331" V 3600 4250 50  0001 C CNN "JLCPART"
	1    3600 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:C C101
U 1 1 617AB321
P 3950 4250
F 0 "C101" V 3698 4250 50  0000 C CNN
F 1 "22uF 0805" V 3789 4250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3988 4100 50  0001 C CNN
F 3 "~" H 3950 4250 50  0001 C CNN
F 4 "C45783" V 3950 4250 50  0001 C CNN "JLCPART"
	1    3950 4250
	-1   0    0    1   
$EndComp
Wire Wire Line
	2375 3675 2375 3575
Wire Wire Line
	2375 3575 2550 3575
Wire Wire Line
	2550 3575 2550 3450
Connection ~ 2375 3575
$Comp
L power:+3.3V #PWR0103
U 1 1 617ACC80
P 2550 3450
F 0 "#PWR0103" H 2550 3300 50  0001 C CNN
F 1 "+3.3V" H 2565 3623 50  0000 C CNN
F 2 "" H 2550 3450 50  0001 C CNN
F 3 "" H 2550 3450 50  0001 C CNN
	1    2550 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1475 3575 1375 3575
Wire Wire Line
	1375 3575 1375 3450
$Comp
L Device:C_Small C105
U 1 1 617AD00C
P 1375 3750
F 0 "C105" H 1283 3704 50  0000 R CNN
F 1 "100nF 0402" H 1283 3795 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1375 3750 50  0001 C CNN
F 3 "~" H 1375 3750 50  0001 C CNN
F 4 "C307331" H 1375 3750 50  0001 C CNN "JLCPART"
	1    1375 3750
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C106
U 1 1 617AD114
P 2550 3750
F 0 "C106" H 2458 3704 50  0000 R CNN
F 1 "100nF 0402" H 2458 3795 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2550 3750 50  0001 C CNN
F 3 "~" H 2550 3750 50  0001 C CNN
F 4 "C307331" H 2550 3750 50  0001 C CNN "JLCPART"
	1    2550 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	2550 3650 2550 3575
Connection ~ 2550 3575
Wire Wire Line
	1375 3650 1375 3575
Connection ~ 1375 3575
$Comp
L Device:C C104
U 1 1 617ADBE8
P 1075 3750
F 0 "C104" H 960 3704 50  0000 R CNN
F 1 "22uF 0805" H 960 3795 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1113 3600 50  0001 C CNN
F 3 "~" H 1075 3750 50  0001 C CNN
F 4 "C45783" H 1075 3750 50  0001 C CNN "JLCPART"
	1    1075 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	1375 3850 1375 4075
Wire Wire Line
	1375 4075 1875 4075
Wire Wire Line
	1075 3900 1075 4075
Wire Wire Line
	1075 4075 1375 4075
Connection ~ 1375 4075
Wire Wire Line
	2550 4075 2550 3850
Wire Wire Line
	1075 3600 1075 3450
Wire Wire Line
	1075 3450 1375 3450
$Comp
L power:+5V #PWR0104
U 1 1 617AF033
P 1075 3450
F 0 "#PWR0104" H 1075 3300 50  0001 C CNN
F 1 "+5V" H 1090 3623 50  0000 C CNN
F 2 "" H 1075 3450 50  0001 C CNN
F 3 "" H 1075 3450 50  0001 C CNN
	1    1075 3450
	1    0    0    -1  
$EndComp
Connection ~ 1075 3450
Wire Wire Line
	850  2450 850  2525
Wire Wire Line
	850  2525 1150 2525
Wire Wire Line
	1150 2525 1150 2450
$Comp
L power:GND #PWR0105
U 1 1 617B02BB
P 1150 2525
F 0 "#PWR0105" H 1150 2275 50  0001 C CNN
F 1 "GND" H 1155 2352 50  0000 C CNN
F 2 "" H 1150 2525 50  0001 C CNN
F 3 "" H 1150 2525 50  0001 C CNN
	1    1150 2525
	1    0    0    -1  
$EndComp
Connection ~ 1150 2525
Wire Wire Line
	1750 950  2000 950 
Wire Wire Line
	2000 950  2000 850 
$Comp
L power:+5V #PWR0106
U 1 1 617B107C
P 2000 850
F 0 "#PWR0106" H 2000 700 50  0001 C CNN
F 1 "+5V" H 2015 1023 50  0000 C CNN
F 2 "" H 2000 850 50  0001 C CNN
F 3 "" H 2000 850 50  0001 C CNN
	1    2000 850 
	1    0    0    -1  
$EndComp
$Comp
L dk_Diodes-Zener-Single:MMSZ5231B-7-F Z102
U 1 1 617B22EA
P 3325 4250
F 0 "Z102" H 3325 4512 60  0000 C CNN
F 1 "BRMMSZ5228B" H 3325 4406 60  0000 C CNN
F 2 "digikey-footprints:SOD-123" H 3525 4450 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds18010.pdf" H 3525 4550 60  0001 L CNN
F 4 "DDZ9689DICT-ND" H 3525 4650 60  0001 L CNN "Digi-Key_PN"
F 5 "DDZ9689-7" H 3525 4750 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 3525 4850 60  0001 L CNN "Category"
F 7 "Diodes - Zener - Single" H 3525 4950 60  0001 L CNN "Family"
F 8 "https://www.diodes.com/assets/Datasheets/ds18010.pdf" H 3525 5050 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/diodes-incorporated/MMSZ5231B-7-F/MMSZ5231B-FDICT-ND/755506" H 3525 5150 60  0001 L CNN "DK_Detail_Page"
F 10 "DIODE ZENER 5.1V 500MW SOD123" H 3525 5250 60  0001 L CNN "Description"
F 11 "Diodes Incorporated" H 3525 5350 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3525 5450 60  0001 L CNN "Status"
	1    3325 4250
	0    -1   -1   0   
$EndComp
NoConn ~ 1750 2050
NoConn ~ 1750 2150
$Comp
L power:GND #PWR0107
U 1 1 617B6E50
P 5700 5125
F 0 "#PWR0107" H 5700 4875 50  0001 C CNN
F 1 "GND" H 5705 4952 50  0000 C CNN
F 2 "" H 5700 5125 50  0001 C CNN
F 3 "" H 5700 5125 50  0001 C CNN
	1    5700 5125
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4900 5700 5125
Wire Wire Line
	5000 4300 4700 4300
Text Label 4350 4300 0    50   ~ 0
RESET
$Comp
L Device:C_Small C103
U 1 1 617BE9B9
P 4700 4400
F 0 "C103" H 4608 4354 50  0000 R CNN
F 1 "100nF 0402" H 4608 4445 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4700 4400 50  0001 C CNN
F 3 "~" H 4700 4400 50  0001 C CNN
F 4 "C307331" H 4700 4400 50  0001 C CNN "JLCPART"
	1    4700 4400
	-1   0    0    1   
$EndComp
Connection ~ 4700 4300
Wire Wire Line
	4700 4300 4350 4300
$Comp
L Device:R_Small R101
U 1 1 617BEB0B
P 4700 4200
F 0 "R101" H 4759 4246 50  0000 L CNN
F 1 "10k 0402" H 4759 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4700 4200 50  0001 C CNN
F 3 "~" H 4700 4200 50  0001 C CNN
F 4 "C25744" H 4700 4200 50  0001 C CNN "JLCPART"
	1    4700 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 617C4367
P 4700 4550
F 0 "#PWR0109" H 4700 4300 50  0001 C CNN
F 1 "GND" H 4705 4377 50  0000 C CNN
F 2 "" H 4700 4550 50  0001 C CNN
F 3 "" H 4700 4550 50  0001 C CNN
	1    4700 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4550 4700 4525
Wire Wire Line
	1875 4075 2550 4075
Connection ~ 1875 4075
$Comp
L power:GND #PWR0111
U 1 1 617CA43C
P 1875 4225
F 0 "#PWR0111" H 1875 3975 50  0001 C CNN
F 1 "GND" H 1880 4052 50  0000 C CNN
F 2 "" H 1875 4225 50  0001 C CNN
F 3 "" H 1875 4225 50  0001 C CNN
	1    1875 4225
	1    0    0    -1  
$EndComp
Wire Wire Line
	1875 4225 1875 4075
$Comp
L Mechanical:MountingHole_Pad H102
U 1 1 617CCB21
P 1475 7050
F 0 "H102" H 1575 7101 50  0000 L CNN
F 1 "MountingHole_Pad" H 1575 7010 50  0000 L CNN
F 2 "XasPrints:MountingHole_1.5mm_M1_Pad_Via" H 1475 7050 50  0001 C CNN
F 3 "~" H 1475 7050 50  0001 C CNN
	1    1475 7050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H103
U 1 1 617CCFFC
P 5275 6800
F 0 "H103" H 5375 6851 50  0000 L CNN
F 1 "MountingHole_Pad" H 5375 6760 50  0000 L CNN
F 2 "XasPrints:MountingHole_1.5mm_M1_Pad_Via" H 5275 6800 50  0001 C CNN
F 3 "~" H 5275 6800 50  0001 C CNN
	1    5275 6800
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H101
U 1 1 617CD06A
P 2300 7075
F 0 "H101" H 2400 7126 50  0000 L CNN
F 1 "MountingHole_Pad" H 2400 7035 50  0000 L CNN
F 2 "XasPrints:MountingHole_1.5mm_M1_Pad_Via" H 2300 7075 50  0001 C CNN
F 3 "~" H 2300 7075 50  0001 C CNN
	1    2300 7075
	1    0    0    -1  
$EndComp
Wire Wire Line
	1475 7150 1475 7275
Wire Wire Line
	1475 7275 2300 7275
Wire Wire Line
	2300 7275 2300 7175
Connection ~ 2300 7275
$Comp
L power:GND #PWR0112
U 1 1 617CEBE0
P 2300 7375
F 0 "#PWR0112" H 2300 7125 50  0001 C CNN
F 1 "GND" H 2305 7202 50  0000 C CNN
F 2 "" H 2300 7375 50  0001 C CNN
F 3 "" H 2300 7375 50  0001 C CNN
	1    2300 7375
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 7375 2300 7275
$Comp
L Graphic:SYM_Hot_Small SYM101
U 1 1 61803871
P 6700 7500
F 0 "SYM101" H 6700 7640 50  0001 C CNN
F 1 "SYM_Hot_Small" H 6700 7375 50  0001 C CNN
F 2 "locals:dragon-silk" H 6700 7325 50  0001 C CNN
F 3 "~" H 6730 7300 50  0001 C CNN
	1    6700 7500
	1    0    0    -1  
$EndComp
$Sheet
S 6950 5725 1550 625 
U 618051D6
F0 "Mane LEDs" 50
F1 "ManeLEDS.sch" 50
F2 "OUT" I R 8500 6050 50 
F3 "IN" I L 6950 6050 50 
$EndSheet
$Sheet
S 8650 5750 1550 600 
U 61808137
F0 "Body LEDs" 50
F1 "BodyLEDs.sch" 50
F2 "IN" I L 8650 6050 50 
$EndSheet
Text Label 7800 4050 2    50   ~ 0
LED_BANK_0
Text Label 6450 6050 0    50   ~ 0
LED_BANK_0
Wire Wire Line
	6450 6050 6950 6050
$Comp
L Device:C_Small C109
U 1 1 6185E58F
P 1500 5950
F 0 "C109" H 1408 5904 50  0000 R CNN
F 1 "100nF 0402" H 1408 5995 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1500 5950 50  0001 C CNN
F 3 "~" H 1500 5950 50  0001 C CNN
F 4 "C307331" H 1500 5950 50  0001 C CNN "JLCPART"
	1    1500 5950
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C110
U 1 1 6185E807
P 2150 5950
F 0 "C110" H 2058 5904 50  0000 R CNN
F 1 "100nF 0402" H 2058 5995 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2150 5950 50  0001 C CNN
F 3 "~" H 2150 5950 50  0001 C CNN
F 4 "C307331" H 2150 5950 50  0001 C CNN "JCLPART"
	1    2150 5950
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C111
U 1 1 6185E857
P 2800 5950
F 0 "C111" H 2708 5904 50  0000 R CNN
F 1 "100nF 0402" H 2708 5995 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2800 5950 50  0001 C CNN
F 3 "~" H 2800 5950 50  0001 C CNN
F 4 "C307331" H 2800 5950 50  0001 C CNN "JLCPART"
	1    2800 5950
	-1   0    0    1   
$EndComp
$Comp
L Device:C C108
U 1 1 6185EEE1
P 1100 5900
F 0 "C108" V 848 5900 50  0000 C CNN
F 1 "22uF 0805" V 939 5900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1138 5750 50  0001 C CNN
F 3 "~" H 1100 5900 50  0001 C CNN
F 4 "C45783" V 1100 5900 50  0001 C CNN "JLCPART"
	1    1100 5900
	-1   0    0    1   
$EndComp
Wire Wire Line
	1100 6050 1500 6050
Connection ~ 1500 6050
Wire Wire Line
	1500 6050 1900 6050
Connection ~ 2150 6050
Wire Wire Line
	2150 6050 2800 6050
Connection ~ 2150 5850
Wire Wire Line
	2150 5850 1900 5850
Wire Wire Line
	1100 5750 1500 5750
Wire Wire Line
	1500 5750 1500 5850
Connection ~ 1500 5850
$Comp
L power:GND #PWR0123
U 1 1 618637B0
P 1900 6100
F 0 "#PWR0123" H 1900 5850 50  0001 C CNN
F 1 "GND" H 1905 5927 50  0000 C CNN
F 2 "" H 1900 6100 50  0001 C CNN
F 3 "" H 1900 6100 50  0001 C CNN
	1    1900 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 6100 1900 6050
Connection ~ 1900 6050
Wire Wire Line
	1900 6050 2150 6050
$Comp
L power:+5V #PWR0124
U 1 1 61865324
P 1900 5800
F 0 "#PWR0124" H 1900 5650 50  0001 C CNN
F 1 "+5V" H 1915 5973 50  0000 C CNN
F 2 "" H 1900 5800 50  0001 C CNN
F 3 "" H 1900 5800 50  0001 C CNN
	1    1900 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5800 1900 5850
Connection ~ 1900 5850
Wire Wire Line
	1900 5850 1500 5850
Wire Wire Line
	2150 5850 2800 5850
$Comp
L Device:R_Small R102
U 1 1 6186D1BD
P 5125 6925
F 0 "R102" H 5184 6971 50  0000 L CNN
F 1 "330R 0402" H 5184 6880 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5125 6925 50  0001 C CNN
F 3 "~" H 5125 6925 50  0001 C CNN
F 4 "C226996" H 5125 6925 50  0001 C CNN "JLCPART"
	1    5125 6925
	0    1    1    0   
$EndComp
Wire Wire Line
	8500 6050 8650 6050
Wire Wire Line
	7100 4050 7800 4050
$Comp
L power:GND #PWR0125
U 1 1 61880EAB
P 9575 4725
F 0 "#PWR0125" H 9575 4475 50  0001 C CNN
F 1 "GND" H 9580 4552 50  0000 C CNN
F 2 "" H 9575 4725 50  0001 C CNN
F 3 "" H 9575 4725 50  0001 C CNN
	1    9575 4725
	1    0    0    -1  
$EndComp
Wire Wire Line
	9575 4725 9575 4625
$Comp
L power:+3.3V #PWR0126
U 1 1 61883343
P 9225 3675
F 0 "#PWR0126" H 9225 3525 50  0001 C CNN
F 1 "+3.3V" H 9240 3848 50  0000 C CNN
F 2 "" H 9225 3675 50  0001 C CNN
F 3 "" H 9225 3675 50  0001 C CNN
	1    9225 3675
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R103
U 1 1 6186FA38
P 7000 4050
F 0 "R103" H 7059 4096 50  0000 L CNN
F 1 "330R 0402" H 7059 4005 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 7000 4050 50  0001 C CNN
F 3 "~" H 7000 4050 50  0001 C CNN
F 4 "C226996" H 7000 4050 50  0001 C CNN "JLCPART"
	1    7000 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	8825 3775 9225 3775
Connection ~ 9225 3775
$Comp
L power:GND #PWR0127
U 1 1 6188FB2A
P 8525 3775
F 0 "#PWR0127" H 8525 3525 50  0001 C CNN
F 1 "GND" V 8530 3647 50  0000 R CNN
F 2 "" H 8525 3775 50  0001 C CNN
F 3 "" H 8525 3775 50  0001 C CNN
	1    8525 3775
	0    1    1    0   
$EndComp
Wire Wire Line
	8525 3775 8625 3775
Wire Wire Line
	4750 6475 5100 6475
Text Label 5100 6475 2    50   ~ 0
SDA
Text Label 5100 6575 2    50   ~ 0
SCL
Wire Wire Line
	5100 6575 4750 6575
$Comp
L Switch:SW_Push SW101
U 1 1 6189CBE3
P 7250 3500
F 0 "SW101" H 7250 3785 50  0000 C CNN
F 1 "KXT 331 LHS" H 7250 3694 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_CK_KXT3" H 7250 3700 50  0001 C CNN
F 3 "" H 7250 3700 50  0001 C CNN
	1    7250 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 618A4162
P 7550 3500
F 0 "#PWR0129" H 7550 3250 50  0001 C CNN
F 1 "GND" V 7555 3372 50  0000 R CNN
F 2 "" H 7550 3500 50  0001 C CNN
F 3 "" H 7550 3500 50  0001 C CNN
	1    7550 3500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7450 3500 7550 3500
Wire Wire Line
	9225 3675 9225 3775
$Comp
L Device:C_Small C112
U 1 1 618AC04B
P 8725 3775
F 0 "C112" V 8496 3775 50  0000 C CNN
F 1 "100nF 0402" V 8587 3775 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8725 3775 50  0001 C CNN
F 3 "~" H 8725 3775 50  0001 C CNN
F 4 "C307331" V 8725 3775 50  0001 C CNN "JLCPART"
	1    8725 3775
	0    1    1    0   
$EndComp
Text Label 6925 2975 2    50   ~ 0
SCL
Text Label 6900 4250 2    50   ~ 0
SDA
$Comp
L Device:R_Small R104
U 1 1 618BBDB8
P 6875 3375
F 0 "R104" H 6934 3421 50  0000 L CNN
F 1 "10k 0402" H 6934 3330 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 6875 3375 50  0001 C CNN
F 3 "~" H 6875 3375 50  0001 C CNN
F 4 "C25744" H 6875 3375 50  0001 C CNN "JLCPART"
	1    6875 3375
	1    0    0    -1  
$EndComp
Wire Wire Line
	6875 3500 6875 3475
Wire Wire Line
	6875 3500 7050 3500
$Comp
L power:+3.3V #PWR0131
U 1 1 618C4005
P 6875 3275
F 0 "#PWR0131" H 6875 3125 50  0001 C CNN
F 1 "+3.3V" H 6890 3448 50  0000 C CNN
F 2 "" H 6875 3275 50  0001 C CNN
F 3 "" H 6875 3275 50  0001 C CNN
	1    6875 3275
	1    0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Hot_Small SYM102
U 1 1 618C9419
P 6425 7275
F 0 "SYM102" H 6425 7415 50  0001 C CNN
F 1 "SYM_Hot_Small" H 6425 7150 50  0001 C CNN
F 2 "XasPrints:DragonIcon_7mm_Solder" H 6425 7100 50  0001 C CNN
F 3 "~" H 6455 7075 50  0001 C CNN
	1    6425 7275
	1    0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Hot_Small SYM103
U 1 1 618C9FB8
P 6425 7500
F 0 "SYM103" H 6425 7640 50  0001 C CNN
F 1 "SYM_Hot_Small" H 6425 7375 50  0001 C CNN
F 2 "locals:config_q" H 6425 7325 50  0001 C CNN
F 3 "~" H 6455 7300 50  0001 C CNN
	1    6425 7500
	1    0    0    -1  
$EndComp
$Comp
L XasParts:ESP32-C3-MINI-1-N4 U102
U 1 1 618E99C4
P 5700 4350
F 0 "U102" H 5700 5715 50  0000 C CNN
F 1 "C2838502" H 5700 5624 50  0000 C CNN
F 2 "XasPrints:ESP32-C3-MINI" H 5150 5500 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/2108141930_Espressif-Systems-ESP32-C3-MINI-1-N4_C2838502.pdf" H 5250 5600 50  0001 C CNN
F 4 "C2838502" H 5700 4350 50  0001 C CNN "JLCPART"
	1    5700 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4100 4700 4000
Wire Wire Line
	4700 4000 5000 4000
Connection ~ 4700 4000
Wire Wire Line
	3950 4400 3950 4525
Wire Wire Line
	3950 4525 4700 4525
Connection ~ 4700 4525
Wire Wire Line
	4700 4525 4700 4500
Wire Wire Line
	3600 4350 3600 4525
Wire Wire Line
	3600 4525 3950 4525
Connection ~ 3950 4525
Wire Wire Line
	3950 4100 3950 4000
Wire Wire Line
	3950 4000 4700 4000
Wire Wire Line
	3600 4150 3600 4000
Wire Wire Line
	3600 4000 3950 4000
Connection ~ 3950 4000
Wire Wire Line
	3325 4450 3325 4525
Wire Wire Line
	3325 4525 3600 4525
Connection ~ 3600 4525
Wire Wire Line
	3325 4050 3325 4000
Wire Wire Line
	3325 4000 3600 4000
Connection ~ 3600 4000
$Comp
L board-rescue:USB_C_Receptacle_USB2.0-Connector J101
U 1 1 617AA648
P 1150 1550
F 0 "J101" H 1255 2417 50  0000 C CNN
F 1 "C165948" H 1255 2326 50  0000 C CNN
F 2 "Connector_USB:USB_C_Receptacle_HRO_TYPE-C-31-M-12" H 1300 1550 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 1300 1550 50  0001 C CNN
F 4 "C165948" H 1150 1550 50  0001 C CNN "JLCPART"
	1    1150 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1450 1750 1550
Wire Wire Line
	1750 1650 1750 1750
Wire Wire Line
	1750 1650 2000 1650
Connection ~ 1750 1650
Wire Wire Line
	1750 1450 2000 1450
Connection ~ 1750 1450
Text Label 2000 1650 2    50   ~ 0
D+
Text Label 2000 1450 2    50   ~ 0
D-
Text Label 4700 3350 0    50   ~ 0
D+
Wire Wire Line
	4700 3350 5000 3350
Wire Wire Line
	4700 3250 5000 3250
Text Label 4700 3250 0    50   ~ 0
D-
$Comp
L dk_TVS-Diodes:USBLC6-2SC6 D101
U 1 1 6194B6B3
P 3050 1625
F 0 "D101" V 3103 1097 60  0000 R CNN
F 1 "C2827654" V 2997 1097 60  0000 R CNN
F 2 "digikey-footprints:SOT23-6L" H 3250 1825 60  0001 L CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/06/1d/48/9c/6c/20/4a/b2/CD00050750.pdf/files/CD00050750.pdf/jcr:content/translations/en.CD00050750.pdf" H 3250 1925 60  0001 L CNN
F 4 "497-5235-1-ND" H 3250 2025 60  0001 L CNN "Digi-Key_PN"
F 5 "USBLC6-2SC6" H 3250 2125 60  0001 L CNN "MPN"
F 6 "Circuit Protection" H 3250 2225 60  0001 L CNN "Category"
F 7 "TVS - Diodes" H 3250 2325 60  0001 L CNN "Family"
F 8 "http://www.st.com/content/ccc/resource/technical/document/datasheet/06/1d/48/9c/6c/20/4a/b2/CD00050750.pdf/files/CD00050750.pdf/jcr:content/translations/en.CD00050750.pdf" H 3250 2425 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/stmicroelectronics/USBLC6-2SC6/497-5235-1-ND/1121688" H 3250 2525 60  0001 L CNN "DK_Detail_Page"
F 10 "TVS DIODE 5.25V 17V SOT23-6" H 3250 2625 60  0001 L CNN "Description"
F 11 "STMicroelectronics" H 3250 2725 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3250 2825 60  0001 L CNN "Status"
F 13 "C2827654" V 3050 1625 50  0001 C CNN "JLCPART"
	1    3050 1625
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 6194C0A7
P 3050 2300
F 0 "#PWR0102" H 3050 2050 50  0001 C CNN
F 1 "GND" H 3055 2127 50  0000 C CNN
F 2 "" H 3050 2300 50  0001 C CNN
F 3 "" H 3050 2300 50  0001 C CNN
	1    3050 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2300 3050 2125
$Comp
L power:+5V #PWR0108
U 1 1 6194E06E
P 3050 1000
F 0 "#PWR0108" H 3050 850 50  0001 C CNN
F 1 "+5V" H 3065 1173 50  0000 C CNN
F 2 "" H 3050 1000 50  0001 C CNN
F 3 "" H 3050 1000 50  0001 C CNN
	1    3050 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1000 3050 1125
Wire Wire Line
	3350 1125 3350 850 
Text Label 2750 850  3    50   ~ 0
D+
Wire Wire Line
	2750 1125 2750 850 
Text Label 3350 850  3    50   ~ 0
D-
Text Label 6800 3500 2    50   ~ 0
FW_RESET
Wire Wire Line
	6400 3500 6875 3500
Connection ~ 6875 3500
Wire Wire Line
	6400 4050 6900 4050
Wire Wire Line
	5225 6925 5275 6925
Wire Wire Line
	5275 6925 5275 6900
$Comp
L power:GND #PWR0110
U 1 1 6197FA55
P 4350 7475
F 0 "#PWR0110" H 4350 7225 50  0001 C CNN
F 1 "GND" H 4355 7302 50  0000 C CNN
F 2 "" H 4350 7475 50  0001 C CNN
F 3 "" H 4350 7475 50  0001 C CNN
	1    4350 7475
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 7475 4350 7450
$Comp
L Device:C_Small C107
U 1 1 61985402
P 3475 7150
F 0 "C107" H 3383 7104 50  0000 R CNN
F 1 "10nF 0402" H 3383 7195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3475 7150 50  0001 C CNN
F 3 "~" H 3475 7150 50  0001 C CNN
	1    3475 7150
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR0113
U 1 1 6198D5F9
P 3825 6400
F 0 "#PWR0113" H 3825 6250 50  0001 C CNN
F 1 "+3.3V" H 3840 6573 50  0000 C CNN
F 2 "" H 3825 6400 50  0001 C CNN
F 3 "" H 3825 6400 50  0001 C CNN
	1    3825 6400
	1    0    0    -1  
$EndComp
NoConn ~ 2750 2125
NoConn ~ 3350 2125
$Comp
L Device:R_Small R105
U 1 1 61921E3E
P 7375 4250
F 0 "R105" H 7434 4296 50  0000 L CNN
F 1 "10k 0402" H 7434 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 7375 4250 50  0001 C CNN
F 3 "~" H 7375 4250 50  0001 C CNN
F 4 "C25744" H 7375 4250 50  0001 C CNN "JLCPART"
	1    7375 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	6400 4250 7275 4250
$Comp
L power:+3.3V #PWR0114
U 1 1 6192681C
P 7475 4250
F 0 "#PWR0114" H 7475 4100 50  0001 C CNN
F 1 "+3.3V" H 7490 4423 50  0000 C CNN
F 2 "" H 7475 4250 50  0001 C CNN
F 3 "" H 7475 4250 50  0001 C CNN
	1    7475 4250
	0    1    1    0   
$EndComp
NoConn ~ 6400 3350
Wire Wire Line
	6425 2975 6425 3250
Wire Wire Line
	6425 3250 6400 3250
$Comp
L Device:R_Small R106
U 1 1 61936DEC
P 7050 2875
F 0 "R106" H 7109 2921 50  0000 L CNN
F 1 "10k 0402" H 7109 2830 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 7050 2875 50  0001 C CNN
F 3 "~" H 7050 2875 50  0001 C CNN
F 4 "C25744" H 7050 2875 50  0001 C CNN "JLCPART"
	1    7050 2875
	1    0    0    -1  
$EndComp
Wire Wire Line
	6425 2975 7050 2975
$Comp
L power:+3.3V #PWR0128
U 1 1 61939348
P 7050 2775
F 0 "#PWR0128" H 7050 2625 50  0001 C CNN
F 1 "+3.3V" H 7065 2948 50  0000 C CNN
F 2 "" H 7050 2775 50  0001 C CNN
F 3 "" H 7050 2775 50  0001 C CNN
	1    7050 2775
	1    0    0    -1  
$EndComp
NoConn ~ 6400 4150
NoConn ~ 6400 3850
NoConn ~ 6400 3750
NoConn ~ 6400 3600
$Comp
L Mechanical:MountingHole MNT101
U 1 1 61948D17
P 10700 5825
F 0 "MNT101" H 10800 5871 50  0000 L CNN
F 1 "MountingHole" H 10800 5780 50  0000 L CNN
F 2 "XasPrints:JLC_TOOLINGHOLE" H 10700 5825 50  0001 C CNN
F 3 "~" H 10700 5825 50  0001 C CNN
	1    10700 5825
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MNT102
U 1 1 6194966E
P 10700 6050
F 0 "MNT102" H 10800 6096 50  0000 L CNN
F 1 "MountingHole" H 10800 6005 50  0000 L CNN
F 2 "XasPrints:JLC_TOOLINGHOLE" H 10700 6050 50  0001 C CNN
F 3 "~" H 10700 6050 50  0001 C CNN
	1    10700 6050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MNT103
U 1 1 619496CA
P 10700 6250
F 0 "MNT103" H 10800 6296 50  0000 L CNN
F 1 "MountingHole" H 10800 6205 50  0000 L CNN
F 2 "XasPrints:JLC_TOOLINGHOLE" H 10700 6250 50  0001 C CNN
F 3 "~" H 10700 6250 50  0001 C CNN
	1    10700 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9225 3775 9225 3975
$Comp
L XasParts:BH1721FVC U103
U 1 1 61945E9C
P 9575 4525
F 0 "U103" H 9575 5431 50  0000 C CNN
F 1 "BH1721FVC" H 9575 5340 50  0000 C CNN
F 2 "XasPrints:WSOF5" H 9325 4275 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1809172039_ROHM-Semicon-BH1721FVC-TR_C184130.pdf" H 9425 4375 50  0001 C CNN
F 4 "C184130" H 9575 5249 50  0000 C CNN "JLCPART"
	1    9575 4525
	1    0    0    -1  
$EndComp
Connection ~ 9225 3975
Wire Wire Line
	9225 3975 9225 4125
$Comp
L XasParts:AW9201 U104
U 1 1 61952883
P 4350 7125
F 0 "U104" H 4350 8131 50  0000 C CNN
F 1 "AW9201" H 4350 8040 50  0000 C CNN
F 2 "XasPrints:QFN-8L" H 4000 7825 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/2008041805_AWINIC-Shanghai-Awinic-Tech-AW9201QNR_C506183.pdf" H 4100 7925 50  0001 C CNN
F 4 "C506183" H 4350 7949 50  0000 C CNN "JLCPART"
	1    4350 7125
	1    0    0    -1  
$EndComp
Wire Wire Line
	3825 6400 3825 6475
Wire Wire Line
	3825 6475 3950 6475
Wire Wire Line
	4750 6925 5025 6925
Wire Wire Line
	3475 7050 3475 6925
Wire Wire Line
	3475 6925 3950 6925
Wire Wire Line
	3475 7250 3475 7450
Wire Wire Line
	3475 7450 4350 7450
Connection ~ 4350 7450
Wire Wire Line
	4350 7450 4350 7425
NoConn ~ 4750 6675
Wire Wire Line
	9925 3975 10400 3975
Wire Wire Line
	9925 4075 10400 4075
Text Label 10400 4075 2    50   ~ 0
SCL
Text Label 10400 3975 2    50   ~ 0
SDA
NoConn ~ 6400 3950
$Comp
L Graphic:SYM_Hot_Small SYM104
U 1 1 61988813
P 6700 7275
F 0 "SYM104" H 6700 7415 50  0001 C CNN
F 1 "SYM_Hot_Small" H 6700 7150 50  0001 C CNN
F 2 "locals:dragon-silk-back" H 6700 7100 50  0001 C CNN
F 3 "~" H 6730 7075 50  0001 C CNN
	1    6700 7275
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP103
U 1 1 6198D8AA
P 4350 4300
F 0 "TP103" H 4408 4420 50  0000 L CNN
F 1 "TestPoint" H 4408 4329 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 4550 4300 50  0001 C CNN
F 3 "~" H 4550 4300 50  0001 C CNN
	1    4350 4300
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP101
U 1 1 6198EDAB
P 4775 3550
F 0 "TP101" V 4970 3624 50  0000 C CNN
F 1 "TestPoint" V 4775 3950 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 4975 3550 50  0001 C CNN
F 3 "~" H 4975 3550 50  0001 C CNN
	1    4775 3550
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP102
U 1 1 6198EEE6
P 4775 3650
F 0 "TP102" V 4970 3724 50  0000 C CNN
F 1 "TestPoint" V 4775 4050 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 4975 3650 50  0001 C CNN
F 3 "~" H 4975 3650 50  0001 C CNN
	1    4775 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5000 3550 4775 3550
Wire Wire Line
	4775 3650 5000 3650
$Comp
L Connector:TestPoint TP104
U 1 1 61994C5C
P 6450 4350
F 0 "TP104" V 6645 4424 50  0000 C CNN
F 1 "TestPoint" V 6450 4750 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 6650 4350 50  0001 C CNN
F 3 "~" H 6650 4350 50  0001 C CNN
	1    6450 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	6450 4350 6400 4350
$EndSCHEMATC