** 4-Bit Accumulator Power Characterization @ 800MHz, 1.1V Supply
** step6a_800MHz_lab2_method.sp
** Skip first cycle, measure next 9 cycles
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

** Power Supply at 1.1V
VVDD VDD 0 DC 1.1
VGND GND 0 DC 0

** Clock Generation for 800MHz (Period = 1.25ns)
VCLK PHI 0 pulse(0 1.1 0 30p 30p 595p 1250p)

** Load Capacitances
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
** Run for 10 cycles total (12.5ns)
.tran 1p 13n

** Measure Average Power
** Skip first cycle (0 to 1.25ns)
** Measure cycles 1-9 (1.25ns to 12.5ns)
** 9 cycles at 800MHz = 9 * 1.25ns = 11.25ns
.measure tran Pavg AVG P(VVDD) FROM=1.25n TO=12.5n

.END
