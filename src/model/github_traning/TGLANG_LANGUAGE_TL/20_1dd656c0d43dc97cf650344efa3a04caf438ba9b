\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/  /* verilator lint_off LATCH*/  /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/  /* verilator lint_off NULLPORT*/  /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/  /* verilator lint_off */  /* verilator lint_off */  /* verilator lint_off */  

//Your Verilog/System Verilog Code Starts Here:
module sharmi_pe(input [7:0] i_in, output reg [2:0] out);

always@(*)

begin
if(i_in[7])
	out=3'b111;
else if(i_in[6])
	out=3'b110;
else if(i_in[5])
	out=3'b101;
else if(i_in[4])
	out=3'b100;
else if(i_in[3])
	out=3'b011;
else if(i_in[2])
	out=3'b010;
else if(i_in[1])
	out=3'b001;
else if(i_in[0])
	out=3'b000;
else 
 out = 3'b000;
end

endmodule


//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic  [7:0] i_in;//input
		logic  [2:0] out;//output
//The $random() can be replaced if user wants to assign values
		assign i_in = $random();
		sharmi_pe sharmi_pe(.i_in(i_in), .out(out));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule

