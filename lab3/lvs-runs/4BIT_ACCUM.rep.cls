##############################################################################################################
#####  
#####                                       Pegasus LVS COMPARISON
#####  
#####  Version                       :   24.13-s018
#####  NVN Run Start                 :   Tue Nov 11 19:40:45 2025
#####  ERC Summary File              :   4BIT_ACCUM.sum
#####  Extraction Report File        :   4BIT_ACCUM.rep
#####  Comparison Report File        :   4BIT_ACCUM.rep.cls
#####  Top Cell                      :   4BIT_ACCUM  <vs>  4BIT_ACCUM
#####  
#####                                :      @     @
#####                                :       @   @ 
#####                                :        @ @  
#####  Run Result                    :     MISMATCH
#####                                :        @ @  
#####                                :       @   @ 
#####                                :      @     @
#####  
#####  Run Summary                   :   [ERROR] Connectivity Mismatches
#####                                :   [ERROR] Parameter Mismatches
#####                                :   [INFO]  ERC Results: Empty
#####                                :   [INFO]  Extraction Clean
#####  
#####  Layout Design                 :   4BIT_ACCUM 4BIT_ACCUM layout
#####  Schematic File                :   /home/ece558_658_2025/oraftery/ece558-labs/lab3/lvs-runs/4BIT_ACCUM.cdl (cdl)
#####  Rules File                    :   /home/ece558_658_2025/oraftery/ece558-labs/lab3/lvs-runs/.technology.rul
#####  Pin Swap File                 :   4BIT_ACCUM.rep.cps
#####  
#####  Extraction CPU Time           :   0h 0m 1s - (1s)
#####  Extraction Exec Time          :   0h 0m 1s - (1s)
#####  Extraction Peak Memory Usage  :   31.00MB
#####  NVN CPU Time                  :   0h 0m 0s - (0s)                 
#####  NVN Exec Time                 :   0h 0m 1s - (1s)                 
#####  NVN Peak Memory Usage         :   271.25MB
#####  LVS Total CPU Time            :   0h 0m 1s - (1s)                 
#####  LVS Total Exec Time           :   0h 0m 2s - (2s)                 
#####  LVS Total Peak Memory Usage   :   271.25MB
#####  
##############################################################################################################


##############################################################################################################
#
#                                            CELL MATCH STATISTICS                                            
#
##############################################################################################################

Cell Statistic Descriptions                  | Count
---------------------------------------------+----------
Cells matched                                |         0
Cells expanded                               |         0
Cells not run                                |         0
Cells which mismatch                         |         1
---------------------------------------------+----------
Total                                        |         1


Cell Statistic Detail                        | Count
---------------------------------------------+----------
Cells with parameter mismatches              |         1
Cells with mismatched instance subtypes      |         0
Cells that have been blackboxed              |         0


##############################################################################################################
#
#                                             CELL MATCH SUMMARY                                              
#
##############################################################################################################

               |     Initial Pins     |     Compare Pins     |              | 
Cell           |   lay    :    sch    |   lay    :    sch    | Status       | Detail
---------------+----------+-----------+----------+-----------+--------------+-----------
4BIT_ACCUM     |      *13 :        10 |       13 :        13 | mismatch     | 


##############################################################################################################
#
#                                                  LVS RULES                                                  
#
##############################################################################################################

Command Line LVS Rule Values
----------------------------

    layout_primary                          4BIT_ACCUM {-top_cell 4BIT_ACCUM}
    schematic_primary                       4BIT_ACCUM {-source_top_cell 4BIT_ACCUM}

LVS Rules Given in the Rules File
---------------------------------

    lvs_abort                               -softchk                               no  
    lvs_abort                               -supply_error                          no  
    layout_path                             /home/ece558_658_2025/oraftery/ece558-labs/lab3/lvs-runs/4BIT_ACCUM.gds.gz
    layout_format                           gdsii
    schematic_path                          /home/ece558_658_2025/oraftery/ece558-labs/lab3/lvs-runs/4BIT_ACCUM.cdl
    schematic_format                        cdl
    lvs_black_box                           pll_vco_indsym1p3
                                             
    lvs_ignore_ports                        no  
    lvs_find_shorts                         no  
    lvs_break_ambig_max                     32
    lvs_reduce_device                       M -parallel yes ...
    lvs_reduce_device                       C ( g45cmim ) -parallel yes ...
    lvs_expand_cell_on_error                no  
    lvs_check_property                      M l l -tolerance 0
    lvs_check_property                      M w w -tolerance 2
    lvs_check_property                      C ( g45cmim ) l l -tolerance 0
    lvs_check_property                      C ( g45cmim ) w w -tolerance 0
    lvs_check_property                      g45inda width width -tolerance 1
    lvs_check_property                      g45inda space space -tolerance 1
    lvs_check_property                      g45inda nr nr -tolerance 1
    lvs_check_property                      g45inda rad rad -tolerance 1
    lvs_check_property                      g45inds width width -tolerance 1
    lvs_check_property                      g45inds space space -tolerance 1
    lvs_check_property                      g45inds nr nr -tolerance 1
    lvs_check_property                      g45inds rad rad -tolerance 1
    lvs_report_file                         4BIT_ACCUM.rep
    lvs_report_max                          50 -mismatched_net_limit 100 
    unit                                    -length u
    input_scale                             2000
    virtual_connect                         no  -colon
    virtual_connect                         yes -semicolon_as_colon
    virtual_connect                         no  -report
    virtual_connect                         -depth primary
    text_depth                              -primary

