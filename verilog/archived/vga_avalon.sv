
module vga_stream(
	output logic [8:0]rgb_coe, // .conduit
	input logic clk,		   // .clk 
	input logic reset,		   // .reset 
	input logic [5:0]c_dat,    // .data_stream_in
	output vsync,				//
	output hsync,				// 
	output reading				// On reading = high, req next pixel 
); // VGA avalon interface,

/*
	reading timing diagram 
	
	one scanline  - each char represents one cycle
	
	rrrrr0000
	rrrrr0000 
	.
	.
	rrrrr0000
	000000000
	
	CPU side: on the rising edge of reading, send DMA of current line 
	
*/

logic [5:0]scanline[255:0];
logic [8:0]coloursDecode[63:0];
logic [8:0]rgb_buf;

logic [7:0]pix_ptr_x;
logic [7:0]pix_ptr_y;

always_ff@(posedge(clk)) begin
	if(reading)
		scanline[pix_ptr_x] = c_code;
	rgb_buf = coloursDecode[scanline[pix_ptr_x]];
end

initial begin
	$readmemh("vga_colours_rgb.txt",coloursDecode);
end 

vga_out vga_0(
	.pix_clk(clk), .pix_ptr_x, .pix_ptr_y,.rgb(rgb_coe), .vsync, .hsync, .reading, .rgb_buf
);

endmodule 