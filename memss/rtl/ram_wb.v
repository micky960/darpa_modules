module ram_wb
  (
   // Inputs
   wbm0_adr_i, wbm0_bte_i, wbm0_cti_i, wbm0_cyc_i, wbm0_dat_i, wbm0_sel_i, 
   wbm0_stb_i, wbm0_we_i,
   // Outputs
   wbm0_ack_o, wbm0_err_o, wbm0_rty_o, wbm0_dat_o,
  
   // Inputs
   wbm1_adr_i, wbm1_bte_i, wbm1_cti_i, wbm1_cyc_i, wbm1_dat_i, wbm1_sel_i, 
   wbm1_stb_i, wbm1_we_i,
   // Outputs
   wbm1_ack_o, wbm1_err_o, wbm1_rty_o, wbm1_dat_o,

    // Inputs
   wbm2_adr_i, wbm2_bte_i, wbm2_cti_i, wbm2_cyc_i, wbm2_dat_i, wbm2_sel_i, 
   wbm2_stb_i, wbm2_we_i,
   // Outputs
   wbm2_ack_o, wbm2_err_o, wbm2_rty_o, wbm2_dat_o,
   gps_sfll_key, gps_fll_key, fir_coef_key, iir_coef_key,
   orp_sfll_key, orp_fll_key,

   // Clock, reset
   wb_clk_i, wb_rst_i
   );
   // Bus parameters
   parameter dw = 32;
   parameter aw = 32;
   // Memory parameters
   parameter mem_size_bytes = 32'h0002_0000; // 128KBytes
   parameter mem_adr_width = 17; //(log2(mem_span));

   input [aw-1:0]	wbm0_adr_i;
   input [1:0] 		wbm0_bte_i;
   input [2:0] 		wbm0_cti_i;
   input 		wbm0_cyc_i;
   input [dw-1:0] 	wbm0_dat_i;
   input [3:0] 		wbm0_sel_i;
   input 		wbm0_stb_i;
   input 		wbm0_we_i;
   
   output 		wbm0_ack_o;
   output 		wbm0_err_o;
   output 		wbm0_rty_o;
   output [dw-1:0] 	wbm0_dat_o;

   input [aw-1:0]	wbm1_adr_i;
   input [1:0] 		wbm1_bte_i;
   input [2:0] 		wbm1_cti_i;
   input 		wbm1_cyc_i;
   input [dw-1:0] 	wbm1_dat_i;
   input [3:0] 		wbm1_sel_i;
   input 		wbm1_stb_i;
   input 		wbm1_we_i;
   
   output 		wbm1_ack_o;
   output 		wbm1_err_o;
   output 		wbm1_rty_o;
   output [dw-1:0] 	wbm1_dat_o;
   
   output reg [127:0] 	gps_sfll_key;
   output reg [127:0] 	gps_fll_key;
   output reg [127:0] 	orp_sfll_key;
   output reg [127:0] 	orp_fll_key;
   output reg [127:0] 	fir_coef_key;
   output reg [127:0] 	iir_coef_key;

   input [aw-1:0]	wbm2_adr_i;
   input [1:0] 		wbm2_bte_i;
   input [2:0] 		wbm2_cti_i;
   input 		wbm2_cyc_i;
   input [dw-1:0] 	wbm2_dat_i;
   input [3:0] 		wbm2_sel_i;
   input 		wbm2_stb_i;
   input 		wbm2_we_i;
   
   output 		wbm2_ack_o;
   output 		wbm2_err_o;
   output 		wbm2_rty_o;
   output [dw-1:0] 	wbm2_dat_o;
   

   input 		wb_clk_i;
   input 		wb_rst_i;

   // Internal wires to actual RAM
   wire [aw-1:0] 	wbs_ram_adr_i;
   wire [1:0] 		wbs_ram_bte_i;
   wire [2:0] 		wbs_ram_cti_i;
   wire 		wbs_ram_cyc_i;
   wire [dw-1:0] 	wbs_ram_dat_i;
   wire [3:0] 		wbs_ram_sel_i;
   wire 		wbs_ram_stb_i;
   wire 		wbs_ram_we_i;
   
   wire 		wbs_ram_ack_o;
   wire 		wbs_ram_err_o;
   wire 		wbs_ram_rty_o;
   wire [dw-1:0] 	wbs_ram_dat_o;

   reg [2:0] 		input_select, last_selected;
   wire 		arb_for_wbm0, arb_for_wbm1, arb_for_wbm2;
   // Wires allowing selection of new input
   assign arb_for_wbm0 = (last_selected[1] | last_selected[2] | 
			  !wbm1_cyc_i | !wbm2_cyc_i) & !(|input_select);
   assign arb_for_wbm1 = (last_selected[0] | last_selected[2] | 
			  !wbm0_cyc_i | !wbm2_cyc_i) & !(|input_select);
   assign arb_for_wbm2 = (last_selected[0] | last_selected[1] | 
			  !wbm0_cyc_i | !wbm1_cyc_i) & !(|input_select);
   
   // Master select logic
   always @(posedge wb_clk_i)
     if (wb_rst_i)
       input_select <= 0;
     else if ((input_select[0] & !wbm0_cyc_i) | (input_select[1] & !wbm1_cyc_i)
	      | (input_select[2] & !wbm2_cyc_i))
       input_select <= 0;
     else if (!(&input_select) & wbm0_cyc_i & arb_for_wbm0)
       input_select <= 3'b001;
     else if (!(&input_select) & wbm1_cyc_i & arb_for_wbm1)
       input_select <= 3'b010;
     else if (!(&input_select) & wbm2_cyc_i & arb_for_wbm2)
       input_select <= 3'b100;
   
   always @(posedge wb_clk_i)
     if (wb_rst_i)
       last_selected <= 0;
     else if (!(&input_select) & wbm0_cyc_i & arb_for_wbm0)
       last_selected <= 3'b001;
     else if (!(&input_select) & wbm1_cyc_i & arb_for_wbm1)
       last_selected <= 3'b010;
     else if (!(&input_select) & wbm2_cyc_i & arb_for_wbm2)
       last_selected <= 3'b100;

      // Mux input signals to RAM (default to wbm0)
   assign wbs_ram_adr_i = (input_select[2]) ? wbm2_adr_i : 
			    (input_select[1]) ? wbm1_adr_i : 
			    (input_select[0]) ? wbm0_adr_i : 0;
   assign wbs_ram_bte_i = (input_select[2]) ? wbm2_bte_i : 
			    (input_select[1]) ? wbm1_bte_i : 
			    (input_select[0]) ? wbm0_bte_i : 0;
   assign wbs_ram_cti_i = (input_select[2]) ? wbm2_cti_i : 
			    (input_select[1]) ? wbm1_cti_i : 
			    (input_select[0]) ? wbm0_cti_i : 0;
   assign wbs_ram_cyc_i = (input_select[2]) ? wbm2_cyc_i : 
			    (input_select[1]) ? wbm1_cyc_i : 
			    (input_select[0]) ? wbm0_cyc_i : 0;
   assign wbs_ram_dat_i = (input_select[2]) ? wbm2_dat_i : 
			    (input_select[1]) ? wbm1_dat_i : 
			    (input_select[0]) ? wbm0_dat_i : 0;
   assign wbs_ram_sel_i = (input_select[2]) ? wbm2_sel_i : 
			    (input_select[1]) ? wbm1_sel_i : 
			    (input_select[0]) ? wbm0_sel_i : 0;
   assign wbs_ram_stb_i = (input_select[2]) ? wbm2_stb_i : 
			    (input_select[1]) ? wbm1_stb_i : 
			    (input_select[0]) ? wbm0_stb_i : 0;
   assign wbs_ram_we_i  = (input_select[2]) ? wbm2_we_i  :
			    (input_select[1]) ? wbm1_we_i  : 
			    (input_select[0]) ? wbm0_we_i : 0;

   // Output from RAM, gate the ACK, ERR, RTY signals appropriately
   assign wbm0_dat_o = wbs_ram_dat_o;
   assign wbm0_ack_o = wbs_ram_ack_o & input_select[0];
   assign wbm0_err_o = wbs_ram_err_o & input_select[0];   
   assign wbm0_rty_o = 0;

   assign wbm1_dat_o = wbs_ram_dat_o;
   assign wbm1_ack_o = wbs_ram_ack_o & input_select[1];
   assign wbm1_err_o = wbs_ram_err_o & input_select[1];
   assign wbm1_rty_o = 0;

   assign wbm2_dat_o = wbs_ram_dat_o;
   assign wbm2_ack_o = wbs_ram_ack_o & input_select[2];
   assign wbm2_err_o = wbs_ram_err_o & input_select[2];
   assign wbm2_rty_o = 0;
   
   ram_wb_b3 ram_wb_b3_0
     (
      // Outputs
      .wb_ack_o				(wbs_ram_ack_o),
      .wb_err_o				(wbs_ram_err_o),
      .wb_rty_o				(wbs_ram_rty_o),
      .wb_dat_o				(wbs_ram_dat_o),
      // Inputs
      .wb_adr_i				(wbs_ram_adr_i),
      .wb_bte_i				(wbs_ram_bte_i),
      .wb_cti_i				(wbs_ram_cti_i),
      .wb_cyc_i				(wbs_ram_cyc_i),
      .wb_dat_i				(wbs_ram_dat_i),
      .wb_sel_i				(wbs_ram_sel_i),
      .wb_stb_i				(wbs_ram_stb_i),
      .wb_we_i				(wbs_ram_we_i),
      .wb_clk_i				(wb_clk_i),
      .wb_rst_i				(wb_rst_i));

   defparam ram_wb_b3_0.aw = aw;
   defparam ram_wb_b3_0.dw = dw;
   defparam ram_wb_b3_0.mem_size_bytes = mem_size_bytes;
   defparam ram_wb_b3_0.mem_adr_width = mem_adr_width;


