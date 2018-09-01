###################################################################

# Created by write_sdc on Wed Jul  4 12:33:29 2018

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
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[75]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[75]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[74]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[74]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[73]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[73]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[72]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[72]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[71]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[71]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[70]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[70]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[69]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[69]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[68]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[68]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[67]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[67]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[66]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[66]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[65]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[65]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[64]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[64]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[63]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[63]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[62]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[62]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[61]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[61]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[60]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[60]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[59]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[59]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[58]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[58]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[57]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[57]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[56]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[56]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[55]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[55]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[54]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[54]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[53]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[53]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[52]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[52]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[51]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[51]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[50]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[50]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[49]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[49]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[48]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[48]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[47]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[47]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[46]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[46]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[45]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[45]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[44]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[44]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[43]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[43]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[42]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[42]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[41]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[41]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[40]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[40]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[39]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[39]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[38]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[38]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[37]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[37]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[36]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[36]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[35]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[35]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[34]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[34]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[33]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[33]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[32]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[32]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[31]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[31]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[30]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[30]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[29]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[29]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[28]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[28]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[27]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[27]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[26]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[26]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[25]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[25]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[24]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[24]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[23]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[23]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[22]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[22]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[21]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[21]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[20]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[20]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[19]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[19]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[18]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[18]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[17]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[17]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[16]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[16]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[15]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[15]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[14]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[14]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[13]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[13]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[12]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[12]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[11]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[11]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[10]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[10]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[9]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[9]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[8]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[8]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[7]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[7]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[6]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[6]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[5]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[5]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[4]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[4]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[3]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[3]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[2]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[2]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[1]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[1]}]
set_input_delay -clock CLK  -max 1  [get_ports {sfllKey[0]}]
set_input_delay -clock CLK  -min 0  [get_ports {sfllKey[0]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[79]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[79]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[78]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[78]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[77]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[77]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[76]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[76]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[75]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[75]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[74]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[74]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[73]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[73]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[72]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[72]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[71]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[71]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[70]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[70]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[69]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[69]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[68]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[68]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[67]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[67]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[66]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[66]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[65]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[65]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[64]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[64]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[63]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[63]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[62]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[62]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[61]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[61]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[60]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[60]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[59]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[59]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[58]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[58]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[57]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[57]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[56]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[56]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[55]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[55]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[54]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[54]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[53]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[53]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[52]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[52]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[51]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[51]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[50]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[50]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[49]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[49]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[48]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[48]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[47]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[47]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[46]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[46]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[45]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[45]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[44]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[44]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[43]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[43]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[42]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[42]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[41]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[41]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[40]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[40]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[39]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[39]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[38]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[38]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[37]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[37]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[36]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[36]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[35]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[35]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[34]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[34]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[33]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[33]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[32]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[32]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[31]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[31]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[30]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[30]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[29]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[29]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[28]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[28]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[27]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[27]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[26]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[26]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[25]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[25]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[24]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[24]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[23]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[23]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[22]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[22]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[21]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[21]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[20]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[20]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[19]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[19]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[18]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[18]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[17]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[17]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[16]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[16]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[15]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[15]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[14]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[14]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[13]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[13]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[12]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[12]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[11]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[11]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[10]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[10]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[9]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[9]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[8]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[8]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[7]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[7]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[6]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[6]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[5]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[5]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[4]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[4]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[3]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[3]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[2]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[2]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[1]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[1]}]
set_input_delay -clock CLK  -max 1  [get_ports {fllkey[0]}]
set_input_delay -clock CLK  -min 0  [get_ports {fllkey[0]}]
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
