/* Generated by Yosys 0.17+41 (git sha1 c525b5f91, clang 10.0.0-4ubuntu1 -fPIC -Os) */

(* top =  1  *)
module toggle(clk, reset, out);
  wire _00_;
  wire _01_;
  (* src = "/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:26.20-26.24" *)
  wire \$abc$2116$not$/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:26$2_Y_TMR_0 ;
  (* src = "/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:26.20-26.24" *)
  wire \$abc$2116$not$/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:26$2_Y_TMR_1 ;
  (* src = "/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:26.20-26.24" *)
  wire \$abc$2116$not$/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:26$2_Y_TMR_2 ;
  wire \$iopadmap$clk_TMR_0 ;
  wire \$iopadmap$clk_TMR_1 ;
  wire \$iopadmap$clk_TMR_2 ;
  (* force_downto = 32'd1 *)
  (* src = "/home/jacobb00/yosys/yosys/share/xilinx/lut_map.v:30.21-30.22" *)
  wire \$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_0 ;
  (* force_downto = 32'd1 *)
  (* src = "/home/jacobb00/yosys/yosys/share/xilinx/lut_map.v:30.21-30.22" *)
  wire \$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_1 ;
  (* force_downto = 32'd1 *)
  (* src = "/home/jacobb00/yosys/yosys/share/xilinx/lut_map.v:30.21-30.22" *)
  wire \$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_2 ;
  wire \\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_0_VOTER_wire_0 ;
  wire \\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_1_VOTER_wire_0 ;
  wire \\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_2_VOTER_wire_0 ;
  (* src = "/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:18.22-18.25" *)
  input clk;
  wire clk;
  (* src = "/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:19.18-19.21" *)
  output out;
  wire out;
  (* src = "/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:18.27-18.32" *)
  input reset;
  wire reset;
  (* module_not_derived = 32'd1 *)
  (* src = "/home/jacobb00/yosys/yosys/share/xilinx/lut_map.v:36.13-36.48" *)
  INV _02_ (
    .I(\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_0 ),
    .O(\$abc$2116$not$/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:26$2_Y_TMR_0 )
  );
  (* module_not_derived = 32'd1 *)
  (* src = "/home/jacobb00/yosys/yosys/share/xilinx/lut_map.v:36.13-36.48" *)
  INV _03_ (
    .I(\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_1 ),
    .O(\$abc$2116$not$/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:26$2_Y_TMR_1 )
  );
  (* module_not_derived = 32'd1 *)
  (* src = "/home/jacobb00/yosys/yosys/share/xilinx/lut_map.v:36.13-36.48" *)
  INV _04_ (
    .I(\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_2 ),
    .O(\$abc$2116$not$/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:26$2_Y_TMR_2 )
  );
  BUFG _05_ (
    .I(_00_),
    .O(\$iopadmap$clk_TMR_0 )
  );
  BUFG _06_ (
    .I(_00_),
    .O(\$iopadmap$clk_TMR_1 )
  );
  BUFG _07_ (
    .I(_00_),
    .O(\$iopadmap$clk_TMR_2 )
  );
  (* \always_ff  = 32'd1 *)
  (* module_not_derived = 32'd1 *)
  (* src = "/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:22.5-26.25|/home/jacobb00/yosys/yosys/share/xilinx/ff_map.v:68.41-68.95" *)
  FDRE #(
    .INIT(1'hx)
  ) _08_ (
    .C(\$iopadmap$clk_TMR_0 ),
    .CE(1'h1),
    .D(\$abc$2116$not$/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:26$2_Y_TMR_0 ),
    .Q(\\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_0_VOTER_wire_0 ),
    .R(_01_)
  );
  (* \always_ff  = 32'd1 *)
  (* module_not_derived = 32'd1 *)
  (* src = "/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:22.5-26.25|/home/jacobb00/yosys/yosys/share/xilinx/ff_map.v:68.41-68.95" *)
  FDRE #(
    .INIT(1'hx)
  ) _09_ (
    .C(\$iopadmap$clk_TMR_1 ),
    .CE(1'h1),
    .D(\$abc$2116$not$/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:26$2_Y_TMR_1 ),
    .Q(\\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_1_VOTER_wire_0 ),
    .R(_01_)
  );
  (* \always_ff  = 32'd1 *)
  (* module_not_derived = 32'd1 *)
  (* src = "/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:22.5-26.25|/home/jacobb00/yosys/yosys/share/xilinx/ff_map.v:68.41-68.95" *)
  FDRE #(
    .INIT(1'hx)
  ) _10_ (
    .C(\$iopadmap$clk_TMR_2 ),
    .CE(1'h1),
    .D(\$abc$2116$not$/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:26$2_Y_TMR_2 ),
    .Q(\\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_2_VOTER_wire_0 ),
    .R(_01_)
  );
  (* keep = 32'd1 *)
  IBUF _11_ (
    .I(clk),
    .O(_00_)
  );
  (* keep = 32'd1 *)
  OBUF _12_ (
    .I(\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_0 ),
    .O(out)
  );
  (* keep = 32'd1 *)
  IBUF _13_ (
    .I(reset),
    .O(_01_)
  );
  LUT3 #(
    .INIT(8'he8)
  ) \\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_0_VOTER_0  (
    .I0(\\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_0_VOTER_wire_0 ),
    .I1(\\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_1_VOTER_wire_0 ),
    .I2(\\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_2_VOTER_wire_0 ),
    .O(\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_0 )
  );
  LUT3 #(
    .INIT(8'he8)
  ) \\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_1_VOTER_0  (
    .I0(\\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_0_VOTER_wire_0 ),
    .I1(\\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_1_VOTER_wire_0 ),
    .I2(\\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_2_VOTER_wire_0 ),
    .O(\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_1 )
  );
  LUT3 #(
    .INIT(8'he8)
  ) \\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_2_VOTER_0  (
    .I0(\\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_0_VOTER_wire_0 ),
    .I1(\\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_1_VOTER_wire_0 ),
    .I2(\\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_2_VOTER_wire_0 ),
    .O(\$techmap2122$abc$2116$auto$blifparse.cc:515:parse_blif$2117.A_TMR_2 )
  );
endmodule
