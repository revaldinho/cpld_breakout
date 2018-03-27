// 
// xc95108_cpld breakout board
// 
// netlister.py format
// 
// (c) Revaldinho & BigEd,  2018
// 
//  
module cpc_ram_board ();

  // wire declarations
  supply0 VSS;
  supply1 VDD5V;
  supply1 VDDIO;
  supply1 VDD3V3;

  wire    n1,n2,n3,n4,n5,n6,n7,n8,n9;
  wire    n10,n11,n12,n13,n14,n15,n16,n17,n18,n19;
  wire    n20,n21,n22,n23,n24,n25,n26,n27,n28,n29;
  wire    n30,n31,n32,n33,n34,n35,n36,n37,n38,n39;
  wire    n40,n41,n42,n43,n44,n45,n46,n47,n48,n49;
  wire    n50,n51,n52,n53,n54,n55,n56;          
  

  wire TMS;
  wire TDI;
  wire TDO;
  wire TCK;
  
  // 3 pin header with link to select 3V3 or 5V supply for IOs
  hdr1x03      L1 (
                   .p1(VDD5V),
                   .p2(VDDIO),
                   .p3(VDD3V3)
                   );

  // 3V3 Regulator, 250mA - not required if always using 5V power
  MCP1700_3302E   REG3V3 (
                            .vin(VDD5V),
                            .gnd(VSS),
                            .vout(VDD3V3)
                            );


  // Radial electolytic, one per board on the main 5V supply
  cap22uf         CAP22UF(.minus(VSS),.plus(VDD5V));

  // Two ceramic caps to be placed v. close to regulator pins
  cap1uf          reg_cap0 (.p0(VDD5V), .p1(VSS));
  cap1uf          reg_cap1 (.p0(VDD3V3), .p1(VSS));

  // Standard layout JTAG port for programming the CPLD
  hdr8way JTAG (
                .p1(VSS),  .p2(VSS),
                .p3(TMS),  .p4(TDI),
                .p5(TDO),  .p6(TCK),
                .p7(VDD5V),  .p8(),
                );

   xc95105_pl84 cpld (
          .p1(n5),
          .p2(n6),
          .p3(n7),
          .p4(n8),
          .p5(n9),
          .p6(n10),
          .p7(n11),
          .gnd1(VSS),
          .gck1(n12),
          .gck2(n13),
          .p11(n14),
          .gck3(n15),
          .p13(n16),
          .p14(n17),
          .p15(n18),
          .gnd2(VSS),
          .p17(n19),
          .p18(n20),
          .p19(),
          .p20(),
          .p21(),
          .vccio1(VDDIO),
          .p23(),
          .p24(n21),
          .p25(n22),
          .p26(n23),
          .gnd3(VSS),
          .tdi(TDI),
          .tms(TMS),
          .tck(TCK),
          .p31(n24),
          .p32(n25),
          .p33(n26),
          .p34(n27),
          .p35(n28),
          .p36(n29),
          .p37(n30),
          .vccint1(VDD5V),
          .p39(n31),
          .p40(n32),
          .p41(n33),
          .gnd4(VSS),
          .p43(n34),
          .p44(n35),
          .p45(n36),
          .p46(n37),
          .p47(n38),
          .p48(n39),
          .gnd5(VSS),
          .p50(n40),
          .p51(n41),
          .p52(n42),
          .p53(n43),
          .p54(n44),
          .p55(n45),
          .p56(n46),
          .p57(n47),
          .p58(n48),
          .tdo(TDO),
          .gnd6(VSS),
          .p61(),
          .p62(),
          .p63(),
          .vccio2(VDDIO),
          .p65(),
          .p66(n49),
          .p67(),
          .p68(n50),
          .p69(),
          .p70(n51),
          .p71(),
          .p72(n52),
          .vccint2(VDD5V),
          .gsr(n53),
          .p75(n54),
          .gts1(n55),
          .gts2(n56),
          .vccint3(VDD5V),
          .p79(),
          .p80(),
          .p81(n1),
          .p82(n2),
          .p83(n3),
          .p84(n4),
          );

  hdr1x30 leftpins (
                    .p1(VDD5V),
                    .p2(n49),
                    .p3(n50),
                    .p4(n51),
                    .p5(n52),
                    .p6(n53),
                    .p7(n54),                    
                    .p8(n55),                    
                    .p9(n56),
                    .p10(n1),                                        
                    .p11(n2),
                    .p12(n3),
                    .p13(n4),
                    .p14(n5),
                    .p15(n6),
                    .p16(n7),
                    .p17(n8),                    
                    .p18(n9),                    
                    .p19(n10),
                    .p20(n11),                                        
                    .p21(n12),
                    .p22(n13),
                    .p23(n14),
                    .p24(n15),
                    .p25(n16),
                    .p26(n17),
                    .p27(n18),                    
                    .p28(n19),                    
                    .p29(n20),
                    .p30(VSS),                    
                    );

  hdr1x30 rightpins (
                    .p1(VDD5V),
                    .p2(n48),
                    .p3(n47),
                    .p4(n46),
                    .p5(n45),
                    .p6(n44),
                    .p7(n43),                    
                    .p8(n42),                    
                    .p9(n41),
                    .p10(n40),                                        
                    .p11(n39),
                    .p12(n38),
                    .p13(n37),
                    .p14(n36),
                    .p15(n35),
                    .p16(n34),
                    .p17(n33),                    
                    .p18(n32),                    
                    .p19(n31),
                    .p20(n30),                                        
                    .p21(n29),
                    .p22(n28),
                    .p23(n27),
                    .p24(n26),
                    .p25(n25),
                    .p26(n24),
                    .p27(n23),                    
                    .p28(n22),                    
                    .p29(n21),
                    .p30(VSS),                                        
                    );
  

  
   // Decoupling caps
   cap100nf CAP100N_1 (.p0( VSS ), .p1( VDDIO ));
   cap100nf CAP100N_2 (.p0( VSS ), .p1( VDDIO ));
   cap100nf CAP100N_3 (.p0( VSS ), .p1( VDD5V ));
   cap100nf CAP100N_4 (.p0( VSS ), .p1( VDD5V ));  

endmodule
