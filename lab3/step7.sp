** 4-Bit Accumulator Timing Analysis - Step 7
** step7.sp
** Testing for maximum frequency with continuous counting
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
.include 'BIT_ACCUM-post-layout.sp'
************************************************************************
** Testbench Setup
************************************************************************
xdut CIN COUT GND PHI RST SOUT0 SOUT1 SOUT2 SOUT3 VDD BIT_ACCUM

** Power Supply
VVDD VDD 0 DC 1.1
VGND GND 0 DC 0

** Clock Generation - 2000ps period (500MHz)
** TO TEST OTHER FREQUENCIES: Change 2000p and 950p proportionally
VCLK PHI 0 pulse(0 1.1 1n 50p 50p 950p 2000p)

** Load Capacitances
Csout0 SOUT0 0 15f
Csout1 SOUT1 0 15f
Csout2 SOUT2 0 15f
Csout3 SOUT3 0 15f
Ccout COUT 0 15f

** Initial Conditions
.ic v(SOUT0)=0 v(SOUT1)=0 v(SOUT2)=0 v(SOUT3)=0 v(COUT)=0

** Use counting vector file (18 cycles total)
.vec '33578205.vec'

************************************************************************
** Analysis
************************************************************************
** Run for 40ns to capture all 18 cycles at 2ns period
.tran 0.5p 40n

** Print signals
.print tran v(PHI) v(RST) v(CIN) 
.print tran v(SOUT0) v(SOUT1) v(SOUT2) v(SOUT3) v(COUT)

** MAIN MEASUREMENT: After 16 increments (at end of cycle 16)
** This should show SOUT=0000 and COUT=1 if working correctly
.measure tran sout0_final find v(SOUT0) at=34n
.measure tran sout1_final find v(SOUT1) at=34n
.measure tran sout2_final find v(SOUT2) at=34n
.measure tran sout3_final find v(SOUT3) at=34n
.measure tran cout_final find v(COUT) at=34n

** Check some intermediate values to verify counting
.measure tran check_cycle8 find v(SOUT3) at=18n
.measure tran check_cycle15 param='v(SOUT0)+v(SOUT1)+v(SOUT2)+v(SOUT3)' at=32n

.END
