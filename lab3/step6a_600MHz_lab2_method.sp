** 4-Bit Accumulator Power Characterization @ 600MHz, 1.1V Supply
** step6a_600MHz_lab2_method.sp
** Uses Lab 2 methodology: Skip first cycle, measure 4 cycles
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
** Instantiate the post-layout 4-bit accumulator
xdut CIN COUT GND PHI RST SOUT0 SOUT1 SOUT2 SOUT3 VDD BIT_ACCUM

** Power Supply at 0.09V
VVDD VDD 0 DC 0.9
VGND GND 0 DC 0

** Clock Generation for 600MHz (Period = 1.667ns)
VCLK PHI 0 pulse(0 0.9 0 30p 30p 803.5p 1667p)

** Load Capacitances (matching Lab 2)
Csout0 SOUT0 0 10f
Csout1 SOUT1 0 10f
Csout2 SOUT2 0 10f
Csout3 SOUT3 0 10f
Ccout COUT 0 10f

** Initial Conditions
.ic v(SOUT0)=0 v(SOUT1)=0 v(SOUT2)=0 v(SOUT3)=0 v(COUT)=0

** Input Stimulus from Vector File
.vec '33578205.vec'
************************************************************************
** Analysis
************************************************************************
** Run for 10 cycles total (16.67ns)
.tran 1p 17n

** Measure Average Power
** Skip first cycle (0 to 1.667ns)
** Measure cycles 1-9 (1.667ns to 16.67ns)
** 9 cycles at 600MHz = 9 * 1.667ns = 15ns
.measure tran Pavg AVG P(VVDD) FROM=1.667n TO=16.67n

.END