localparam  KEY_REG_ORP_SFLL0 = 20'h80000;
localparam  KEY_REG_ORP_SFLL1 = 20'h80004;
localparam  KEY_REG_ORP_SFLL2 = 20'h80008;
localparam  KEY_REG_ORP_SFLL3 = 20'h8000C;
localparam  KEY_REG_ORP_FLL0  = 20'h80010;
localparam  KEY_REG_ORP_FLL1  = 20'h80014;
localparam  KEY_REG_ORP_FLL2  = 20'h80018;
localparam  KEY_REG_ORP_FLL3  = 20'h8001C;

localparam  KEY_REG_GPS_SFLL0 = 20'h80020;
localparam  KEY_REG_GPS_SFLL1 = 20'h80024;
localparam  KEY_REG_GPS_SFLL2 = 20'h80028;
localparam  KEY_REG_GPS_SFLL3 = 20'h8002C;
localparam  KEY_REG_GPS_FLL0  = 20'h80030;
localparam  KEY_REG_GPS_FLL1  = 20'h80034;
localparam  KEY_REG_GPS_FLL2  = 20'h80038;
localparam  KEY_REG_GPS_FLL3  = 20'h8003C;

localparam  KEY_REG_FIR_COEF0 = 20'h80040;
localparam  KEY_REG_FIR_COEF1 = 20'h80044;
localparam  KEY_REG_FIR_COEF2 = 20'h80048;
localparam  KEY_REG_FIR_COEF3 = 20'h8004C;