Default LVS Rule Values
-----------------------

    lvs_abort                               -check_device_for_property_rule no
    lvs_abort                               -missing_hcell no
    lvs_abort                               -erc_error yes
    lvs_abort                               -inconsistent_reduction yes
    layout_case_sensitive                   no
    // layout_cpf_file                       
    // schematic_cpf_file                    
    schematic_case_sensitive                no
    // hcell_file                            
    // hcell                                 
    // lvs_exclude_hcell                     
    // lvs_gen_hcells                        
    // lvs_delete_cell                       
    lvs_push_devices                        yes
    lvs_push_devices_properties             no
    lvs_netlist                             yes -substrate_comment
    lvs_netlist                             yes -box_contents
    lvs_netlist                             yes -unnamed_box_pins
    lvs_netlist                             no -allow_inconsistent_model
    lvs_netlist                             yes -properties_comment
    // lvs_write_netlist                     
    // lvs_write_netlist_reduced             
    // lvs_delete_cell_pin                   
    // lvs_interposer                        
    lvs_spice                               yes -allow_floating_pins
    lvs_spice                               yes -allow_duplicate_subcircuit_names
    lvs_spice                               no  -conditional_ldd
    lvs_spice                               no  -prefer_pins
    lvs_spice                               no  -override_globals
    lvs_spice                               no  -redefine_param
    lvs_spice                               no  -replicate_devices
    lvs_spice                               no  -replicate_devices_enhanced
    lvs_spice                               yes -slash_is_space
    lvs_spice                               yes -keep_back_slash
    lvs_spice                               no  -allow_unquoted_strings
    lvs_spice                               no  -allow_inline_parameters
    lvs_spice                               no  -calculate_mos_area
    lvs_spice                               no  -strict_wl
    lvs_spice                               no  -cull_primitive_subcircuits
    lvs_spice                               no  -ignore_option_scale
    lvs_spice                               no  -show_neg_param_warning
    lvs_spice                               no  -scale_x_parameters
    lvs_spice                               yes -strict_subckts_order
    lvs_spice                               no  -ignore_higher_include_for_inst_master
    lvs_spice                               no  -ignore_black_box_connect
    // lvs_spice_option                      
    lvs_reverse_wl                          no
    // lvs_spice_multiplier_name             
                                             
    lvs_compare_case                        no
    lvs_cname                               no  -cell
    lvs_cname                               yes -pin
    lvs_cname                               yes -net
    lvs_cname                               no  -instance
    lvs_non_user_name                       -port "^[0-9]+$"
    lvs_non_user_name                       -net  "^[0-9]+$"
    // lvs_non_user_name                    -instance 
    lvs_out_of_range_exclude_zero           no
    // lvs_group_models                      
    lvs_strict_subtypes                     no
    lvs_exact_subtypes                      no
    lvs_preserve_box_ports                  no
    // lvs_cpoint                            
    // lvs_power_name                        
    // lvs_ground_name                       
    // lvs_cell_list                         
    // lvs_device_type                       
    lvs_auto_pin_swap                       yes -swap_threshold 4000000
    lvs_swap_non_cpoint_pins                yes
    // lvs_swap_pins                         
    lvs_all_cap_pins_swappable              no
    lvs_builtin_device_pin_swap             yes
    // lvs_join_nets                         
    lvs_compare_port_names                  no
    lvs_global_sigs_are_ports               yes
    lvs_discard_pins                        no
    lvs_filter                              no  -bipolar
    lvs_filter                              no  -capacitors
    lvs_filter                              no  -diodes
    lvs_filter                              no  -mos
    lvs_filter                              no  -resistors
    // lvs_filter_option                     
    // lvs_filter_device                     
    // lvs_filter_device_keep_net            
    lvs_reduction_priority                  -parallel
    lvs_reduce_split_gates                  yes
    lvs_derive_logic                        yes -sram
    lvs_derive_logic                        no  -dram
    lvs_derive_logic                        no  -rom
    lvs_recognize_gates                     -all  
    // lvs_recognize_gates_tolerance         
    lvs_reduce                              yes -parallel_bipolar
    lvs_reduce                              yes -parallel_caps
    lvs_reduce                              yes -series_caps
    lvs_reduce                              yes -parallel_diodes
    lvs_reduce                              no  -series_diodes
    lvs_reduce                              yes -parallel_mos
    lvs_reduce                              no  -series_mos
    lvs_reduce                              yes -parallel_resistors
    lvs_reduce                              yes -series_resistors
    // lvs_reduce_do_not_merge               
    lvs_expand_on_device_climbing           no
    lvs_expand_unbalanced_cells             yes
    // lvs_check_all_properties_by_name      
    // lvs_property_map                      
    // lvs_transfer_property                 
    lvs_warn_max                            50
    lvs_inconsistent_reduction_threshold    1000000
    // lvs_report_opt                        
    lvs_report_units                        yes
    // lvs_short_equivalent_nodes            
    lvs_keep_data                           no
    lvs_keep_source_cells                   no
    lvs_create_match_db                     no
    // lvs_map_device                        
    unit                                    -resistance ohm
    unit                                    -capacitance pf
    lvs_verilog_bus_map_by_position         no
    lvs_verilog_keep_backslash              no
    lvs_verilog_detect_buses                no
    lvs_do_not_normalize                    no
    // lvs_generic_device                    
    virtual_connect                         no  -colon
    virtual_connect                         yes -semicolon_as_colon
    // virtual_connect                      -name 
    virtual_connect                         no -report
    virtual_connect                         no -incremental
    lvs_preserve_parameterized_cells        no
    lvs_check_color                         no
    // lvs_schematic_color_path              
    // lvs_assign_conflict_layer             
    // lvs_conflict_layer_check             
    lvs_check_color_label                   no
    // lvs_preserve_cells                    
    port                                    -depth -primary
    lvs_high_shorts_max                     10000000

