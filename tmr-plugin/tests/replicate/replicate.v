/* Generated by Yosys 0.17+41 (git sha1 c525b5f91, clang 10.0.0-4ubuntu1 -fPIC -Os) */

(* hdlname = "\\toggle" *)
(* top =  1  *)
(* src = "/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:17.1-27.10" *)
module toggle(clk, reset, out);
  (* src = "/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:26.20-26.24" *)
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  (* force_downto = 32'd1 *)
  (* src = "/usr/local/bin/../share/yosys/xilinx/lut_map.v:30.21-30.22" *)
  wire _04_;
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
  (* src = "/usr/local/bin/../share/yosys/xilinx/lut_map.v:36.13-36.48" *)
  INV _05_ (
    .I(_04_),
    .O(_00_)
  );
  BUFG _06_ (
    .I(_01_),
    .O(_02_)
  );
  (* \always_ff  = 32'd1 *)
  (* module_not_derived = 32'd1 *)
  (* src = "/home/jacobb00/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv:22.5-26.25|/usr/local/bin/../share/yosys/xilinx/ff_map.v:68.41-68.95" *)
  FDRE #(
    .INIT(1'hx)
  ) _07_ (
    .C(_02_),
    .CE(1'h1),
    .D(_00_),
    .Q(_04_),
    .R(_03_)
  );
  (* keep = 32'd1 *)
  IBUF _08_ (
    .I(clk),
    .O(_01_)
  );
  (* keep = 32'd1 *)
  OBUF _09_ (
    .I(_04_),
    .O(out)
  );
  (* keep = 32'd1 *)
  IBUF _10_ (
    .I(reset),
    .O(_03_)
  );
endmodule
