/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : M-2016.12-SP2
// Date      : Wed Jul  4 09:43:56 2018
/////////////////////////////////////////////////////////////


module arbiter_bytebus ( wbm0_adr_o, wbm0_dat_o, wbm0_sel_o, wbm0_we_o, 
        wbm0_cyc_o, wbm0_stb_o, wbm0_cti_o, wbm0_bte_o, wbm0_dat_i, wbm0_ack_i, 
        wbm0_err_i, wbm0_rty_i, wbs0_adr_i, wbs0_dat_i, wbs0_we_i, wbs0_cyc_i, 
        wbs0_stb_i, wbs0_cti_i, wbs0_bte_i, wbs0_dat_o, wbs0_ack_o, wbs0_err_o, 
        wbs0_rty_o, wbs1_adr_i, wbs1_dat_i, wbs1_we_i, wbs1_cyc_i, wbs1_stb_i, 
        wbs1_cti_i, wbs1_bte_i, wbs1_dat_o, wbs1_ack_o, wbs1_err_o, wbs1_rty_o, 
        wbs2_adr_i, wbs2_dat_i, wbs2_we_i, wbs2_cyc_i, wbs2_stb_i, wbs2_cti_i, 
        wbs2_bte_i, wbs2_dat_o, wbs2_ack_o, wbs2_err_o, wbs2_rty_o, wbs3_adr_i, 
        wbs3_dat_i, wbs3_we_i, wbs3_cyc_i, wbs3_stb_i, wbs3_cti_i, wbs3_bte_i, 
        wbs3_dat_o, wbs3_ack_o, wbs3_err_o, wbs3_rty_o, wbs4_adr_i, wbs4_dat_i, 
        wbs4_we_i, wbs4_cyc_i, wbs4_stb_i, wbs4_cti_i, wbs4_bte_i, wbs4_dat_o, 
        wbs4_ack_o, wbs4_err_o, wbs4_rty_o, wb_clk, wb_rst );
  input [31:0] wbm0_adr_o;
  input [31:0] wbm0_dat_o;
  input [3:0] wbm0_sel_o;
  input [2:0] wbm0_cti_o;
  input [1:0] wbm0_bte_o;
  output [31:0] wbm0_dat_i;
  output [31:0] wbs0_adr_i;
  output [7:0] wbs0_dat_i;
  output [2:0] wbs0_cti_i;
  output [1:0] wbs0_bte_i;
  input [7:0] wbs0_dat_o;
  output [31:0] wbs1_adr_i;
  output [7:0] wbs1_dat_i;
  output [2:0] wbs1_cti_i;
  output [1:0] wbs1_bte_i;
  input [7:0] wbs1_dat_o;
  output [31:0] wbs2_adr_i;
  output [7:0] wbs2_dat_i;
  output [2:0] wbs2_cti_i;
  output [1:0] wbs2_bte_i;
  input [7:0] wbs2_dat_o;
  output [31:0] wbs3_adr_i;
  output [7:0] wbs3_dat_i;
  output [2:0] wbs3_cti_i;
  output [1:0] wbs3_bte_i;
  input [7:0] wbs3_dat_o;
  output [31:0] wbs4_adr_i;
  output [7:0] wbs4_dat_i;
  output [2:0] wbs4_cti_i;
  output [1:0] wbs4_bte_i;
  input [7:0] wbs4_dat_o;
  input wbm0_we_o, wbm0_cyc_o, wbm0_stb_o, wbs0_ack_o, wbs0_err_o, wbs0_rty_o,
         wbs1_ack_o, wbs1_err_o, wbs1_rty_o, wbs2_ack_o, wbs2_err_o,
         wbs2_rty_o, wbs3_ack_o, wbs3_err_o, wbs3_rty_o, wbs4_ack_o,
         wbs4_err_o, wbs4_rty_o, wb_clk, wb_rst;
  output wbm0_ack_i, wbm0_err_i, wbm0_rty_i, wbs0_we_i, wbs0_cyc_i, wbs0_stb_i,
         wbs1_we_i, wbs1_cyc_i, wbs1_stb_i, wbs2_we_i, wbs2_cyc_i, wbs2_stb_i,
         wbs3_we_i, wbs3_cyc_i, wbs3_stb_i, wbs4_we_i, wbs4_cyc_i, wbs4_stb_i;
  wire   wbm0_we_o, wbs4_stb_i, watchdog_err, n46, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98;
  assign wbs4_adr_i[31] = wbm0_adr_o[31];
  assign wbs3_adr_i[31] = wbm0_adr_o[31];
  assign wbs2_adr_i[31] = wbm0_adr_o[31];
  assign wbs1_adr_i[31] = wbm0_adr_o[31];
  assign wbs0_adr_i[31] = wbm0_adr_o[31];
  assign wbs4_adr_i[30] = wbm0_adr_o[30];
  assign wbs3_adr_i[30] = wbm0_adr_o[30];
  assign wbs2_adr_i[30] = wbm0_adr_o[30];
  assign wbs1_adr_i[30] = wbm0_adr_o[30];
  assign wbs0_adr_i[30] = wbm0_adr_o[30];
  assign wbs4_adr_i[29] = wbm0_adr_o[29];
  assign wbs3_adr_i[29] = wbm0_adr_o[29];
  assign wbs2_adr_i[29] = wbm0_adr_o[29];
  assign wbs1_adr_i[29] = wbm0_adr_o[29];
  assign wbs0_adr_i[29] = wbm0_adr_o[29];
  assign wbs4_adr_i[28] = wbm0_adr_o[28];
  assign wbs3_adr_i[28] = wbm0_adr_o[28];
  assign wbs2_adr_i[28] = wbm0_adr_o[28];
  assign wbs1_adr_i[28] = wbm0_adr_o[28];
  assign wbs0_adr_i[28] = wbm0_adr_o[28];
  assign wbs4_adr_i[27] = wbm0_adr_o[27];
  assign wbs3_adr_i[27] = wbm0_adr_o[27];
  assign wbs2_adr_i[27] = wbm0_adr_o[27];
  assign wbs1_adr_i[27] = wbm0_adr_o[27];
  assign wbs0_adr_i[27] = wbm0_adr_o[27];
  assign wbs4_adr_i[26] = wbm0_adr_o[26];
  assign wbs3_adr_i[26] = wbm0_adr_o[26];
  assign wbs2_adr_i[26] = wbm0_adr_o[26];
  assign wbs1_adr_i[26] = wbm0_adr_o[26];
  assign wbs0_adr_i[26] = wbm0_adr_o[26];
  assign wbs4_adr_i[25] = wbm0_adr_o[25];
  assign wbs3_adr_i[25] = wbm0_adr_o[25];
  assign wbs2_adr_i[25] = wbm0_adr_o[25];
  assign wbs1_adr_i[25] = wbm0_adr_o[25];
  assign wbs0_adr_i[25] = wbm0_adr_o[25];
  assign wbs4_adr_i[24] = wbm0_adr_o[24];
  assign wbs3_adr_i[24] = wbm0_adr_o[24];
  assign wbs2_adr_i[24] = wbm0_adr_o[24];
  assign wbs1_adr_i[24] = wbm0_adr_o[24];
  assign wbs0_adr_i[24] = wbm0_adr_o[24];
  assign wbs4_adr_i[23] = wbm0_adr_o[23];
  assign wbs3_adr_i[23] = wbm0_adr_o[23];
  assign wbs2_adr_i[23] = wbm0_adr_o[23];
  assign wbs1_adr_i[23] = wbm0_adr_o[23];
  assign wbs0_adr_i[23] = wbm0_adr_o[23];
  assign wbs4_adr_i[22] = wbm0_adr_o[22];
  assign wbs3_adr_i[22] = wbm0_adr_o[22];
  assign wbs2_adr_i[22] = wbm0_adr_o[22];
  assign wbs1_adr_i[22] = wbm0_adr_o[22];
  assign wbs0_adr_i[22] = wbm0_adr_o[22];
  assign wbs4_adr_i[21] = wbm0_adr_o[21];
  assign wbs3_adr_i[21] = wbm0_adr_o[21];
  assign wbs2_adr_i[21] = wbm0_adr_o[21];
  assign wbs1_adr_i[21] = wbm0_adr_o[21];
  assign wbs0_adr_i[21] = wbm0_adr_o[21];
  assign wbs4_adr_i[20] = wbm0_adr_o[20];
  assign wbs3_adr_i[20] = wbm0_adr_o[20];
  assign wbs2_adr_i[20] = wbm0_adr_o[20];
  assign wbs1_adr_i[20] = wbm0_adr_o[20];
  assign wbs0_adr_i[20] = wbm0_adr_o[20];
  assign wbs4_adr_i[19] = wbm0_adr_o[19];
  assign wbs3_adr_i[19] = wbm0_adr_o[19];
  assign wbs2_adr_i[19] = wbm0_adr_o[19];
  assign wbs1_adr_i[19] = wbm0_adr_o[19];
  assign wbs0_adr_i[19] = wbm0_adr_o[19];
  assign wbs4_adr_i[18] = wbm0_adr_o[18];
  assign wbs3_adr_i[18] = wbm0_adr_o[18];
  assign wbs2_adr_i[18] = wbm0_adr_o[18];
  assign wbs1_adr_i[18] = wbm0_adr_o[18];
  assign wbs0_adr_i[18] = wbm0_adr_o[18];
  assign wbs4_adr_i[17] = wbm0_adr_o[17];
  assign wbs3_adr_i[17] = wbm0_adr_o[17];
  assign wbs2_adr_i[17] = wbm0_adr_o[17];
  assign wbs1_adr_i[17] = wbm0_adr_o[17];
  assign wbs0_adr_i[17] = wbm0_adr_o[17];
  assign wbs4_adr_i[16] = wbm0_adr_o[16];
  assign wbs3_adr_i[16] = wbm0_adr_o[16];
  assign wbs2_adr_i[16] = wbm0_adr_o[16];
  assign wbs1_adr_i[16] = wbm0_adr_o[16];
  assign wbs0_adr_i[16] = wbm0_adr_o[16];
  assign wbs4_adr_i[15] = wbm0_adr_o[15];
  assign wbs3_adr_i[15] = wbm0_adr_o[15];
  assign wbs2_adr_i[15] = wbm0_adr_o[15];
  assign wbs1_adr_i[15] = wbm0_adr_o[15];
  assign wbs0_adr_i[15] = wbm0_adr_o[15];
  assign wbs4_adr_i[14] = wbm0_adr_o[14];
  assign wbs3_adr_i[14] = wbm0_adr_o[14];
  assign wbs2_adr_i[14] = wbm0_adr_o[14];
  assign wbs1_adr_i[14] = wbm0_adr_o[14];
  assign wbs0_adr_i[14] = wbm0_adr_o[14];
  assign wbs4_adr_i[13] = wbm0_adr_o[13];
  assign wbs3_adr_i[13] = wbm0_adr_o[13];
  assign wbs2_adr_i[13] = wbm0_adr_o[13];
  assign wbs1_adr_i[13] = wbm0_adr_o[13];
  assign wbs0_adr_i[13] = wbm0_adr_o[13];
  assign wbs4_adr_i[12] = wbm0_adr_o[12];
  assign wbs3_adr_i[12] = wbm0_adr_o[12];
  assign wbs2_adr_i[12] = wbm0_adr_o[12];
  assign wbs1_adr_i[12] = wbm0_adr_o[12];
  assign wbs0_adr_i[12] = wbm0_adr_o[12];
  assign wbs4_adr_i[11] = wbm0_adr_o[11];
  assign wbs3_adr_i[11] = wbm0_adr_o[11];
  assign wbs2_adr_i[11] = wbm0_adr_o[11];
  assign wbs1_adr_i[11] = wbm0_adr_o[11];
  assign wbs0_adr_i[11] = wbm0_adr_o[11];
  assign wbs4_adr_i[10] = wbm0_adr_o[10];
  assign wbs3_adr_i[10] = wbm0_adr_o[10];
  assign wbs2_adr_i[10] = wbm0_adr_o[10];
  assign wbs1_adr_i[10] = wbm0_adr_o[10];
  assign wbs0_adr_i[10] = wbm0_adr_o[10];
  assign wbs4_adr_i[9] = wbm0_adr_o[9];
  assign wbs3_adr_i[9] = wbm0_adr_o[9];
  assign wbs2_adr_i[9] = wbm0_adr_o[9];
  assign wbs1_adr_i[9] = wbm0_adr_o[9];
  assign wbs0_adr_i[9] = wbm0_adr_o[9];
  assign wbs4_adr_i[8] = wbm0_adr_o[8];
  assign wbs3_adr_i[8] = wbm0_adr_o[8];
  assign wbs2_adr_i[8] = wbm0_adr_o[8];
  assign wbs1_adr_i[8] = wbm0_adr_o[8];
  assign wbs0_adr_i[8] = wbm0_adr_o[8];
  assign wbs4_adr_i[7] = wbm0_adr_o[7];
  assign wbs3_adr_i[7] = wbm0_adr_o[7];
  assign wbs2_adr_i[7] = wbm0_adr_o[7];
  assign wbs1_adr_i[7] = wbm0_adr_o[7];
  assign wbs0_adr_i[7] = wbm0_adr_o[7];
  assign wbs4_adr_i[6] = wbm0_adr_o[6];
  assign wbs3_adr_i[6] = wbm0_adr_o[6];
  assign wbs2_adr_i[6] = wbm0_adr_o[6];
  assign wbs1_adr_i[6] = wbm0_adr_o[6];
  assign wbs0_adr_i[6] = wbm0_adr_o[6];
  assign wbs4_adr_i[5] = wbm0_adr_o[5];
  assign wbs3_adr_i[5] = wbm0_adr_o[5];
  assign wbs2_adr_i[5] = wbm0_adr_o[5];
  assign wbs1_adr_i[5] = wbm0_adr_o[5];
  assign wbs0_adr_i[5] = wbm0_adr_o[5];
  assign wbs4_adr_i[4] = wbm0_adr_o[4];
  assign wbs3_adr_i[4] = wbm0_adr_o[4];
  assign wbs2_adr_i[4] = wbm0_adr_o[4];
  assign wbs1_adr_i[4] = wbm0_adr_o[4];
  assign wbs0_adr_i[4] = wbm0_adr_o[4];
  assign wbs4_adr_i[3] = wbm0_adr_o[3];
  assign wbs3_adr_i[3] = wbm0_adr_o[3];
  assign wbs2_adr_i[3] = wbm0_adr_o[3];
  assign wbs1_adr_i[3] = wbm0_adr_o[3];
  assign wbs0_adr_i[3] = wbm0_adr_o[3];
  assign wbs4_adr_i[2] = wbm0_adr_o[2];
  assign wbs3_adr_i[2] = wbm0_adr_o[2];
  assign wbs2_adr_i[2] = wbm0_adr_o[2];
  assign wbs1_adr_i[2] = wbm0_adr_o[2];
  assign wbs0_adr_i[2] = wbm0_adr_o[2];
  assign wbs4_adr_i[1] = wbm0_adr_o[1];
  assign wbs3_adr_i[1] = wbm0_adr_o[1];
  assign wbs2_adr_i[1] = wbm0_adr_o[1];
  assign wbs1_adr_i[1] = wbm0_adr_o[1];
  assign wbs0_adr_i[1] = wbm0_adr_o[1];
  assign wbs4_adr_i[0] = wbm0_adr_o[0];
  assign wbs3_adr_i[0] = wbm0_adr_o[0];
  assign wbs2_adr_i[0] = wbm0_adr_o[0];
  assign wbs1_adr_i[0] = wbm0_adr_o[0];
  assign wbs0_adr_i[0] = wbm0_adr_o[0];
  assign wbs4_we_i = wbm0_we_o;
  assign wbs3_we_i = wbm0_we_o;
  assign wbs2_we_i = wbm0_we_o;
  assign wbs1_we_i = wbm0_we_o;
  assign wbs0_we_i = wbm0_we_o;
  assign wbs4_cti_i[2] = wbm0_cti_o[2];
  assign wbs3_cti_i[2] = wbm0_cti_o[2];
  assign wbs2_cti_i[2] = wbm0_cti_o[2];
  assign wbs1_cti_i[2] = wbm0_cti_o[2];
  assign wbs0_cti_i[2] = wbm0_cti_o[2];
  assign wbs4_cti_i[1] = wbm0_cti_o[1];
  assign wbs3_cti_i[1] = wbm0_cti_o[1];
  assign wbs2_cti_i[1] = wbm0_cti_o[1];
  assign wbs1_cti_i[1] = wbm0_cti_o[1];
  assign wbs0_cti_i[1] = wbm0_cti_o[1];
  assign wbs4_cti_i[0] = wbm0_cti_o[0];
  assign wbs3_cti_i[0] = wbm0_cti_o[0];
  assign wbs2_cti_i[0] = wbm0_cti_o[0];
  assign wbs1_cti_i[0] = wbm0_cti_o[0];
  assign wbs0_cti_i[0] = wbm0_cti_o[0];
  assign wbs4_bte_i[1] = wbm0_bte_o[1];
  assign wbs3_bte_i[1] = wbm0_bte_o[1];
  assign wbs2_bte_i[1] = wbm0_bte_o[1];
  assign wbs1_bte_i[1] = wbm0_bte_o[1];
  assign wbs0_bte_i[1] = wbm0_bte_o[1];
  assign wbs4_bte_i[0] = wbm0_bte_o[0];
  assign wbs3_bte_i[0] = wbm0_bte_o[0];
  assign wbs2_bte_i[0] = wbm0_bte_o[0];
  assign wbs1_bte_i[0] = wbm0_bte_o[0];
  assign wbs0_bte_i[0] = wbm0_bte_o[0];
  assign wbs4_cyc_i = wbs4_stb_i;
  assign wbs3_stb_i = wbs4_stb_i;
  assign wbs3_cyc_i = wbs4_stb_i;
  assign wbs2_stb_i = wbs4_stb_i;
  assign wbs2_cyc_i = wbs4_stb_i;
  assign wbs1_stb_i = wbs4_stb_i;
  assign wbs1_cyc_i = wbs4_stb_i;
  assign wbs0_stb_i = wbs4_stb_i;
  assign wbs0_cyc_i = wbs4_stb_i;
  assign wbs4_dat_i[7] = wbs0_dat_i[7];
  assign wbs3_dat_i[7] = wbs0_dat_i[7];
  assign wbs2_dat_i[7] = wbs0_dat_i[7];
  assign wbs1_dat_i[7] = wbs0_dat_i[7];
  assign wbs4_dat_i[6] = wbs0_dat_i[6];
  assign wbs3_dat_i[6] = wbs0_dat_i[6];
  assign wbs2_dat_i[6] = wbs0_dat_i[6];
  assign wbs1_dat_i[6] = wbs0_dat_i[6];
  assign wbs4_dat_i[5] = wbs0_dat_i[5];
  assign wbs3_dat_i[5] = wbs0_dat_i[5];
  assign wbs2_dat_i[5] = wbs0_dat_i[5];
  assign wbs1_dat_i[5] = wbs0_dat_i[5];
  assign wbs4_dat_i[4] = wbs0_dat_i[4];
  assign wbs3_dat_i[4] = wbs0_dat_i[4];
  assign wbs2_dat_i[4] = wbs0_dat_i[4];
  assign wbs1_dat_i[4] = wbs0_dat_i[4];
  assign wbs4_dat_i[3] = wbs0_dat_i[3];
  assign wbs3_dat_i[3] = wbs0_dat_i[3];
  assign wbs2_dat_i[3] = wbs0_dat_i[3];
  assign wbs1_dat_i[3] = wbs0_dat_i[3];
  assign wbs4_dat_i[2] = wbs0_dat_i[2];
  assign wbs3_dat_i[2] = wbs0_dat_i[2];
  assign wbs2_dat_i[2] = wbs0_dat_i[2];
  assign wbs1_dat_i[2] = wbs0_dat_i[2];
  assign wbs4_dat_i[1] = wbs0_dat_i[1];
  assign wbs3_dat_i[1] = wbs0_dat_i[1];
  assign wbs2_dat_i[1] = wbs0_dat_i[1];
  assign wbs1_dat_i[1] = wbs0_dat_i[1];
  assign wbs4_dat_i[0] = wbs0_dat_i[0];
  assign wbs3_dat_i[0] = wbs0_dat_i[0];
  assign wbs2_dat_i[0] = wbs0_dat_i[0];
  assign wbs1_dat_i[0] = wbs0_dat_i[0];

  DFFQ_X1M_A9TH watchdog_err_reg ( .D(n46), .CK(wb_clk), .Q(watchdog_err) );
  INV_X1B_A9TH U92 ( .A(n75), .Y(n76) );
  INV_X1B_A9TH U93 ( .A(n77), .Y(n83) );
  INV_X1B_A9TH U94 ( .A(n89), .Y(n71) );
  INV_X1B_A9TH U95 ( .A(n88), .Y(n70) );
  INV_X1B_A9TH U96 ( .A(n86), .Y(n87) );
  INV_X1B_A9TH U97 ( .A(wbs0_dat_o[0]), .Y(n90) );
  INV_X1B_A9TH U98 ( .A(wbs0_dat_o[1]), .Y(n91) );
  INV_X1B_A9TH U99 ( .A(wbs0_dat_o[2]), .Y(n92) );
  INV_X1B_A9TH U100 ( .A(wbs0_dat_o[3]), .Y(n93) );
  INV_X1B_A9TH U101 ( .A(wbs0_dat_o[4]), .Y(n94) );
  INV_X1B_A9TH U102 ( .A(wbs0_dat_o[5]), .Y(n95) );
  INV_X1B_A9TH U103 ( .A(wbs0_dat_o[6]), .Y(n96) );
  INV_X1B_A9TH U104 ( .A(wbm0_sel_o[3]), .Y(n98) );
  INV_X1B_A9TH U105 ( .A(wbs0_dat_o[7]), .Y(n97) );
  INV_X1B_A9TH U106 ( .A(watchdog_err), .Y(n81) );
  TIELO_X1M_A9TH U107 ( .Y(n46) );
  NOR3_X1M_A9TH U108 ( .A(wbm0_sel_o[3]), .B(wbm0_sel_o[2]), .C(wbm0_sel_o[1]), 
        .Y(n86) );
  AOI22_X1M_A9TH U109 ( .A0(wbm0_sel_o[3]), .A1(wbm0_dat_o[31]), .B0(n86), 
        .B1(wbm0_dat_o[7]), .Y(n57) );
  NAND2_X1M_A9TH U110 ( .A(wbm0_sel_o[2]), .B(n98), .Y(n89) );
  NAND2_X1M_A9TH U112 ( .A(n55), .B(wbm0_sel_o[1]), .Y(n88) );
  AOI22_X1M_A9TH U113 ( .A0(n71), .A1(wbm0_dat_o[23]), .B0(n70), .B1(
        wbm0_dat_o[15]), .Y(n56) );
  NAND2_X1M_A9TH U114 ( .A(n57), .B(n56), .Y(wbs0_dat_i[7]) );
  AOI22_X1M_A9TH U115 ( .A0(wbm0_sel_o[3]), .A1(wbm0_dat_o[25]), .B0(n86), 
        .B1(wbm0_dat_o[1]), .Y(n59) );
  AOI22_X1M_A9TH U116 ( .A0(n71), .A1(wbm0_dat_o[17]), .B0(n70), .B1(
        wbm0_dat_o[9]), .Y(n58) );
  NAND2_X1M_A9TH U117 ( .A(n59), .B(n58), .Y(wbs0_dat_i[1]) );
  AOI22_X1M_A9TH U118 ( .A0(wbm0_sel_o[3]), .A1(wbm0_dat_o[24]), .B0(n86), 
        .B1(wbm0_dat_o[0]), .Y(n61) );
  AOI22_X1M_A9TH U119 ( .A0(n71), .A1(wbm0_dat_o[16]), .B0(n70), .B1(
        wbm0_dat_o[8]), .Y(n60) );
  NAND2_X1M_A9TH U120 ( .A(n61), .B(n60), .Y(wbs0_dat_i[0]) );
  AOI22_X1M_A9TH U121 ( .A0(wbm0_sel_o[3]), .A1(wbm0_dat_o[26]), .B0(n86), 
        .B1(wbm0_dat_o[2]), .Y(n63) );
  AOI22_X1M_A9TH U122 ( .A0(n71), .A1(wbm0_dat_o[18]), .B0(n70), .B1(
        wbm0_dat_o[10]), .Y(n62) );
  NAND2_X1M_A9TH U123 ( .A(n63), .B(n62), .Y(wbs0_dat_i[2]) );
  AOI22_X1M_A9TH U124 ( .A0(wbm0_sel_o[3]), .A1(wbm0_dat_o[30]), .B0(n86), 
        .B1(wbm0_dat_o[6]), .Y(n65) );
  AOI22_X1M_A9TH U125 ( .A0(n71), .A1(wbm0_dat_o[22]), .B0(n70), .B1(
        wbm0_dat_o[14]), .Y(n64) );
  NAND2_X1M_A9TH U126 ( .A(n65), .B(n64), .Y(wbs0_dat_i[6]) );
  AOI22_X1M_A9TH U127 ( .A0(wbm0_sel_o[3]), .A1(wbm0_dat_o[29]), .B0(n86), 
        .B1(wbm0_dat_o[5]), .Y(n67) );
  AOI22_X1M_A9TH U128 ( .A0(n71), .A1(wbm0_dat_o[21]), .B0(n70), .B1(
        wbm0_dat_o[13]), .Y(n66) );
  NAND2_X1M_A9TH U129 ( .A(n67), .B(n66), .Y(wbs0_dat_i[5]) );
  AOI22_X1M_A9TH U130 ( .A0(wbm0_sel_o[3]), .A1(wbm0_dat_o[27]), .B0(n86), 
        .B1(wbm0_dat_o[3]), .Y(n69) );
  AOI22_X1M_A9TH U131 ( .A0(n71), .A1(wbm0_dat_o[19]), .B0(n70), .B1(
        wbm0_dat_o[11]), .Y(n68) );
  NAND2_X1M_A9TH U132 ( .A(n69), .B(n68), .Y(wbs0_dat_i[3]) );
  AOI22_X1M_A9TH U133 ( .A0(wbm0_sel_o[3]), .A1(wbm0_dat_o[28]), .B0(n86), 
        .B1(wbm0_dat_o[4]), .Y(n73) );
  AOI22_X1M_A9TH U134 ( .A0(n71), .A1(wbm0_dat_o[20]), .B0(n70), .B1(
        wbm0_dat_o[12]), .Y(n72) );
  NAND2_X1M_A9TH U135 ( .A(n73), .B(n72), .Y(wbs0_dat_i[4]) );
  OR4_X1M_A9TH U136 ( .A(wbm0_adr_o[28]), .B(wbm0_adr_o[29]), .C(
        wbm0_adr_o[30]), .D(wbm0_adr_o[31]), .Y(n74) );
  NOR3_X1M_A9TH U137 ( .A(wbm0_adr_o[26]), .B(wbm0_adr_o[27]), .C(n74), .Y(n75) );
  NOR3_X1M_A9TH U138 ( .A(n76), .B(wbm0_adr_o[24]), .C(wbm0_adr_o[25]), .Y(n77) );
  AND2_X1M_A9TH U139 ( .A(n77), .B(wbm0_stb_o), .Y(wbs4_stb_i) );
  NOR3_X1M_A9TH U141 ( .A(wbs4_ack_o), .B(wbs0_ack_o), .C(wbs3_ack_o), .Y(n78)
         );
  AOI21_X1M_A9TH U142 ( .A0(n79), .A1(n78), .B0(n83), .Y(wbm0_ack_i) );
  NOR2_X1A_A9TH U143 ( .A(wbs4_err_o), .B(wbs0_err_o), .Y(n82) );
  NOR3_X1M_A9TH U144 ( .A(wbs2_err_o), .B(wbs3_err_o), .C(wbs1_err_o), .Y(n80)
         );
  AOI32_X1M_A9TH U145 ( .A0(n82), .A1(n81), .A2(n80), .B0(n83), .B1(n81), .Y(
        wbm0_err_i) );
  NOR3_X1M_A9TH U147 ( .A(wbs4_rty_o), .B(wbs0_rty_o), .C(wbs3_rty_o), .Y(n84)
         );
  AOI21_X1M_A9TH U148 ( .A0(n85), .A1(n84), .B0(n83), .Y(wbm0_rty_i) );
  NOR2_X1M_A9TH U149 ( .A(n87), .B(n90), .Y(wbm0_dat_i[0]) );
  NOR2_X1M_A9TH U150 ( .A(n87), .B(n91), .Y(wbm0_dat_i[1]) );
  NOR2_X1M_A9TH U151 ( .A(n87), .B(n92), .Y(wbm0_dat_i[2]) );
  NOR2_X1M_A9TH U152 ( .A(n87), .B(n93), .Y(wbm0_dat_i[3]) );
  NOR2_X1M_A9TH U153 ( .A(n87), .B(n94), .Y(wbm0_dat_i[4]) );
  NOR2_X1M_A9TH U154 ( .A(n87), .B(n95), .Y(wbm0_dat_i[5]) );
  NOR2_X1M_A9TH U155 ( .A(n87), .B(n96), .Y(wbm0_dat_i[6]) );
  NOR2_X1M_A9TH U156 ( .A(n87), .B(n97), .Y(wbm0_dat_i[7]) );
  NOR2_X1M_A9TH U157 ( .A(n88), .B(n90), .Y(wbm0_dat_i[8]) );
  NOR2_X1M_A9TH U158 ( .A(n88), .B(n91), .Y(wbm0_dat_i[9]) );
  NOR2_X1M_A9TH U159 ( .A(n88), .B(n92), .Y(wbm0_dat_i[10]) );
  NOR2_X1M_A9TH U160 ( .A(n88), .B(n93), .Y(wbm0_dat_i[11]) );
  NOR2_X1M_A9TH U161 ( .A(n88), .B(n94), .Y(wbm0_dat_i[12]) );
  NOR2_X1M_A9TH U162 ( .A(n88), .B(n95), .Y(wbm0_dat_i[13]) );
  NOR2_X1M_A9TH U163 ( .A(n88), .B(n96), .Y(wbm0_dat_i[14]) );
  NOR2_X1M_A9TH U164 ( .A(n88), .B(n97), .Y(wbm0_dat_i[15]) );
  NOR2_X1M_A9TH U165 ( .A(n89), .B(n90), .Y(wbm0_dat_i[16]) );
  NOR2_X1M_A9TH U166 ( .A(n89), .B(n91), .Y(wbm0_dat_i[17]) );
  NOR2_X1M_A9TH U167 ( .A(n89), .B(n92), .Y(wbm0_dat_i[18]) );
  NOR2_X1M_A9TH U168 ( .A(n89), .B(n93), .Y(wbm0_dat_i[19]) );
  NOR2_X1M_A9TH U169 ( .A(n89), .B(n94), .Y(wbm0_dat_i[20]) );
  NOR2_X1M_A9TH U170 ( .A(n89), .B(n95), .Y(wbm0_dat_i[21]) );
  NOR2_X1M_A9TH U171 ( .A(n89), .B(n96), .Y(wbm0_dat_i[22]) );
  NOR2_X1M_A9TH U172 ( .A(n89), .B(n97), .Y(wbm0_dat_i[23]) );
  NOR2_X1M_A9TH U173 ( .A(n98), .B(n90), .Y(wbm0_dat_i[24]) );
  NOR2_X1M_A9TH U174 ( .A(n98), .B(n91), .Y(wbm0_dat_i[25]) );
  NOR2_X1M_A9TH U175 ( .A(n98), .B(n92), .Y(wbm0_dat_i[26]) );
  NOR2_X1M_A9TH U176 ( .A(n98), .B(n93), .Y(wbm0_dat_i[27]) );
  NOR2_X1M_A9TH U177 ( .A(n98), .B(n94), .Y(wbm0_dat_i[28]) );
  NOR2_X1M_A9TH U178 ( .A(n98), .B(n95), .Y(wbm0_dat_i[29]) );
  NOR2_X1M_A9TH U179 ( .A(n98), .B(n96), .Y(wbm0_dat_i[30]) );
  NOR2_X1M_A9TH U180 ( .A(n98), .B(n97), .Y(wbm0_dat_i[31]) );
  NOR2_X1M_A9TH U111 ( .A(wbm0_sel_o[3]), .B(wbm0_sel_o[2]), .Y(n55) );
  NOR2_X1M_A9TH U140 ( .A(wbs1_rty_o), .B(wbs2_rty_o), .Y(n85) );
  NOR2_X1M_A9TH U146 ( .A(wbs1_ack_o), .B(wbs2_ack_o), .Y(n79) );
endmodule

