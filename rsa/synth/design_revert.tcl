date
set_host_options -max_cores 4
set compile_seqmap_propagate_constants     false
set compile_seqmap_propagate_high_effort   false
set compile_enable_register_merging        false
set write_sdc_output_net_resistance        false
set timing_separate_clock_gating_group     true
set verilogout_no_tri tru
set html_log_enable true

set design   CORTEX_M0
set run_date [date]
set abc      [split $run_date " "]
set date     [lindex $abc 3]  
set month    [lindex $abc 1]  
set year     [lindex $abc 5]  
set run_dir ${date}_${month}_${year}

if {[file exist $run_dir]} {
sh rm -rf $run_dir
}

sh mkdir -p $run_dir/reports
sh mkdir -p $run_dir/netlist

set search_path [concat * $search_path]

sh rm -rf ./work
define_design_lib WORK -path ./work

  set_svf $design.svf

  set target_library { /home/projects/vlsi/libraries/65lpe/ref_lib/arm/std_cells/hvt/timing_lib/ccs/db/sc9_cmos10lpe_base_hvt_ss_nominal_max_1p08v_125c.db}

  set link_library { /home/projects/vlsi/libraries/65lpe/ref_lib/arm/std_cells/hvt/timing_lib/ccs/db/sc9_cmos10lpe_base_hvt_ss_nominal_max_1p08v_125c.db\
                     /home/projects/vlsi/libraries/65lpe/ref_lib/aragio/io_pads/timing_lib/nldm/db/rgo_csm65_25v33_lpe_50c_ss_108_297_125.db    \
                     /home/projects/vlsi/libraries/65lpe/ref_lib/arm/memories/sram_sp_hde/timing_lib/USERLIB_ccs_ss_1p08v_1p08v_125c.db \
                   }

read_verilog -rtl ./netlist/CORTEX_M0_128_rll_flt_combo.v

  create_clock -name VCLK -period 10  -waveform {0 5}
  set input_ports  [all_inputs]
  set output_ports [all_outputs]

  set_input_delay -max 1 [get_ports $input_ports ] -clock VCLK
  set_input_delay -min 0 [get_ports $input_ports ] -clock VCLK

  set_output_delay -max 2 [get_ports $output_ports ] -clock VCLK
  set_output_delay -min 1 [get_ports $output_ports ] -clock VCLK

ungroup -all -flatten
compile_ultra -no_autoungroup -no_seq_output_inversion -no_boundary_optimization

create_port HCLK
create_net  HCLK
connect_net HCLK HCLK
foreach_in_collection abc [get_ports *_DFXLAB_* -filter "direction == in"] {
  set port_name  [get_attribute $abc full_name]
  set pqr        [regsub -all {_DFXLAB_} $port_name :]
  set inst_split [split $pqr ":"]
  set libcell    [lindex $inst_split 0]
  set inst_name  [lindex $inst_split 1]
  set rs_pin     [lindex $inst_split 2]
  set q_net      [lindex $inst_split 3]
  remove_port    $port_name
  create_cell    $inst_name sc9_cmos10lpe_base_hvt_ss_nominal_max_1p08v_125c/$libcell 
  connect_net    *$port_name* $inst_name/Q
  connect_net    HCLK $inst_name/CK
}

foreach_in_collection abc [get_ports *_DFXLAB_* -filter "direction == out && full_name =~ *_DFXLAB_D_DFXLAB_*"] {
  set port_name  [get_attribute $abc full_name]
  set pqr        [regsub -all {_DFXLAB_} $port_name :]
  set inst_split [split $pqr ":"]
  set libcell    [lindex $inst_split 0]
  set inst_name  [lindex $inst_split 1]
  set rs_pin     [lindex $inst_split 2]
  set d_net      [lindex $inst_split 3]
  connect_net    *$port_name* $inst_name/D
  remove_port    $port_name
}

foreach_in_collection abc [get_ports *_DFXLAB_* -filter "direction == out && full_name !~ *_DFXLAB_D_DFXLAB_*"] {
  set port_name  [get_attribute $abc full_name]
  set pqr        [regsub -all {_DFXLAB_} $port_name :]
  set inst_split [split $pqr ":"]
  set libcell    [lindex $inst_split 0]
  set inst_name  [lindex $inst_split 1]
  set rs_pin     [lindex $inst_split 2]
  set rs_net     [lindex $inst_split 3]
  set rs_net_size [sizeof_collection [all_connected $port_name]]
  if {$rs_net_size > 1} {
    connect_net    *$port_name* $inst_name/${rs_pin}*
    remove_port    $port_name
  } else {
    connect_net    [all_connected *$port_name*] $inst_name/${rs_pin}*
    remove_port    $port_name
 }
}
#set_fix_multiple_port_nets -all -buffer_constant
change_names -hier -rule verilog
write -format verilog -output ./netlist/CORTEX_M0_128_rll_flt_seq.v -hierarchy 
