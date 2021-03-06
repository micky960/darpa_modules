###################################################################

# Created by write_sdc on Wed Jul  4 08:17:42 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
create_clock [get_ports wb_clk_i]  -name CLK  -period 4  -waveform {0 2}
set_input_delay -clock CLK  -max 1  [get_ports wb_clk_i]
set_input_delay -clock CLK  -min 0  [get_ports wb_clk_i]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[31]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[31]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[30]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[30]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[29]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[29]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[28]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[28]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[27]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[27]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[26]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[26]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[25]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[25]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[24]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[24]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[23]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[23]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[22]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[22]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[21]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[21]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[20]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[20]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[19]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[19]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[18]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[18]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[17]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[17]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[16]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[16]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[15]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[15]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[14]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[14]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[13]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[13]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[12]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[12]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[11]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[11]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[10]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[10]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[9]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[9]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[8]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[8]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[7]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[7]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[6]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[6]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[5]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[5]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[4]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[4]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[3]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[3]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[2]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[2]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[1]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[1]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_adr_i[0]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_adr_i[0]}]
set_input_delay -clock CLK  -max 1  [get_ports wb_cyc_i]
set_input_delay -clock CLK  -min 0  [get_ports wb_cyc_i]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[31]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[31]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[30]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[30]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[29]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[29]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[28]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[28]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[27]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[27]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[26]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[26]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[25]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[25]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[24]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[24]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[23]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[23]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[22]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[22]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[21]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[21]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[20]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[20]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[19]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[19]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[18]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[18]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[17]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[17]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[16]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[16]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[15]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[15]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[14]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[14]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[13]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[13]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[12]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[12]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[11]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[11]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[10]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[10]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[9]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[9]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[8]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[8]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[7]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[7]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[6]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[6]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[5]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[5]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[4]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[4]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[3]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[3]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[2]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[2]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[1]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[1]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_dat_i[0]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_dat_i[0]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_sel_i[3]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_sel_i[3]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_sel_i[2]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_sel_i[2]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_sel_i[1]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_sel_i[1]}]
set_input_delay -clock CLK  -max 1  [get_ports {wb_sel_i[0]}]
set_input_delay -clock CLK  -min 0  [get_ports {wb_sel_i[0]}]
set_input_delay -clock CLK  -max 1  [get_ports wb_stb_i]
set_input_delay -clock CLK  -min 0  [get_ports wb_stb_i]
set_input_delay -clock CLK  -max 1  [get_ports wb_we_i]
set_input_delay -clock CLK  -min 0  [get_ports wb_we_i]
set_input_delay -clock CLK  -max 1  [get_ports wb_rst_i]
set_input_delay -clock CLK  -min 0  [get_ports wb_rst_i]
set_output_delay -clock CLK  -max 1  [get_ports wb_ack_o]
set_output_delay -clock CLK  -min 3  [get_ports wb_ack_o]
set_output_delay -clock CLK  -max 1  [get_ports wb_err_o]
set_output_delay -clock CLK  -min 3  [get_ports wb_err_o]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[31]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[31]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[30]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[30]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[29]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[29]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[28]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[28]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[27]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[27]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[26]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[26]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[25]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[25]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[24]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[24]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[23]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[23]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[22]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[22]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[21]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[21]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[20]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[20]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[19]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[19]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[18]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[18]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[17]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[17]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[16]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[16]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[15]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[15]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[14]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[14]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[13]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[13]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[12]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[12]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[11]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[11]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[10]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[10]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[9]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[9]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[8]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[8]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[7]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[7]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[6]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[6]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[5]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[5]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[4]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[4]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[3]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[3]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[2]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[2]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[1]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[1]}]
set_output_delay -clock CLK  -max 1  [get_ports {wb_dat_o[0]}]
set_output_delay -clock CLK  -min 3  [get_ports {wb_dat_o[0]}]
set_output_delay -clock CLK  -max 1  [get_ports int_o]
set_output_delay -clock CLK  -min 3  [get_ports int_o]
