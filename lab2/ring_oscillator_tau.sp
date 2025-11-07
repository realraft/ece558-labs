** Ring Oscillator Tau Measurement
** ring_oscillator_tau.sp
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45n1svt.inc'
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45p1svt.inc'

.TEMP 25
.OPTION POST=1 PROBE=1

** Minimum-sized inverter (same as your standard)
.subckt MIN_INV in out vdd gnd
mp1 out in vdd vdd g45p1svt L=45n W=240n
mn1 out in gnd gnd g45n1svt L=45n W=120n
.ends

** 11-stage ring oscillator
** Using odd number of stages to ensure oscillation
xinv1 n11 n1 VDD 0 MIN_INV
xinv2 n1 n2 VDD 0 MIN_INV
xinv3 n2 n3 VDD 0 MIN_INV
xinv4 n3 n4 VDD 0 MIN_INV
xinv5 n4 n5 VDD 0 MIN_INV
xinv6 n5 n6 VDD 0 MIN_INV
xinv7 n6 n7 VDD 0 MIN_INV
xinv8 n7 n8 VDD 0 MIN_INV
xinv9 n8 n9 VDD 0 MIN_INV
xinv10 n9 n10 VDD 0 MIN_INV
xinv11 n10 n11 VDD 0 MIN_INV

** Power supply
vvdd VDD 0 DC 1.1

** Initial condition to kick-start oscillation
.ic v(n1)=0 v(n2)=1.1

** Transient analysis - run long enough to see several cycles
.tran 0.1p 200p

** Measure period between consecutive rising edges
.measure tran t1 when v(n1)=0.55 rise=2
.measure tran t2 when v(n1)=0.55 rise=3
.measure tran period param='t2-t1'

** Calculate tau from the period
** Period = 2 * N * tau (where N = number of stages)
** Therefore: tau = Period / (2 * 11)
.measure tran tau_ps param='period/22'

** Also measure frequency for reference
.measure tran frequency param='1/period'

** Print the results
.print tran v(n1) v(n6) v(n11)

.END
