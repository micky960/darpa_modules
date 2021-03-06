###################################################################

# Created by write_sdc on Wed Jul  4 09:41:06 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
create_clock [get_ports wb_clk_i]  -name CLK  -period 4  -waveform {0 2}
set_input_delay -clock CLK  -max 1  [get_ports wb_clk_i]
set_input_delay -clock CLK  -min 0  [get_ports wb_clk_i]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_31]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_31]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_30]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_30]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_29]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_29]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_28]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_28]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_27]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_27]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_26]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_26]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_25]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_25]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_24]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_24]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_23]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_23]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_22]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_22]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_21]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_21]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_20]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_20]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_19]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_19]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_18]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_18]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_17]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_17]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_16]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_16]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_15]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_15]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_14]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_14]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_13]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_13]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_12]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_12]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_11]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_11]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_10]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_10]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_9]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_9]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_8]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_8]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_7]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_7]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_6]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_6]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_5]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_5]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_4]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_4]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_3]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_3]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_2]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_2]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_1]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_1]
set_input_delay -clock CLK  -max 1  [get_ports wb_adr_i_0]
set_input_delay -clock CLK  -min 0  [get_ports wb_adr_i_0]
set_input_delay -clock CLK  -max 1  [get_ports wb_cyc_i]
set_input_delay -clock CLK  -min 0  [get_ports wb_cyc_i]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_31]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_31]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_30]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_30]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_29]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_29]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_28]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_28]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_27]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_27]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_26]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_26]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_25]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_25]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_24]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_24]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_23]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_23]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_22]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_22]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_21]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_21]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_20]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_20]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_19]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_19]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_18]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_18]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_17]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_17]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_16]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_16]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_15]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_15]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_14]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_14]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_13]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_13]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_12]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_12]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_11]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_11]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_10]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_10]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_9]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_9]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_8]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_8]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_7]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_7]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_6]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_6]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_5]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_5]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_4]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_4]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_3]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_3]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_2]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_2]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_1]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_1]
set_input_delay -clock CLK  -max 1  [get_ports wb_dat_i_0]
set_input_delay -clock CLK  -min 0  [get_ports wb_dat_i_0]
set_input_delay -clock CLK  -max 1  [get_ports wb_sel_i_3]
set_input_delay -clock CLK  -min 0  [get_ports wb_sel_i_3]
set_input_delay -clock CLK  -max 1  [get_ports wb_sel_i_2]
set_input_delay -clock CLK  -min 0  [get_ports wb_sel_i_2]
set_input_delay -clock CLK  -max 1  [get_ports wb_sel_i_1]
set_input_delay -clock CLK  -min 0  [get_ports wb_sel_i_1]
set_input_delay -clock CLK  -max 1  [get_ports wb_sel_i_0]
set_input_delay -clock CLK  -min 0  [get_ports wb_sel_i_0]
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
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_31]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_31]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_30]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_30]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_29]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_29]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_28]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_28]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_27]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_27]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_26]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_26]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_25]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_25]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_24]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_24]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_23]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_23]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_22]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_22]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_21]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_21]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_20]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_20]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_19]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_19]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_18]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_18]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_17]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_17]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_16]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_16]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_15]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_15]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_14]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_14]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_13]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_13]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_12]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_12]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_11]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_11]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_10]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_10]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_9]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_9]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_8]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_8]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_7]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_7]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_6]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_6]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_5]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_5]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_4]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_4]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_3]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_3]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_2]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_2]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_1]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_1]
set_output_delay -clock CLK  -max 1  [get_ports wb_dat_o_0]
set_output_delay -clock CLK  -min 3  [get_ports wb_dat_o_0]
set_output_delay -clock CLK  -max 1  [get_ports int_o]
set_output_delay -clock CLK  -min 3  [get_ports int_o]
