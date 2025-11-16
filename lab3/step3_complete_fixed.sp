** 4-Bit Accumulator Complete Simulation File
** step3_complete.sp
** This file contains everything needed to simulate the 4-bit accumulator

************************************************************************
** Include GPDK045 Transistor Models
************************************************************************
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45n1svt.inc'
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45p1svt.inc'

************************************************************************
** Simulation Options and Temperature
************************************************************************
.TEMP 25
.OPTION
+     ARTIST=2
+     INGOLD=2
+     PARHIER=LOCAL
+     PSF=2
+     HIER_DELIM=0
+     POST=1
+     PROBE=1

************************************************************************
** Subcircuit Definitions
************************************************************************

** Inverter
.subckt INV a gnd vdd y
mpm0 y a vdd vdd g45p1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm0 y a gnd gnd g45n1svt L=45e-9 W=120e-9 AD=16.8e-15 AS=16.8e-15 PD=520e-9 PS=520e-9 NRD=1.16667 NRS=1.16667 M=1
.ends INV

** XOR Gate
.subckt XOR a b gnd vdd y
mpm3 y a net11 vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
mpm2 net11 net9 vdd vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
mpm1 y net5 net4 vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
mpm0 net4 b vdd vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
mnm3 net18 b gnd gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm2 net15 net9 gnd gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm1 y a net18 gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm0 y net5 net15 gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
xi1 b gnd vdd net9 INV
xi0 a gnd vdd net5 INV
.ends XOR

** NAND Gate
.subckt NAND a b gnd vdd y
mpm1 y a vdd vdd g45p1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mpm0 y b vdd vdd g45p1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm1 net13 b gnd gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm0 y a net13 gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
.ends NAND

** AND Gate
.subckt AND a b gnd vdd y
xi0 a b gnd vdd net2 NAND
xi2 net2 gnd vdd y INV
.ends AND

** Half Adder
.subckt HA a b c gnd s vdd
xi0 a b gnd vdd s XOR
xi1 a b gnd vdd c AND
.ends HA

** Flip-Flop
.subckt FF d gnd phi q vdd
mnm2 net25 net24 gnd gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm1 q phi net25 gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm0 net24 net18 net36 gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm3 net36 d gnd gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mpm0 net9 d vdd vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
mpm2 net17 net24 vdd vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
mpm1 net24 phi net9 vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
mpm3 q net18 net17 vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
xi1 phi gnd vdd net18 INV
.ends FF

** Reset Flip-Flop (Original with NAND)
.subckt RST_FF gnd phi rst s sout vdd
xi4 net2 gnd phi net3 vdd FF
xi5 rst s gnd vdd net2 NAND
xi6 net3 gnd vdd sout INV
.ends RST_FF

** Half Adder Accumulator
.subckt HA_ACCUM cin rst phi sout cout gnd vdd
xi0 cin sout cout gnd net3 vdd HA
xi1 gnd phi rst net3 sout vdd RST_FF
.ends HA_ACCUM

** 4-Bit Accumulator (Top Level)
.subckt FOURBIT_ACCUM cin rst phi sout0 sout1 sout2 sout3 cout gnd vdd
xi0 cin rst phi sout0 net7 gnd vdd HA_ACCUM
xi1 net7 rst phi sout1 net14 gnd vdd HA_ACCUM
xi2 net14 rst phi sout2 net21 gnd vdd HA_ACCUM
xi3 net21 rst phi sout3 cout gnd vdd HA_ACCUM
.ends FOURBIT_ACCUM

************************************************************************
** Testbench Setup
************************************************************************

** Instantiate the 4-bit accumulator
xdut cin rst phi sout0 sout1 sout2 sout3 cout gnd vdd FOURBIT_ACCUM

** Power Supply
vvdd vdd 0 DC 1.1
vgnd gnd 0 DC 0

** Clock Generation for 500MHz (Period = 2000ps)
vclk phi 0 pulse(0 1.1 1n 30p 30p 970p 2000p)

** Load Capacitances
Csout0 sout0 0 10f
Csout1 sout1 0 10f
Csout2 sout2 0 10f
Csout3 sout3 0 10f
Ccout cout 0 10f

** Initial Conditions - Force all nodes to start at 0
.ic v(net7)=0 v(net14)=0 v(net21)=0 
.ic v(sout0)=0 v(sout1)=0 v(sout2)=0 v(sout3)=0

** Input Stimulus from Vector File
** Make sure your studentID.vec file has the correct format
.vec '33578205.vec'

************************************************************************
** Analysis
************************************************************************

** Transient Analysis for 20ns
.tran 1p 20n

** Print main signals
.print tran v(phi) v(rst) v(cin) 
.print tran v(sout0) v(sout1) v(sout2) v(sout3) v(cout)

** Print carry chain signals for debugging
.print tran v(net7) v(net14) v(net21)

** Measure output values at specific times for verification
.measure tran sout_2ns find v(sout0) at=2.9n
.measure tran sout_4ns find v(sout0) at=4.9n
.measure tran sout_6ns find v(sout1) at=6.9n

.END
