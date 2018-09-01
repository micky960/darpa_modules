/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : M-2016.12-SP2
// Date      : Wed Jul  4 09:42:46 2018
/////////////////////////////////////////////////////////////


module arbiter_ibus ( wbm_adr_o, wbm_dat_o, wbm_sel_o, wbm_we_o, wbm_cyc_o, 
        wbm_stb_o, wbm_cti_o, wbm_bte_o, wbm_dat_i, wbm_ack_i, wbm_err_i, 
        wbm_rty_i, wbs0_adr_i, wbs0_dat_i, wbs0_sel_i, wbs0_we_i, wbs0_cyc_i, 
        wbs0_stb_i, wbs0_cti_i, wbs0_bte_i, wbs0_dat_o, wbs0_ack_o, wbs0_err_o, 
        wbs0_rty_o, wbs1_adr_i, wbs1_dat_i, wbs1_sel_i, wbs1_we_i, wbs1_cyc_i, 
        wbs1_stb_i, wbs1_cti_i, wbs1_bte_i, wbs1_dat_o, wbs1_ack_o, wbs1_err_o, 
        wbs1_rty_o, wb_clk, wb_rst );
  input [31:0] wbm_adr_o;
  input [31:0] wbm_dat_o;
  input [3:0] wbm_sel_o;
  input [2:0] wbm_cti_o;
  input [1:0] wbm_bte_o;
  output [31:0] wbm_dat_i;
  output [31:0] wbs0_adr_i;
  output [31:0] wbs0_dat_i;
  output [3:0] wbs0_sel_i;
  output [2:0] wbs0_cti_i;
  output [1:0] wbs0_bte_i;
  input [31:0] wbs0_dat_o;
  output [31:0] wbs1_adr_i;
  output [31:0] wbs1_dat_i;
  output [3:0] wbs1_sel_i;
  output [2:0] wbs1_cti_i;
  output [1:0] wbs1_bte_i;
  input [31:0] wbs1_dat_o;
  input wbm_we_o, wbm_cyc_o, wbm_stb_o, wbs0_ack_o, wbs0_err_o, wbs0_rty_o,
         wbs1_ack_o, wbs1_err_o, wbs1_rty_o, wb_clk, wb_rst;
  output wbm_ack_i, wbm_err_i, wbm_rty_i, wbs0_we_i, wbs0_cyc_i, wbs0_stb_i,
         wbs1_we_i, wbs1_cyc_i, wbs1_stb_i;
  wire   wbm_we_o, wbm_stb_r, wbm_stb_edge, wbm_stb_edge_r, wbm_ack_i_r, N31,
         watchdog_err, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62;
  wire   [6:0] watchdog_timer;
  assign wbs1_adr_i[31] = wbm_adr_o[31];
  assign wbs0_adr_i[31] = wbm_adr_o[31];
  assign wbs1_adr_i[30] = wbm_adr_o[30];
  assign wbs0_adr_i[30] = wbm_adr_o[30];
  assign wbs1_adr_i[29] = wbm_adr_o[29];
  assign wbs0_adr_i[29] = wbm_adr_o[29];
  assign wbs1_adr_i[28] = wbm_adr_o[28];
  assign wbs0_adr_i[28] = wbm_adr_o[28];
  assign wbs1_adr_i[27] = wbm_adr_o[27];
  assign wbs0_adr_i[27] = wbm_adr_o[27];
  assign wbs1_adr_i[26] = wbm_adr_o[26];
  assign wbs0_adr_i[26] = wbm_adr_o[26];
  assign wbs1_adr_i[25] = wbm_adr_o[25];
  assign wbs0_adr_i[25] = wbm_adr_o[25];
  assign wbs1_adr_i[24] = wbm_adr_o[24];
  assign wbs0_adr_i[24] = wbm_adr_o[24];
  assign wbs1_adr_i[23] = wbm_adr_o[23];
  assign wbs0_adr_i[23] = wbm_adr_o[23];
  assign wbs1_adr_i[22] = wbm_adr_o[22];
  assign wbs0_adr_i[22] = wbm_adr_o[22];
  assign wbs1_adr_i[21] = wbm_adr_o[21];
  assign wbs0_adr_i[21] = wbm_adr_o[21];
  assign wbs1_adr_i[20] = wbm_adr_o[20];
  assign wbs0_adr_i[20] = wbm_adr_o[20];
  assign wbs1_adr_i[19] = wbm_adr_o[19];
  assign wbs0_adr_i[19] = wbm_adr_o[19];
  assign wbs1_adr_i[18] = wbm_adr_o[18];
  assign wbs0_adr_i[18] = wbm_adr_o[18];
  assign wbs1_adr_i[17] = wbm_adr_o[17];
  assign wbs0_adr_i[17] = wbm_adr_o[17];
  assign wbs1_adr_i[16] = wbm_adr_o[16];
  assign wbs0_adr_i[16] = wbm_adr_o[16];
  assign wbs1_adr_i[15] = wbm_adr_o[15];
  assign wbs0_adr_i[15] = wbm_adr_o[15];
  assign wbs1_adr_i[14] = wbm_adr_o[14];
  assign wbs0_adr_i[14] = wbm_adr_o[14];
  assign wbs1_adr_i[13] = wbm_adr_o[13];
  assign wbs0_adr_i[13] = wbm_adr_o[13];
  assign wbs1_adr_i[12] = wbm_adr_o[12];
  assign wbs0_adr_i[12] = wbm_adr_o[12];
  assign wbs1_adr_i[11] = wbm_adr_o[11];
  assign wbs0_adr_i[11] = wbm_adr_o[11];
  assign wbs1_adr_i[10] = wbm_adr_o[10];
  assign wbs0_adr_i[10] = wbm_adr_o[10];
  assign wbs1_adr_i[9] = wbm_adr_o[9];
  assign wbs0_adr_i[9] = wbm_adr_o[9];
  assign wbs1_adr_i[8] = wbm_adr_o[8];
  assign wbs0_adr_i[8] = wbm_adr_o[8];
  assign wbs1_adr_i[7] = wbm_adr_o[7];
  assign wbs0_adr_i[7] = wbm_adr_o[7];
  assign wbs1_adr_i[6] = wbm_adr_o[6];
  assign wbs0_adr_i[6] = wbm_adr_o[6];
  assign wbs1_adr_i[5] = wbm_adr_o[5];
  assign wbs0_adr_i[5] = wbm_adr_o[5];
  assign wbs1_adr_i[4] = wbm_adr_o[4];
  assign wbs0_adr_i[4] = wbm_adr_o[4];
  assign wbs1_adr_i[3] = wbm_adr_o[3];
  assign wbs0_adr_i[3] = wbm_adr_o[3];
  assign wbs1_adr_i[2] = wbm_adr_o[2];
  assign wbs0_adr_i[2] = wbm_adr_o[2];
  assign wbs1_adr_i[1] = wbm_adr_o[1];
  assign wbs0_adr_i[1] = wbm_adr_o[1];
  assign wbs1_adr_i[0] = wbm_adr_o[0];
  assign wbs0_adr_i[0] = wbm_adr_o[0];
  assign wbs1_dat_i[31] = wbm_dat_o[31];
  assign wbs0_dat_i[31] = wbm_dat_o[31];
  assign wbs1_dat_i[30] = wbm_dat_o[30];
  assign wbs0_dat_i[30] = wbm_dat_o[30];
  assign wbs1_dat_i[29] = wbm_dat_o[29];
  assign wbs0_dat_i[29] = wbm_dat_o[29];
  assign wbs1_dat_i[28] = wbm_dat_o[28];
  assign wbs0_dat_i[28] = wbm_dat_o[28];
  assign wbs1_dat_i[27] = wbm_dat_o[27];
  assign wbs0_dat_i[27] = wbm_dat_o[27];
  assign wbs1_dat_i[26] = wbm_dat_o[26];
  assign wbs0_dat_i[26] = wbm_dat_o[26];
  assign wbs1_dat_i[25] = wbm_dat_o[25];
  assign wbs0_dat_i[25] = wbm_dat_o[25];
  assign wbs1_dat_i[24] = wbm_dat_o[24];
  assign wbs0_dat_i[24] = wbm_dat_o[24];
  assign wbs1_dat_i[23] = wbm_dat_o[23];
  assign wbs0_dat_i[23] = wbm_dat_o[23];
  assign wbs1_dat_i[22] = wbm_dat_o[22];
  assign wbs0_dat_i[22] = wbm_dat_o[22];
  assign wbs1_dat_i[21] = wbm_dat_o[21];
  assign wbs0_dat_i[21] = wbm_dat_o[21];
  assign wbs1_dat_i[20] = wbm_dat_o[20];
  assign wbs0_dat_i[20] = wbm_dat_o[20];
  assign wbs1_dat_i[19] = wbm_dat_o[19];
  assign wbs0_dat_i[19] = wbm_dat_o[19];
  assign wbs1_dat_i[18] = wbm_dat_o[18];
  assign wbs0_dat_i[18] = wbm_dat_o[18];
  assign wbs1_dat_i[17] = wbm_dat_o[17];
  assign wbs0_dat_i[17] = wbm_dat_o[17];
  assign wbs1_dat_i[16] = wbm_dat_o[16];
  assign wbs0_dat_i[16] = wbm_dat_o[16];
  assign wbs1_dat_i[15] = wbm_dat_o[15];
  assign wbs0_dat_i[15] = wbm_dat_o[15];
  assign wbs1_dat_i[14] = wbm_dat_o[14];
  assign wbs0_dat_i[14] = wbm_dat_o[14];
  assign wbs1_dat_i[13] = wbm_dat_o[13];
  assign wbs0_dat_i[13] = wbm_dat_o[13];
  assign wbs1_dat_i[12] = wbm_dat_o[12];
  assign wbs0_dat_i[12] = wbm_dat_o[12];
  assign wbs1_dat_i[11] = wbm_dat_o[11];
  assign wbs0_dat_i[11] = wbm_dat_o[11];
  assign wbs1_dat_i[10] = wbm_dat_o[10];
  assign wbs0_dat_i[10] = wbm_dat_o[10];
  assign wbs1_dat_i[9] = wbm_dat_o[9];
  assign wbs0_dat_i[9] = wbm_dat_o[9];
  assign wbs1_dat_i[8] = wbm_dat_o[8];
  assign wbs0_dat_i[8] = wbm_dat_o[8];
  assign wbs1_dat_i[7] = wbm_dat_o[7];
  assign wbs0_dat_i[7] = wbm_dat_o[7];
  assign wbs1_dat_i[6] = wbm_dat_o[6];
  assign wbs0_dat_i[6] = wbm_dat_o[6];
  assign wbs1_dat_i[5] = wbm_dat_o[5];
  assign wbs0_dat_i[5] = wbm_dat_o[5];
  assign wbs1_dat_i[4] = wbm_dat_o[4];
  assign wbs0_dat_i[4] = wbm_dat_o[4];
  assign wbs1_dat_i[3] = wbm_dat_o[3];
  assign wbs0_dat_i[3] = wbm_dat_o[3];
  assign wbs1_dat_i[2] = wbm_dat_o[2];
  assign wbs0_dat_i[2] = wbm_dat_o[2];
  assign wbs1_dat_i[1] = wbm_dat_o[1];
  assign wbs0_dat_i[1] = wbm_dat_o[1];
  assign wbs1_dat_i[0] = wbm_dat_o[0];
  assign wbs0_dat_i[0] = wbm_dat_o[0];
  assign wbs1_sel_i[3] = wbm_sel_o[3];
  assign wbs0_sel_i[3] = wbm_sel_o[3];
  assign wbs1_sel_i[2] = wbm_sel_o[2];
  assign wbs0_sel_i[2] = wbm_sel_o[2];
  assign wbs1_sel_i[1] = wbm_sel_o[1];
  assign wbs0_sel_i[1] = wbm_sel_o[1];
  assign wbs1_sel_i[0] = wbm_sel_o[0];
  assign wbs0_sel_i[0] = wbm_sel_o[0];
  assign wbs1_we_i = wbm_we_o;
  assign wbs0_we_i = wbm_we_o;
  assign wbs1_cti_i[2] = wbm_cti_o[2];
  assign wbs0_cti_i[2] = wbm_cti_o[2];
  assign wbs1_cti_i[1] = wbm_cti_o[1];
  assign wbs0_cti_i[1] = wbm_cti_o[1];
  assign wbs1_cti_i[0] = wbm_cti_o[0];
  assign wbs0_cti_i[0] = wbm_cti_o[0];
  assign wbs1_bte_i[1] = wbm_bte_o[1];
  assign wbs0_bte_i[1] = wbm_bte_o[1];
  assign wbs1_bte_i[0] = wbm_bte_o[0];
  assign wbs0_bte_i[0] = wbm_bte_o[0];

  DFFQ_X1M_A9TH wbm_stb_r_reg ( .D(wbm_stb_o), .CK(wb_clk), .Q(wbm_stb_r) );
  DFFQ_X1M_A9TH wbm_stb_edge_r_reg ( .D(wbm_stb_edge), .CK(wb_clk), .Q(
        wbm_stb_edge_r) );
  DFFQ_X1M_A9TH wbm_ack_i_r_reg ( .D(wbm_ack_i), .CK(wb_clk), .Q(wbm_ack_i_r)
         );
  DFFQ_X1M_A9TH watchdog_timer_reg_0_ ( .D(n30), .CK(wb_clk), .Q(
        watchdog_timer[0]) );
  DFFQ_X1M_A9TH watchdog_timer_reg_6_ ( .D(n29), .CK(wb_clk), .Q(
        watchdog_timer[6]) );
  DFFQ_X1M_A9TH watchdog_timer_reg_5_ ( .D(n28), .CK(wb_clk), .Q(
        watchdog_timer[5]) );
  DFFQ_X1M_A9TH watchdog_timer_reg_4_ ( .D(n27), .CK(wb_clk), .Q(
        watchdog_timer[4]) );
  DFFQ_X1M_A9TH watchdog_timer_reg_3_ ( .D(n26), .CK(wb_clk), .Q(
        watchdog_timer[3]) );
  DFFQ_X1M_A9TH watchdog_timer_reg_2_ ( .D(n25), .CK(wb_clk), .Q(
        watchdog_timer[2]) );
  DFFQ_X1M_A9TH watchdog_timer_reg_1_ ( .D(n24), .CK(wb_clk), .Q(
        watchdog_timer[1]) );
  DFFQ_X1M_A9TH watchdog_err_reg ( .D(N31), .CK(wb_clk), .Q(watchdog_err) );
  INV_X1B_A9TH U74 ( .A(watchdog_timer[2]), .Y(n58) );
  INV_X1B_A9TH U75 ( .A(watchdog_timer[4]), .Y(n54) );
  INV_X1B_A9TH U76 ( .A(watchdog_timer[6]), .Y(n50) );
  NAND4XXXB_X1M_A9TH U78 ( .DN(wbm_adr_o[20]), .A(n36), .B(n35), .C(n34), .Y(
        n37) );
  NAND4XXXB_X1M_A9TH U79 ( .DN(wbm_adr_o[23]), .A(n33), .B(n32), .C(n31), .Y(
        n38) );
  INV_X1B_A9TH U80 ( .A(wbm_adr_o[14]), .Y(n36) );
  INV_X1M_A9TH U81 ( .A(n43), .Y(n44) );
  INV_X1B_A9TH U82 ( .A(wbm_stb_o), .Y(n40) );
  OR4_X1M_A9TH U83 ( .A(wbm_adr_o[31]), .B(wbm_adr_o[30]), .C(wbm_adr_o[29]), 
        .D(wbm_adr_o[28]), .Y(n39) );
  OR2_X1M_A9TH U84 ( .A(n42), .B(n39), .Y(n43) );
  NOR2_X1A_A9TH U85 ( .A(wbm_stb_r), .B(n40), .Y(wbm_stb_edge) );
  NAND2_X1M_A9TH U86 ( .A(watchdog_timer[1]), .B(watchdog_timer[0]), .Y(n59)
         );
  NOR2_X1A_A9TH U87 ( .A(n58), .B(n59), .Y(n57) );
  NAND2_X1M_A9TH U88 ( .A(watchdog_timer[3]), .B(n57), .Y(n55) );
  NOR2_X1A_A9TH U89 ( .A(n54), .B(n55), .Y(n53) );
  NAND2_X1M_A9TH U90 ( .A(watchdog_timer[5]), .B(n53), .Y(n51) );
  NOR2_X1A_A9TH U91 ( .A(n50), .B(n51), .Y(N31) );
  NOR3_X1M_A9TH U92 ( .A(wbm_adr_o[22]), .B(wbm_adr_o[21]), .C(wbm_adr_o[16]), 
        .Y(n33) );
  NOR3_X1M_A9TH U93 ( .A(wbm_adr_o[12]), .B(wbm_adr_o[26]), .C(wbm_adr_o[25]), 
        .Y(n32) );
  NOR3_X1M_A9TH U95 ( .A(wbm_adr_o[15]), .B(wbm_adr_o[13]), .C(wbm_adr_o[24]), 
        .Y(n35) );
  NOR3_X1M_A9TH U96 ( .A(wbm_adr_o[19]), .B(wbm_adr_o[18]), .C(wbm_adr_o[17]), 
        .Y(n34) );
  AND2_X1M_A9TH U97 ( .A(n42), .B(wbm_cyc_o), .Y(wbs0_cyc_i) );
  AND2_X1M_A9TH U98 ( .A(n42), .B(wbm_stb_o), .Y(wbs0_stb_i) );
  AND2_X1M_A9TH U99 ( .A(n44), .B(wbm_cyc_o), .Y(wbs1_cyc_i) );
  NOR2_X1M_A9TH U100 ( .A(n43), .B(n40), .Y(wbs1_stb_i) );
  AO22_X1M_A9TH U101 ( .A0(n42), .A1(wbs0_ack_o), .B0(n44), .B1(wbs1_ack_o), 
        .Y(wbm_ack_i) );
  AOI22_X1M_A9TH U102 ( .A0(n42), .A1(wbs0_err_o), .B0(n44), .B1(wbs1_err_o), 
        .Y(n41) );
  AO22_X1M_A9TH U104 ( .A0(n42), .A1(wbs0_rty_o), .B0(n44), .B1(wbs1_rty_o), 
        .Y(wbm_rty_i) );
  AO22_X1M_A9TH U105 ( .A0(n44), .A1(wbs1_dat_o[0]), .B0(wbs0_dat_o[0]), .B1(
        n43), .Y(wbm_dat_i[0]) );
  AO22_X1M_A9TH U106 ( .A0(n44), .A1(wbs1_dat_o[1]), .B0(wbs0_dat_o[1]), .B1(
        n43), .Y(wbm_dat_i[1]) );
  AO22_X1M_A9TH U107 ( .A0(n44), .A1(wbs1_dat_o[2]), .B0(wbs0_dat_o[2]), .B1(
        n43), .Y(wbm_dat_i[2]) );
  AO22_X1M_A9TH U108 ( .A0(n44), .A1(wbs1_dat_o[3]), .B0(wbs0_dat_o[3]), .B1(
        n43), .Y(wbm_dat_i[3]) );
  AO22_X1M_A9TH U109 ( .A0(n44), .A1(wbs1_dat_o[4]), .B0(wbs0_dat_o[4]), .B1(
        n43), .Y(wbm_dat_i[4]) );
  AO22_X1M_A9TH U110 ( .A0(n44), .A1(wbs1_dat_o[5]), .B0(wbs0_dat_o[5]), .B1(
        n43), .Y(wbm_dat_i[5]) );
  AO22_X1M_A9TH U111 ( .A0(n44), .A1(wbs1_dat_o[6]), .B0(wbs0_dat_o[6]), .B1(
        n43), .Y(wbm_dat_i[6]) );
  AO22_X1M_A9TH U112 ( .A0(n44), .A1(wbs1_dat_o[7]), .B0(wbs0_dat_o[7]), .B1(
        n43), .Y(wbm_dat_i[7]) );
  AO22_X1M_A9TH U113 ( .A0(n44), .A1(wbs1_dat_o[8]), .B0(wbs0_dat_o[8]), .B1(
        n43), .Y(wbm_dat_i[8]) );
  AO22_X1M_A9TH U114 ( .A0(n44), .A1(wbs1_dat_o[9]), .B0(wbs0_dat_o[9]), .B1(
        n43), .Y(wbm_dat_i[9]) );
  AO22_X1M_A9TH U115 ( .A0(n44), .A1(wbs1_dat_o[10]), .B0(wbs0_dat_o[10]), 
        .B1(n43), .Y(wbm_dat_i[10]) );
  AO22_X1M_A9TH U116 ( .A0(n44), .A1(wbs1_dat_o[11]), .B0(wbs0_dat_o[11]), 
        .B1(n43), .Y(wbm_dat_i[11]) );
  AO22_X1M_A9TH U117 ( .A0(n44), .A1(wbs1_dat_o[12]), .B0(wbs0_dat_o[12]), 
        .B1(n43), .Y(wbm_dat_i[12]) );
  AO22_X1M_A9TH U118 ( .A0(n44), .A1(wbs1_dat_o[13]), .B0(wbs0_dat_o[13]), 
        .B1(n43), .Y(wbm_dat_i[13]) );
  AO22_X1M_A9TH U119 ( .A0(n44), .A1(wbs1_dat_o[14]), .B0(wbs0_dat_o[14]), 
        .B1(n43), .Y(wbm_dat_i[14]) );
  AO22_X1M_A9TH U120 ( .A0(n44), .A1(wbs1_dat_o[15]), .B0(wbs0_dat_o[15]), 
        .B1(n43), .Y(wbm_dat_i[15]) );
  AO22_X1M_A9TH U121 ( .A0(n44), .A1(wbs1_dat_o[16]), .B0(wbs0_dat_o[16]), 
        .B1(n43), .Y(wbm_dat_i[16]) );
  AO22_X1M_A9TH U122 ( .A0(n44), .A1(wbs1_dat_o[17]), .B0(wbs0_dat_o[17]), 
        .B1(n43), .Y(wbm_dat_i[17]) );
  AO22_X1M_A9TH U123 ( .A0(n44), .A1(wbs1_dat_o[18]), .B0(wbs0_dat_o[18]), 
        .B1(n43), .Y(wbm_dat_i[18]) );
  AO22_X1M_A9TH U124 ( .A0(n44), .A1(wbs1_dat_o[19]), .B0(wbs0_dat_o[19]), 
        .B1(n43), .Y(wbm_dat_i[19]) );
  AO22_X1M_A9TH U125 ( .A0(n44), .A1(wbs1_dat_o[20]), .B0(wbs0_dat_o[20]), 
        .B1(n43), .Y(wbm_dat_i[20]) );
  AO22_X1M_A9TH U126 ( .A0(n44), .A1(wbs1_dat_o[21]), .B0(wbs0_dat_o[21]), 
        .B1(n43), .Y(wbm_dat_i[21]) );
  AO22_X1M_A9TH U127 ( .A0(n44), .A1(wbs1_dat_o[22]), .B0(wbs0_dat_o[22]), 
        .B1(n43), .Y(wbm_dat_i[22]) );
  AO22_X1M_A9TH U128 ( .A0(n44), .A1(wbs1_dat_o[23]), .B0(wbs0_dat_o[23]), 
        .B1(n43), .Y(wbm_dat_i[23]) );
  AO22_X1M_A9TH U129 ( .A0(n44), .A1(wbs1_dat_o[24]), .B0(wbs0_dat_o[24]), 
        .B1(n43), .Y(wbm_dat_i[24]) );
  AO22_X1M_A9TH U130 ( .A0(n44), .A1(wbs1_dat_o[25]), .B0(wbs0_dat_o[25]), 
        .B1(n43), .Y(wbm_dat_i[25]) );
  AO22_X1M_A9TH U131 ( .A0(n44), .A1(wbs1_dat_o[26]), .B0(wbs0_dat_o[26]), 
        .B1(n43), .Y(wbm_dat_i[26]) );
  AO22_X1M_A9TH U132 ( .A0(n44), .A1(wbs1_dat_o[27]), .B0(wbs0_dat_o[27]), 
        .B1(n43), .Y(wbm_dat_i[27]) );
  AO22_X1M_A9TH U133 ( .A0(n44), .A1(wbs1_dat_o[28]), .B0(wbs0_dat_o[28]), 
        .B1(n43), .Y(wbm_dat_i[28]) );
  AO22_X1M_A9TH U134 ( .A0(n44), .A1(wbs1_dat_o[29]), .B0(wbs0_dat_o[29]), 
        .B1(n43), .Y(wbm_dat_i[29]) );
  AO22_X1M_A9TH U135 ( .A0(n44), .A1(wbs1_dat_o[30]), .B0(wbs0_dat_o[30]), 
        .B1(n43), .Y(wbm_dat_i[30]) );
  AO22_X1M_A9TH U136 ( .A0(n44), .A1(wbs1_dat_o[31]), .B0(wbs0_dat_o[31]), 
        .B1(n43), .Y(wbm_dat_i[31]) );
  NOR2_X1A_A9TH U137 ( .A(wbm_ack_i_r), .B(wb_rst), .Y(n48) );
  NOR2_X1M_A9TH U138 ( .A(watchdog_timer[3]), .B(watchdog_timer[6]), .Y(n46)
         );
  NOR3_X1M_A9TH U140 ( .A(watchdog_timer[5]), .B(watchdog_timer[2]), .C(
        watchdog_timer[4]), .Y(n45) );
  AOI31_X1M_A9TH U141 ( .A0(n46), .A1(n62), .A2(n45), .B0(wbm_stb_edge_r), .Y(
        n47) );
  NAND2_X1M_A9TH U142 ( .A(n48), .B(n47), .Y(n60) );
  NAND2_X1M_A9TH U143 ( .A(n48), .B(wbm_stb_edge_r), .Y(n49) );
  OAI21_X1M_A9TH U144 ( .A0(n60), .A1(watchdog_timer[0]), .B0(n49), .Y(n30) );
  AOI211_X1M_A9TH U145 ( .A0(n50), .A1(n51), .B0(N31), .C0(n60), .Y(n29) );
  OAI21_X1M_A9TH U146 ( .A0(watchdog_timer[5]), .A1(n53), .B0(n51), .Y(n52) );
  NOR2_X1A_A9TH U147 ( .A(n60), .B(n52), .Y(n28) );
  AOI211_X1M_A9TH U148 ( .A0(n54), .A1(n55), .B0(n53), .C0(n60), .Y(n27) );
  OAI21_X1M_A9TH U149 ( .A0(watchdog_timer[3]), .A1(n57), .B0(n55), .Y(n56) );
  NOR2_X1A_A9TH U150 ( .A(n60), .B(n56), .Y(n26) );
  AOI211_X1M_A9TH U151 ( .A0(n58), .A1(n59), .B0(n57), .C0(n60), .Y(n25) );
  INV_X1B_A9TH U152 ( .A(n59), .Y(n61) );
  NOR3_X1M_A9TH U153 ( .A(n62), .B(n61), .C(n60), .Y(n24) );
  NOR2_X1M_A9TH U77 ( .A(wbm_adr_o[27]), .B(n39), .Y(n31) );
  NOR2_X1M_A9TH U94 ( .A(watchdog_timer[1]), .B(watchdog_timer[0]), .Y(n62) );
  NOR2_X1M_A9TH U103 ( .A(n38), .B(n37), .Y(n42) );
  NAND2B_X1M_A9TH U139 ( .AN(watchdog_err), .B(n41), .Y(wbm_err_i) );
endmodule

