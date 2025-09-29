* First line is treated as comment
.options list node post

* Include transistor models from the appropriate directory on the server
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45n1svt.inc'
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45p1svt.inc'


************************************************************************
* Define parameters. Timing parameters are used to set up pulse source *
* for clock waveform. Omit units from timing params because they are   *
* inherited by the .vec which applies its own units.		       *
************************************************************************

.param tper  = 200
.param tris  = 20
.param tfall = 20
.param tpw = '(tper - tris - tfall)/2'
.param tdlay = tper
.param vdd_val=1.1

* Digital vector file for input
.vec 'input.vec'

**************************************************************************
* Create a pulse source as clock signal. See chapter 9 of HSPICE manual	 *
* for syntax of PULSE, PWL, and other types of sources to learn the full *
* syntax. Note that lines starting with "+" are continuations of the	 *
* previous line.							 *
**************************************************************************

Vpulse PHI 0 PULSE
+ 0 vdd_val
+ 'tdlay * 1p' 'tris * 1p' 'tfall * 1p'
+ 'tpw * 1p' 'tper * 1p'


**************************************************************************
* Add a DC voltage between nodes vdd and 0, with value vdd_val, to power *
* the circuit. Node GND is tied to node 0 by a 0V source (i.e. they are	 *
* shorted together), so both "GND" and "0" now represent ground and can	 *
* be used interchangeably.						 *
**************************************************************************

Vsupply vdd 0 vdd_val
Vgnd GND 0 0



*************************************************************************
* This next part defines a subcircuit. The subckt is named "inverter",  *
* it has input/output connections named "GND VDD IN OUT", and a	        *
* parameter named "size" with a default value of 1.		        *
* 								        *
* When you generate a subcircuit from the cadence tools, you will get   *
* subcircuit that is similar to this one.			        *
* 								        *
* Within the subcircuit in this example are NMOS and PMOS	        *
* transistors. The first term of each MOS is the transistor instance    *
* name (e.g. m0) which must start with m, followed by the D G S B       *
* terminals and then the transistor model (e.g. g45p1svt). The .include *
* statements earlier in the spice file provide these models.	        *
*************************************************************************

.subckt inverter GND VDD IN OUT size=1
m0 OUT IN VDD VDD g45p1svt L=45e-9 W='size*240e-9'
m1 OUT IN GND GND g45n1svt L=45e-9 W='size*120e-9'
.ends


**************************************************************************
* instantiate 2 inverters. IN node of inverter Xinv_1 connects to A from *
* vector file. IN of inverter Xinv_2 connects to B from the vector file. *
**************************************************************************

Xinv_1 GND VDD A A_bar inverter size=1
Xinv_2 GND VDD B B_bar inverter size=1.5


**************************************************************************
* Example of how to measure/observe branch currents:			 *
* To measure the current flowing from output of inverter Xinv_2 into	 *
* load cap Cload, we can add a 0V DC source (Vtest) inline between nodes *
* B_bar and Cb as shown. Since Vtest is a 0V source, it is effectively a *
* wire and has no effect on the circuit behavior. However, since SPICE	 *
* logs the current through any source, adding Vtest makes it possible to *
* observe the current flowing on this branch (e.g. in cscope). The same	 *
* method of inserting a 0V source can be used anywhere in your own	 *
* circuit where you want to measure the current.			 *
**************************************************************************

Vtest B_bar Cb 0

* cap between node Cb and 0 with value 3e-15 farads
Cload Cb 0 3e-15

* transient analysis with 1ps step and 0.8ns stop time
.tran 1p 0.8n

* .measure can be used for power, delay measurements
.MEASURE TRAN tpdfb
+ TRIG=v(B)     VAL=0.55 RISE=1
+ TARG=v(B_bar) VAL=0.55 FALL=1


.end
