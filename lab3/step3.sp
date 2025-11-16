** 4-Bit Accumulator Testbench @ 500MHz
** step3.sp

************************************************************************
** Include Files
************************************************************************
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45n1svt.inc'
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45p1svt.inc'

** Remove or comment out the .GLOBAL line in your netlist, then include it
** OR include it as-is and we'll handle the globals
.include '4BIT_ACCUM_netlist.spice'

************************************************************************
** Simulation Options
************************************************************************
.TEMP 25
.OPTION POST=1 PROBE=1

************************************************************************
** Testbench Setup
************************************************************************
** Power Supply
vvdd vdd 0 DC 1.1
vgnd gnd 0 DC 0

** Set unused globals to ground (they're generated internally in XOR)
vb_bar b! 0 DC 0
va_bar a! 0 DC 0

** Clock Generation for 500MHz (Period = 2000ps)
vclk phi 0 pulse(0 1.1 1n 30p 30p 970p 2000p)

** Inverted Clock Generation for phi!
vphi_bar phi! 0 pulse(1.1 0 1n 30p 30p 970p 2000p)


** Input Stimulus from Vector File
.vec '33578205.vec'

************************************************************************
** Analysis
************************************************************************
** Transient Analysis for 20ns
.tran 1p 20n

** Print signals
.print tran v(phi) v(rst) v(cin) v(sout0) v(sout1) v(sout2) v(sout3) v(cout)

.END
