** Step 7b: HA driving 97× load - Simplified Model
** driver_analysis_final.sp
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45n1svt.inc'
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45p1svt.inc'
.include 'HA_ACCUM-post-layout.sp'

.TEMP 25
.OPTION POST=1 PROBE=1

** Clock inverter
.subckt INV a gnd vdd y
mpm0 y a vdd vdd g45p1svt L=45e-9 W=240e-9
mnm0 y a gnd gnd g45n1svt L=45e-9 W=120e-9
.ends

** Stage 1 (97^(1/3) ≈ 4.595× minimum)
.subckt STAGE1 in out vdd gnd
mp1 out in vdd vdd g45p1svt L=45n W=1102.73n
mn1 out in gnd gnd g45n1svt L=45n W=551.36n
.ends

** Stage 2 (97^(2/3) ≈ 21.11× minimum)
.subckt STAGE2 in out vdd gnd
mp2 out in vdd vdd g45p1svt L=45n W=5066.71n
mn2 out in gnd gnd g45n1svt L=45n W=2533.35n
.ends

** Load inverter (97× minimum)
.subckt LOAD_INV in out vdd gnd
mp_load out in vdd vdd g45p1svt L=45n W=23.28u
mn_load out in gnd gnd g45n1svt L=45n W=11.64u
.ends

************************************************************************
** Test Configuration 1: Direct connection (no driver)
************************************************************************
xha_direct 0 0 cin cout_direct 0 phi phi_bar rst sout_direct VDD HA_ACCUM
xload_direct sout_direct s3_direct VDD 0 LOAD_INV

************************************************************************
** Test Configuration 2: With optimal 2-stage driver
************************************************************************
xha_buffered 0 0 cin cout_buffered 0 phi phi_bar rst sout_buffered VDD HA_ACCUM
xstage1 sout_buffered s1 VDD 0 STAGE1
xstage2 s1 s2 VDD 0 STAGE2
xload_buffered s2 s3_buffered VDD 0 LOAD_INV

************************************************************************
** Power and Clock
************************************************************************
vvdd VDD 0 DC 1.1
vclk phi 0 pulse(0 1.1 100p 30p 30p 970p 2n)
xinv phi 0 VDD phi_bar INV

** Use your vector file for inputs
.vec 'HA_ACCUM.vec'

************************************************************************
** Analysis
************************************************************************
.tran 0.1p 10n

************************************************************************
** Measurements - Simplified Model
** Focus on SOUT to S3 delays (treating Q->SOUT as min inverter)
************************************************************************
.param tau_ps = 4.18

** Find when signals cross 0.55V
.measure tran t_sout_direct when v(sout_direct)=0.55 cross=1
.measure tran t_sout_buffered when v(sout_buffered)=0.55 cross=1
.measure tran t_s1 when v(s1)=0.55 cross=1
.measure tran t_s2 when v(s2)=0.55 cross=1
.measure tran t_s3_direct when v(s3_direct)=0.55 cross=1
.measure tran t_s3_buffered when v(s3_buffered)=0.55 cross=1

** Primary measurements: SOUT to S3 delays
.measure tran delay_sout_to_s3_direct_ps param='t_s3_direct-t_sout_direct'
.measure tran delay_sout_to_s3_buffered_ps param='t_s3_buffered-t_sout_buffered'

** Individual stage delays for buffered path
.measure tran delay_sout_to_s1_ps param='t_s1-t_sout_buffered'
.measure tran delay_s1_to_s2_ps param='t_s2-t_s1'
.measure tran delay_s2_to_s3_ps param='t_s3_buffered-t_s2'

** Convert all to tau units
.measure tran delay_sout_to_s3_direct_tau param='delay_sout_to_s3_direct_ps/tau_ps'
.measure tran delay_sout_to_s3_buffered_tau param='delay_sout_to_s3_buffered_ps/tau_ps'
.measure tran delay_sout_to_s1_tau param='delay_sout_to_s1_ps/tau_ps'
.measure tran delay_s1_to_s2_tau param='delay_s1_to_s2_ps/tau_ps'
.measure tran delay_s2_to_s3_tau param='delay_s2_to_s3_ps/tau_ps'

** Also measure rise/fall times for signal quality comparison
.measure tran rise_time_direct trig v(s3_direct) val=0.11 fall=1
+                              targ v(s3_direct) val=0.99 fall=1

.measure tran rise_time_buffered trig v(s3_buffered) val=0.11 fall=1
+                                targ v(s3_buffered) val=0.99 fall=1

.END
