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
  wire    n50,n51,n52,n53,n54,n55,n56,n57,n58;          
  

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
                .p7(VDD),  .p8(),
                );

   xc95105_pl84 cpld (
          .p1(n1),
          .p2(n2),
          .p3(n3),
          .p4(n4),
          .p5(n5),
          .p6(n6),
          .p7(n7),
          .gnd1(VSS),
          .gck1(n8),
          .gck2(n9),
          .p11(n10),
          .gck3(n11),
          .p13(n12),
          .p14(13),
          .p15(14),
          .gnd2(VSS),
          .p17(n15),
          .p18(n16),
          .p19(n17),
          .p20(n18),
          .p21(n19),
          .vccio1(VDDIO),
          .p23(n20),
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
          .p37(),
          .vccint1(VDD5V),
          .p39(),
          .p40(),
          .p41(),
          .gnd4(VSS),
          .p43(),
          .p44(),
          .p45(),
          .p46(),
          .p47(),
          .p48(),
          .gnd5(VSS),
          .p50(),
          .p51(n30),
          .p52(n31),
          .p53(n32),
          .p54(n33),
          .p55(n34),
          .p56(n35),
          .p57(n36),
          .p58(n37),
          .tdo(TDO),
          .gnd6(VSS),
          .p61(n38),
          .p62(n39),
          .p63(n40),
          .vccio2(VDDIO),
          .p65(n41),
          .p66(n42),
          .p67(n43),
          .p68(n44),
          .p69(n45),
          .p70(n46),
          .p71(n47),
          .p72(n48),
          .vccint2(VDD5V),
          .gsr(n49),
          .p75(n50),
          .gts1(n51),
          .gts2(n52),
          .vccint3(VDD5V),
          .p79(n53),
          .p80(n54),
          .p81(n55),
          .p82(n56),
          .p83(n57),
          .p84(n58),
          );

  hdr1x30 leftpins (
                    .p1(n50),
                    .p2(n51),
                    .p3(n52),
                    .p4(n53),
                    .p5(n54),
                    .p6(n55),
                    .p7(n56),                    
                    .p8(n57),                    
                    .p9(n58),
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
                    .p2(n49),
                    .p3(n48),
                    .p4(n47),
                    .p5(n46),
                    .p6(n45),
                    .p7(n44),                    
                    .p8(n43),                    
                    .p9(n42),
                    .p10(n41),                                        
                    .p11(n40),
                    .p12(n39),
                    .p13(n38),
                    .p14(n37),
                    .p15(n36),
                    .p16(n35),
                    .p17(n34),                    
                    .p18(n33),                    
                    .p19(n32),
                    .p20(n31),                                        
                    .p21(n30),
                    .p22(n29),
                    .p23(n28),
                    .p24(n27),
                    .p25(n26),
                    .p26(n25),
                    .p27(n24),                    
                    .p28(n23),                    
                    .p29(n22),
                    .p30(n21),                                        
                    );
  

  
   // Decoupling caps
   cap100nf CAP100N_1 (.p0( VSS ), .p1( VDDIO ));
   cap100nf CAP100N_2 (.p0( VSS ), .p1( VDDIO ));
   cap100nf CAP100N_3 (.p0( VSS ), .p1( VDD5V ));
   cap100nf CAP100N_4 (.p0( VSS ), .p1( VDD5V ));  

endmodule
