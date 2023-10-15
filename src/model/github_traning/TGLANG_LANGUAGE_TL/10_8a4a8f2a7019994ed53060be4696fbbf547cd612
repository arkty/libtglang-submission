\m4_TLV_version 1d: tl-x.org
\SV
   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
  
  // Multiplexer 1: Manual
  // $and1 = $x1 & $s;
  // $and2 = $x2 & !$s;
  // $out = $and1 | $and2;
  
  // Multiplexer 2: Ternary Operator
  // $out = $sel ? $in1 : $in0;
  
  // Multiplexer 3: N to one
  $out[7:0] = $sel[3] ? $in3[7:0] : $sel[2] ? $in2[7:0] : $sel[1] ? $in1[7:0] : $in0[7:0];    
  
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
