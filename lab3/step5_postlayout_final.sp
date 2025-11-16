** 4-Bit Accumulator Post-Layout Simulation with Parasitics
** step5_postlayout.sp
** This file simulates the post-layout netlist with extracted parasitics

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
** Include Post-Layout Netlist
************************************************************************
** Include your post-layout netlist with the correct filename
.include 'BIT_ACCUM-post-layout.sp'

************************************************************************
** Testbench Setup
************************************************************************

** Instantiate the post-layout 4-bit accumulator
** Using BIT_ACCUM as the subcircuit name
xdut CIN COUT GND PHI RST SOUT0 SOUT1 SOUT2 SOUT3 VDD BIT_ACCUM

** Power Supply
VVDD VDD 0 DC 1.1
VGND GND 0 DC 0

** Clock Generation for 500MHz (Period = 2000ps)
** Adjusted timing for post-layout simulation
VCLK PHI 0 pulse(0 1.1 1n 50p 50p 950p 2000p)

** Load Capacitances - Increased for more realistic post-layout loading
Csout0 SOUT0 0 15f
Csout1 SOUT1 0 15f
Csout2 SOUT2 0 15f
Csout3 SOUT3 0 15f
Ccout COUT 0 15f

** Initial Conditions
.ic v(SOUT0)=0 v(SOUT1)=0 v(SOUT2)=0 v(SOUT3)=0 v(COUT)=0

** Input Stimulus from Vector File
.vec '33578205.vec'

************************************************************************
** Analysis
************************************************************************

** Transient Analysis for 20ns with tighter timestep for accuracy
.tran 0.5p 20n

** Print main signals - using uppercase node names from post-layout
.print tran v(PHI) v(RST) v(CIN) 
.print tran v(SOUT0) v(SOUT1) v(SOUT2) v(SOUT3) v(COUT)

** Print supply current for power analysis
.print tran i(VVDD)

** Measure output values at specific times for verification
.measure tran sout0_2ns find v(SOUT0) at=2.95n
.measure tran sout0_4ns find v(SOUT0) at=4.95n
.measure tran sout1_6ns find v(SOUT1) at=6.95n
.measure tran cout_8ns find v(COUT) at=8.95n

** Measure delays from clock edge to output transitions
.measure tran tpd_clk_sout0 trig v(PHI) val=0.55 rise=2
+                           targ v(SOUT0) val=0.55 rise=1

** Measure rise and fall times on critical output
.measure tran trise_sout0 trig v(SOUT0) val=0.11 rise=1
+                          targ v(SOUT0) val=0.99 rise=1

.measure tran tfall_sout0 trig v(SOUT0) val=0.99 fall=1
+                          targ v(SOUT0) val=0.11 fall=1

** Power measurements
.measure tran avg_power avg power from=0n to=20n

** Peak current measurement
.measure tran peak_current max i(VVDD) from=0n to=20n

.END