Effective LVS Rule Values
-------------------------

    lvs_swap_non_cpoint_pins                yes -unbound_pin_threshold 10000
    virtual_connect                         no  -report


##############################################################################################################
#
#                                               CELL COMPARISON                                               
#
##############################################################################################################

                              ##################################################
                              #                                                #
                              #       ------->>> $ MISMATCH $ <<<-------       #
                              #                                                #
                              #          4BIT_ACCUM  <vs>  4BIT_ACCUM          #
                              #                                                #
                              #            CONNECTIVITY MISMATCHES             #
                              #              PARAMETER MISMATCHES              #
                              #                                                #
                              ##################################################

+===[4BIT_ACCUM]==============================================================================================
|                                                 STATISTICS                                                  
+=============================================================================================================


                 |     Original      |      Reduced      |     Unmatched     
Cell             |   lay   :   sch   |   lay   :   sch   |   lay   :   sch
-----------------+---------+---------+---------+---------+---------+---------
M [4 pins]       |         :         |         :         |         :         
 M(G45P1SVT)     |      68 :      68 |     *36 :      33 |      *3 :        0
 M(G45N1SVT)     |      68 :      68 |     *20 :      17 |      *3 :        0
 M:SerMos2#1     |       - :       - |      40 :      40 |       0 :        0
-----------------+---------+---------+---------+---------+---------+---------
Total            |     136 :     136 |      96 :      90 |       6 :        0
=================+=========+=========+=========+=========+=========+=========
Pins             |         :         |      13 :      13 |       0 :        0
Nets             |         :         |     *32 :      23 |      *9 :        0
=================+=========+=========+=========+=========+=========+=========

+===[4BIT_ACCUM]==============================================================================================
|                                      DEVICES REMOVED DURING REDUCTION                                       
+=============================================================================================================


                 |     Parallel      |      Series       |     Split Gate     |     Deleted Nets     
Cell             |   lay   :   sch   |   lay   :   sch   |   lay   :   sch    |    lay    :   sch
-----------------+---------+---------+---------+---------+---------+----------+-----------+----------
M [4 pins]       |         :         |         :         |         :          |           :          
 M(G45P1SVT)     |       - :       3 |       - :       - |       - :        - |         0 :         0
 M(G45N1SVT)     |       - :       3 |       - :       - |       - :        - |         0 :         0
-----------------+---------+---------+---------+---------+---------+----------+-----------+----------

+===[4BIT_ACCUM]==============================================================================================
|                                           INITIAL CORRESPONDENCES                                           
+=============================================================================================================

