/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Wed Mar  1 14:32:11 2023
/////////////////////////////////////////////////////////////


module top_module ( in_clka, in_clkb, in_restart, in_instruction, in_mem, 
        out_state_main, out_reg );
  input [7:0] in_instruction;
  input [7:0] in_mem;
  output [3:0] out_state_main;
  output [7:0] out_reg;
  input in_clka, in_clkb, in_restart;
  wire   in_load, in_store, in_branch, in_arithImmediate, in_arithMemory,
         \f1/n29 , \f1/n28 , \f1/n27 , \f1/n26 , \f1/n25 , \f1/n24 , \f1/n23 ,
         \f1/n22 , \f1/n21 , \f1/n20 , \f1/n19 , \f1/n18 , \f1/n17 , \f1/n16 ,
         \f1/n15 , \f1/n14 , \f1/n13 , \f1/n12 , \f1/n11 , \f1/n10 , \f1/n9 ,
         \f1/n7 , \f1/n6 , \f1/n5 , \f1/n4 , \f1/n3 , \f1/n2 , \f1/n1 ,
         \f1/N88 , \f1/N87 , \f1/N86 , \f1/N85 , \d1/n17 , \d1/n14 , \d1/n13 ,
         \d1/n12 , \d1/n11 , \d1/n8 , \d1/n7 , \d1/n5 , \d1/n4 , \d1/n3 ,
         \d1/n2 , \d1/n1 , \dp1/n18 , \dp1/n16 , \dp1/n15 , \dp1/n14 ,
         \dp1/n13 , \dp1/n12 , \dp1/n11 , \dp1/n10 , \dp1/n9 , \dp1/N31 ,
         \dp1/N30 , \dp1/N29 , \dp1/N28 , \dp1/N27 , \dp1/N26 , \dp1/N25 ,
         \dp1/N24 , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [3:0] \f1/next_state ;
  wire   [7:0] \dp1/data_reg ;

  NOR2X1 \f1/U36  ( .A(out_state_main[0]), .B(out_state_main[1]), .Y(\f1/n16 )
         );
  OAI21X1 \f1/U35  ( .A(\f1/n4 ), .B(\f1/n5 ), .C(\dp1/n18 ), .Y(\f1/n26 ) );
  NOR2X1 \f1/U34  ( .A(in_arithMemory), .B(\f1/n11 ), .Y(\f1/n28 ) );
  NOR2X1 \f1/U33  ( .A(in_branch), .B(in_load), .Y(\f1/n18 ) );
  NOR2X1 \f1/U32  ( .A(out_state_main[3]), .B(out_state_main[2]), .Y(\f1/n12 )
         );
  NAND3X1 \f1/U31  ( .A(out_state_main[1]), .B(\f1/n7 ), .C(\f1/n12 ), .Y(
        \f1/n29 ) );
  NAND3X1 \f1/U30  ( .A(\dp1/n18 ), .B(\f1/n10 ), .C(\f1/n2 ), .Y(\f1/n13 ) );
  OAI21X1 \f1/U29  ( .A(\f1/n28 ), .B(\f1/n9 ), .C(\f1/n1 ), .Y(\f1/n27 ) );
  OAI21X1 \f1/U28  ( .A(\f1/n6 ), .B(\f1/n26 ), .C(\f1/n27 ), .Y(\f1/N85 ) );
  NAND3X1 \f1/U27  ( .A(\f1/n5 ), .B(\f1/n4 ), .C(out_state_main[0]), .Y(
        \f1/n23 ) );
  OAI21X1 \f1/U26  ( .A(in_store), .B(\f1/n9 ), .C(\f1/n2 ), .Y(\f1/n25 ) );
  OAI21X1 \f1/U25  ( .A(out_state_main[1]), .B(\f1/n23 ), .C(\f1/n25 ), .Y(
        \f1/n24 ) );
  NAND2X1 \f1/U24  ( .A(\f1/n16 ), .B(\f1/n4 ), .Y(\f1/n21 ) );
  OAI21X1 \f1/U23  ( .A(in_load), .B(in_store), .C(\f1/n2 ), .Y(\f1/n22 ) );
  OAI21X1 \f1/U22  ( .A(\f1/n5 ), .B(\f1/n21 ), .C(\f1/n22 ), .Y(\f1/n20 ) );
  AOI21X1 \f1/U21  ( .A(\f1/n3 ), .B(out_state_main[1]), .C(\f1/n20 ), .Y(
        \f1/n19 ) );
  NOR2X1 \f1/U20  ( .A(in_restart), .B(\f1/n19 ), .Y(\f1/N87 ) );
  OAI21X1 \f1/U19  ( .A(in_arithImmediate), .B(in_arithMemory), .C(\f1/n18 ), 
        .Y(\f1/n14 ) );
  NOR2X1 \f1/U18  ( .A(out_state_main[2]), .B(in_restart), .Y(\f1/n17 ) );
  NAND3X1 \f1/U17  ( .A(out_state_main[3]), .B(\f1/n16 ), .C(\f1/n17 ), .Y(
        \f1/n15 ) );
  OAI21X1 \f1/U16  ( .A(\f1/n13 ), .B(\f1/n14 ), .C(\f1/n15 ), .Y(\f1/N88 ) );
  INVX2 \f1/U15  ( .A(in_arithImmediate), .Y(\f1/n11 ) );
  INVX2 \f1/U14  ( .A(in_store), .Y(\f1/n10 ) );
  INVX2 \f1/U13  ( .A(\f1/n18 ), .Y(\f1/n9 ) );
  INVX2 \f1/U11  ( .A(out_state_main[0]), .Y(\f1/n7 ) );
  INVX2 \f1/U10  ( .A(\f1/n16 ), .Y(\f1/n6 ) );
  INVX2 \f1/U9  ( .A(out_state_main[2]), .Y(\f1/n5 ) );
  INVX2 \f1/U8  ( .A(out_state_main[3]), .Y(\f1/n4 ) );
  INVX2 \f1/U7  ( .A(\f1/n23 ), .Y(\f1/n3 ) );
  INVX2 \f1/U6  ( .A(\f1/n29 ), .Y(\f1/n2 ) );
  INVX2 \f1/U5  ( .A(\f1/n13 ), .Y(\f1/n1 ) );
  AND2X2 \f1/U4  ( .A(\f1/n24 ), .B(\dp1/n18 ), .Y(\f1/N86 ) );
  DFFNEGX1 \f1/next_state_reg[0]  ( .D(\f1/N85 ), .CLK(n12), .Q(
        \f1/next_state [0]) );
  DFFNEGX1 \f1/state_reg[3]  ( .D(\f1/next_state [3]), .CLK(n10), .Q(
        out_state_main[3]) );
  DFFNEGX1 \f1/next_state_reg[3]  ( .D(\f1/N88 ), .CLK(n12), .Q(
        \f1/next_state [3]) );
  DFFNEGX1 \f1/state_reg[1]  ( .D(\f1/next_state [1]), .CLK(n10), .Q(
        out_state_main[1]) );
  DFFNEGX1 \f1/next_state_reg[1]  ( .D(\f1/N86 ), .CLK(n12), .Q(
        \f1/next_state [1]) );
  DFFNEGX1 \f1/state_reg[2]  ( .D(\f1/next_state [2]), .CLK(n10), .Q(
        out_state_main[2]) );
  DFFNEGX1 \f1/next_state_reg[2]  ( .D(\f1/N87 ), .CLK(n12), .Q(
        \f1/next_state [2]) );
  DFFNEGX1 \f1/state_reg[0]  ( .D(\f1/next_state [0]), .CLK(n10), .Q(
        out_state_main[0]) );
  NAND2X1 \d1/U34  ( .A(in_instruction[7]), .B(in_instruction[6]), .Y(\d1/n7 )
         );
  NAND2X1 \d1/U33  ( .A(in_instruction[4]), .B(in_instruction[5]), .Y(\d1/n11 ) );
  NAND2X1 \d1/U29  ( .A(\d1/n1 ), .B(\d1/n5 ), .Y(\d1/n14 ) );
  NAND3X1 \d1/U28  ( .A(\d1/n3 ), .B(\d1/n2 ), .C(\d1/n14 ), .Y(\d1/n17 ) );
  OAI21X1 \d1/U27  ( .A(in_instruction[7]), .B(\d1/n11 ), .C(\d1/n17 ), .Y(
        in_arithImmediate) );
  NAND2X1 \d1/U26  ( .A(in_instruction[6]), .B(\d1/n1 ), .Y(\d1/n13 ) );
  OAI21X1 \d1/U25  ( .A(in_instruction[5]), .B(\d1/n13 ), .C(\d1/n14 ), .Y(
        in_arithMemory) );
  NOR2X1 \d1/U24  ( .A(\d1/n4 ), .B(\d1/n7 ), .Y(in_branch) );
  NAND2X1 \d1/U16  ( .A(in_instruction[7]), .B(\d1/n2 ), .Y(\d1/n12 ) );
  NAND2X1 \d1/U12  ( .A(in_instruction[5]), .B(\d1/n5 ), .Y(\d1/n8 ) );
  NOR2X1 \d1/U11  ( .A(\d1/n12 ), .B(\d1/n8 ), .Y(in_load) );
  NOR2X1 \d1/U10  ( .A(\d1/n11 ), .B(\d1/n12 ), .Y(in_store) );
  INVX2 \d1/U5  ( .A(in_instruction[4]), .Y(\d1/n5 ) );
  INVX2 \d1/U4  ( .A(\d1/n11 ), .Y(\d1/n4 ) );
  INVX2 \d1/U3  ( .A(in_instruction[5]), .Y(\d1/n3 ) );
  INVX2 \d1/U2  ( .A(in_instruction[6]), .Y(\d1/n2 ) );
  INVX2 \d1/U1  ( .A(in_instruction[7]), .Y(\d1/n1 ) );
  NOR2X1 \dp1/U69  ( .A(in_restart), .B(\dp1/n16 ), .Y(\dp1/N24 ) );
  NOR2X1 \dp1/U68  ( .A(in_restart), .B(\dp1/n15 ), .Y(\dp1/N25 ) );
  NOR2X1 \dp1/U67  ( .A(in_restart), .B(\dp1/n14 ), .Y(\dp1/N26 ) );
  NOR2X1 \dp1/U66  ( .A(in_restart), .B(\dp1/n13 ), .Y(\dp1/N27 ) );
  NOR2X1 \dp1/U65  ( .A(in_restart), .B(\dp1/n12 ), .Y(\dp1/N28 ) );
  NOR2X1 \dp1/U64  ( .A(in_restart), .B(\dp1/n11 ), .Y(\dp1/N29 ) );
  NOR2X1 \dp1/U63  ( .A(in_restart), .B(\dp1/n10 ), .Y(\dp1/N30 ) );
  NOR2X1 \dp1/U62  ( .A(in_restart), .B(\dp1/n9 ), .Y(\dp1/N31 ) );
  INVX2 \dp1/U20  ( .A(in_restart), .Y(\dp1/n18 ) );
  INVX2 \dp1/U18  ( .A(\dp1/data_reg [0]), .Y(\dp1/n16 ) );
  INVX2 \dp1/U17  ( .A(\dp1/data_reg [1]), .Y(\dp1/n15 ) );
  INVX2 \dp1/U16  ( .A(\dp1/data_reg [2]), .Y(\dp1/n14 ) );
  INVX2 \dp1/U15  ( .A(\dp1/data_reg [3]), .Y(\dp1/n13 ) );
  INVX2 \dp1/U14  ( .A(\dp1/data_reg [4]), .Y(\dp1/n12 ) );
  INVX2 \dp1/U13  ( .A(\dp1/data_reg [5]), .Y(\dp1/n11 ) );
  INVX2 \dp1/U12  ( .A(\dp1/data_reg [6]), .Y(\dp1/n10 ) );
  INVX2 \dp1/U11  ( .A(\dp1/data_reg [7]), .Y(\dp1/n9 ) );
  DFFNEGX1 \dp1/reg_out_reg[0]  ( .D(\dp1/N24 ), .CLK(n10), .Q(out_reg[0]) );
  DFFNEGX1 \dp1/reg_out_reg[1]  ( .D(\dp1/N25 ), .CLK(n10), .Q(out_reg[1]) );
  DFFNEGX1 \dp1/reg_out_reg[2]  ( .D(\dp1/N26 ), .CLK(n10), .Q(out_reg[2]) );
  DFFNEGX1 \dp1/reg_out_reg[3]  ( .D(\dp1/N27 ), .CLK(n10), .Q(out_reg[3]) );
  DFFNEGX1 \dp1/reg_out_reg[4]  ( .D(\dp1/N28 ), .CLK(n10), .Q(out_reg[4]) );
  DFFNEGX1 \dp1/reg_out_reg[5]  ( .D(\dp1/N29 ), .CLK(n10), .Q(out_reg[5]) );
  DFFNEGX1 \dp1/reg_out_reg[6]  ( .D(\dp1/N30 ), .CLK(n10), .Q(out_reg[6]) );
  DFFNEGX1 \dp1/reg_out_reg[7]  ( .D(\dp1/N31 ), .CLK(n10), .Q(out_reg[7]) );
  DFFNEGX1 \dp1/data_reg_reg[0]  ( .D(n8), .CLK(n12), .Q(\dp1/data_reg [0]) );
  DFFNEGX1 \dp1/data_reg_reg[1]  ( .D(n7), .CLK(n12), .Q(\dp1/data_reg [1]) );
  DFFNEGX1 \dp1/data_reg_reg[2]  ( .D(n6), .CLK(n12), .Q(\dp1/data_reg [2]) );
  DFFNEGX1 \dp1/data_reg_reg[3]  ( .D(n5), .CLK(n12), .Q(\dp1/data_reg [3]) );
  DFFNEGX1 \dp1/data_reg_reg[4]  ( .D(n4), .CLK(n12), .Q(\dp1/data_reg [4]) );
  DFFNEGX1 \dp1/data_reg_reg[5]  ( .D(n3), .CLK(n12), .Q(\dp1/data_reg [5]) );
  DFFNEGX1 \dp1/data_reg_reg[6]  ( .D(n2), .CLK(n12), .Q(\dp1/data_reg [6]) );
  DFFNEGX1 \dp1/data_reg_reg[7]  ( .D(n1), .CLK(n12), .Q(\dp1/data_reg [7]) );
  AND2X2 U1 ( .A(in_mem[7]), .B(\dp1/n18 ), .Y(n1) );
  AND2X2 U2 ( .A(in_mem[6]), .B(\dp1/n18 ), .Y(n2) );
  AND2X2 U3 ( .A(in_mem[5]), .B(\dp1/n18 ), .Y(n3) );
  AND2X2 U4 ( .A(in_mem[4]), .B(\dp1/n18 ), .Y(n4) );
  AND2X2 U5 ( .A(in_mem[3]), .B(\dp1/n18 ), .Y(n5) );
  AND2X2 U6 ( .A(in_mem[2]), .B(\dp1/n18 ), .Y(n6) );
  AND2X2 U7 ( .A(in_mem[1]), .B(\dp1/n18 ), .Y(n7) );
  AND2X2 U8 ( .A(in_mem[0]), .B(\dp1/n18 ), .Y(n8) );
  INVX1 U9 ( .A(in_clkb), .Y(n9) );
  INVX2 U10 ( .A(n9), .Y(n10) );
  INVX1 U11 ( .A(in_clka), .Y(n11) );
  INVX2 U12 ( .A(n11), .Y(n12) );
endmodule

