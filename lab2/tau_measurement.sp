** Measure Tau (Parasitic Delay)
** tau_measurement.sp
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45n1svt.inc'
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45p1svt.inc'

** Two minimum-sized inverters in series
.subckt MIN_INV in out vdd gnd
mp1 out in vdd vdd g45p1svt L=45n W=240n
mn1 out in gnd gnd g45n1svt L=45n W=120n
.ends

** Test circuit: inv1 drives inv2
xinv1 in n1 vdd gnd MIN_INV
xinv2 n1 out vdd gnd MIN_INV

** Add small load cap (typical interconnect)
Cload out 0 1f

** Supply and stimulus
vvdd vdd 0 DC 1.1
vin in 0 pulse(0 1.1 100p 10p 10p 500p 1n)

** Transient analysis
.tran 0.1p 2n

** Measure tau (50% to 50% propagation delay)
.measure tran tau trig v(in) val=0.55 rise=1
+                 targ v(n1) val=0.55 fall=1

.end