Type     | Name
---------+----------------------------------------------------------------
Pin      | A! B! CIN COUT GND PHI PHI! RST SOUT0 SOUT1 SOUT2 SOUT3 VDD


+===[4BIT_ACCUM]==============================================================================================
|                                              SHORTS AND OPENS                                               
+=============================================================================================================
                                              
                                              
Layout Pin: A!       | Schematic Pin: A!
=====================+=================(sao 1)
Layout Net: 21       |          OPEN
=====================+========================
Layout Net: 16       |          OPEN
=====================+========================
Layout Net: 11       |          OPEN
=====================+========================
                                              
                                              
Layout Pin: B!       | Schematic Pin: B!
=====================+=================(sao 2)
Layout Net: 23       |          OPEN
=====================+========================
Layout Net: 18       |          OPEN
=====================+========================
Layout Net: 13       |          OPEN
=====================+========================
                                              
                                              
Layout Pin: PHI!     | Schematic Pin: PHI!
=====================+=================(sao 3)
Layout Net: 22       |          OPEN
=====================+========================
Layout Net: 17       |          OPEN
=====================+========================
Layout Net: 12       |          OPEN
=====================+========================


+===[4BIT_ACCUM]==============================================================================================
|                                            MISMATCHED INSTANCES                                             
+=============================================================================================================
                                                                               
                                                                               
Layout Inst : M17 @(6.870,8.580)      | Schematic Inst : ** missing inst **
Layout Model: M(G45P1SVT)             | Schematic Model: 
======================================+==================================(mi 1)
                                                                               
                                                                               
Layout Inst : M20 @(12.870,8.580)     | Schematic Inst : ** missing inst **
Layout Model: M(G45P1SVT)             | Schematic Model: 
======================================+==================================(mi 2)
                                                                               
                                                                               
Layout Inst : M23 @(18.870,8.580)     | Schematic Inst : ** missing inst **
Layout Model: M(G45P1SVT)             | Schematic Model: 
======================================+==================================(mi 3)
                                                                               
                                                                               
Layout Inst : M5 @(6.870,6.580)       | Schematic Inst : ** missing inst **
Layout Model: M(G45N1SVT)             | Schematic Model: 
======================================+==================================(mi 4)
                                                                               
                                                                               
Layout Inst : M8 @(12.870,6.580)      | Schematic Inst : ** missing inst **
Layout Model: M(G45N1SVT)             | Schematic Model: 
======================================+==================================(mi 5)
                                                                               
                                                                               
Layout Inst : M11 @(18.870,6.580)     | Schematic Inst : ** missing inst **
Layout Model: M(G45N1SVT)             | Schematic Model: 
======================================+==================================(mi 6)


+===[4BIT_ACCUM]==============================================================================================
|                                       MISMATCHED INSTANCE PARAMETERS                                        
+=============================================================================================================


                     Merged Instance Detail                     
=========+============================+=========================
         |                            | 
Side     | Master Instance            | Instances
---------+----------------------------+-----------------(mids 1)
Sch      | <XI3/XI1/XI4/XI1/MPM0>     | XI3/XI1/XI4/XI1/MPM0
         |                            +-------------------------
         |                            | XI0/XI1/XI4/XI1/MPM0
         |                            +-------------------------
         |                            | XI1/XI1/XI4/XI1/MPM0
         |                            +-------------------------
         |                            | XI2/XI1/XI4/XI1/MPM0
---------+----------------------------+-----------------(mids 2)
Sch      | <XI2/XI1/XI4/XI1/MNM0>     | XI2/XI1/XI4/XI1/MNM0
         |                            +-------------------------
         |                            | XI0/XI1/XI4/XI1/MNM0
         |                            +-------------------------
         |                            | XI1/XI1/XI4/XI1/MNM0
         |                            +-------------------------
         |                            | XI3/XI1/XI4/XI1/MNM0


Layout Instance                    | Schematic Instance                     |     Parameter Error     
-----------------------------------+----------------------------------------+------------------(mip 1)
M14 @(0.870,8.580) M(G45P1SVT)     | <XI3/XI1/XI4/XI1/MPM0> M(G45P1SVT)     |                         
w: 0.24 u                          | w: 0.96 u                              | 75%                     
-----------------------------------+----------------------------------------+------------------(mip 2)
M2 @(0.870,6.580) M(G45N1SVT)      | <XI2/XI1/XI4/XI1/MNM0> M(G45N1SVT)     |                         
w: 0.12 u                          | w: 0.48 u                              | 75%                     


##############################################################################################################
#
#                                                END OF REPORT                                                
#
##############################################################################################################