localparam  KEY_REG_IIR_COEF0 = 20'h80050;
localparam  KEY_REG_IIR_COEF1 = 20'h80054;
localparam  KEY_REG_IIR_COEF2 = 20'h80058;
localparam  KEY_REG_IIR_COEF3 = 20'h8005C;



// FIFO Control Register and rx_reset, tx_reset signals
always @(posedge wb_clk_i or posedge wb_rst_i) begin
	if (wb_rst_i) begin
      orp_sfll_key  <= 128'b0;
      orp_fll_key   <= 128'b0;
      gps_sfll_key  <= 128'b0;
      gps_fll_key   <= 128'b0;
      fir_coef_key  <= 128'b0;
      iir_coef_key  <= 128'b0;
	end
	else if (wbm0_we_i) begin
      case(wbm0_adr_i[19:0])
        KEY_REG_ORP_SFLL0 :
		  orp_sfll_key[31:0]     <= #1 wbm0_dat_i;
        KEY_REG_ORP_SFLL1 :
		  orp_sfll_key[63:32]    <= #1 wbm0_dat_i;
        KEY_REG_ORP_SFLL2 :
		  orp_sfll_key[95:64]    <= #1 wbm0_dat_i;
        KEY_REG_ORP_SFLL3 :
		  orp_sfll_key[127:96]   <= #1 wbm0_dat_i;
        KEY_REG_ORP_FLL0 :
		  orp_fll_key[31:0]      <= #1 wbm0_dat_i;
        KEY_REG_ORP_FLL1 :
		  orp_fll_key[63:32]     <= #1 wbm0_dat_i;
        KEY_REG_ORP_FLL2 :
		  orp_fll_key[95:64]     <= #1 wbm0_dat_i;
        KEY_REG_ORP_FLL3 :
		  orp_fll_key[127:96]    <= #1 wbm0_dat_i;
        KEY_REG_GPS_SFLL0 :
		  gps_sfll_key[31:0]     <= #1 wbm0_dat_i;
        KEY_REG_GPS_SFLL1 :
		  gps_sfll_key[63:32]    <= #1 wbm0_dat_i;
        KEY_REG_GPS_SFLL2 :
		  gps_sfll_key[95:64]    <= #1 wbm0_dat_i;
        KEY_REG_GPS_SFLL3 :
		  gps_sfll_key[127:96]   <= #1 wbm0_dat_i;
        KEY_REG_GPS_FLL0 :
		  gps_fll_key[31:0]      <= #1 wbm0_dat_i;
        KEY_REG_GPS_FLL1 :
		  gps_fll_key[63:32]     <= #1 wbm0_dat_i;
        KEY_REG_GPS_FLL2 :
		  gps_fll_key[95:64]     <= #1 wbm0_dat_i;
        KEY_REG_GPS_FLL3 :
		  gps_fll_key[127:96]    <= #1 wbm0_dat_i;
        KEY_REG_FIR_COEF0 :
		  fir_coef_key[31:0]     <= #1 wbm0_dat_i;
        KEY_REG_FIR_COEF1 :
		  fir_coef_key[63:32]    <= #1 wbm0_dat_i;
        KEY_REG_FIR_COEF2 :
		  fir_coef_key[95:64]    <= #1 wbm0_dat_i;
        KEY_REG_FIR_COEF3 :
		  fir_coef_key[127:96]   <= #1 wbm0_dat_i;
        KEY_REG_IIR_COEF0 :
		  iir_coef_key[31:0]     <= #1 wbm0_dat_i;
        KEY_REG_IIR_COEF1 :
		  iir_coef_key[63:32]    <= #1 wbm0_dat_i;
        KEY_REG_IIR_COEF2 :
		  iir_coef_key[95:64]    <= #1 wbm0_dat_i;
        KEY_REG_IIR_COEF3 :
		  iir_coef_key[127:96]   <= #1 wbm0_dat_i;
      endcase
	end
end


endmodule // ram_wb


