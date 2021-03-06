
module nes_nios (
	clk_50_clk,
	nes_cpu_clk,
	ppu_clk,
	ppu_slow_clk,
	sdram_addr,
	sdram_ba,
	sdram_cas_n,
	sdram_cke,
	sdram_cs_n,
	sdram_dq,
	sdram_dqm,
	sdram_ras_n,
	sdram_we_n,
	shift_clk,
	vga_clk);	

	input		clk_50_clk;
	output		nes_cpu_clk;
	output		ppu_clk;
	output		ppu_slow_clk;
	output	[12:0]	sdram_addr;
	output	[1:0]	sdram_ba;
	output		sdram_cas_n;
	output		sdram_cke;
	output		sdram_cs_n;
	inout	[15:0]	sdram_dq;
	output	[1:0]	sdram_dqm;
	output		sdram_ras_n;
	output		sdram_we_n;
	output		shift_clk;
	output		vga_clk;
endmodule
