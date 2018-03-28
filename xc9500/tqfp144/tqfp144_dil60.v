// 
// xc95108_cpld breakout board
// 
// netlister.py format
// 
// (c) Revaldinho & BigEd,  2018
// 
//  
module breakout ();

  // wire declarations
  supply0 VSS;
  supply1 VDD5V;
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

   xc95288tqfp144 cpld (
              .vddio1(VDD3V3),
	      .gts3(n35),
	      .gts4(n36),
	      .p4(),
	      .gts1(n37),
	      .gts2(n38),
	      .p7(),
              .vddint1(VDD3V3),
	      .p9(),
	      .p10(n39),
	      .p11(),
	      .p12(),
	      .p13(n40),
	      .p14(),
	      .p15(n41),
	      .p16(),
	      .p17(n42),
              .gnd1(VSS),
	      .p19(),
	      .p20(n43),
	      .p21(),
	      .p22(n44),
	      .p23(),
	      .p24(n45),
	      .p25(),
	      .p26(n46),
	      .p27(),
	      .p28(n47),
              .gnd2(VSS),              
	      .gck1(n48),
	      .p31(),
	      .gck2(n49),
	      .p33(),
	      .p34(n50),
	      .p35(),
              .gnd3(VSS),              
              .vddio2(VDD3V3),
	      .gck3(n51),
	      .p39(),
	      .p40(n52),
	      .p41(n53),
              .vddint2(VDD3V3),              
	      .p43(n54),
	      .p44(n55),
	      .p45(n56),
	      .p46(),
              .gnd4(VSS),                            
	      .p48(),
	      .p49(),
	      .p50(n1),
	      .p51(),
	      .p52(n2),
	      .p53(),
	      .p54(n3),
              .vddio3(VDD3V3),
	      .p56(),
	      .p57(n4),
	      .p58(),
	      .p59(n5),
	      .p60(),
	      .p61(n6),
              .gnd5(VSS),                            
              .tdi(TDI),                            
	      .p64(),
              .tms(TMS),              
	      .p66(),
              .tck(TCK),              
	      .p68(),
	      .p69(n7),
	      .p70(),
	      .p71(n8),
              .gnd6(VSS),
              .vddio4(VDD3V3),                            
	      .p74(n9),
	      .p75(),
	      .p76(n10),
	      .p77(),
	      .p78(n11),
	      .p79(),
	      .p80(n12),
	      .p81(),
	      .p82(n13),
	      .p83(),
              .vddint3(VDD3V3),
	      .p85(n14),
	      .p86(),
	      .p87(n15),
	      .p88(),
              .gnd7(VSS),
              .gnd8(VSS),                            
	      .p91(n16),
	      .p92(),
	      .p93(n17),
	      .p94(),
	      .p95(n18),
	      .p96(),
	      .p97(n19),
	      .p98(),
              .gnd9(VSS),                            
	      .p100(n20),
	      .p101(),
	      .p102(n21),
	      .p103(),
	      .p104(n22),
	      .p105(),
	      .p106(n23),
	      .p107(),
              .gnd10(VSS),
              .vddio5(VDD3V3),
	      .p110(n24),
	      .p111(),
	      .p112(n25),
	      .p113(),
              .gnd11(VSS),              
	      .p115(),
	      .p116(n26),
	      .p117(),
	      .p118(n27),
	      .p119(),
	      .p120(n28),
	      .p121(),
              .tdo(TDO),
              .gnd13(VSS),                            
	      .p124(),
	      .p125(),
	      .p126(),
              .vddio6(VSS),              
	      .p128(),
	      .p129(),
	      .p130(),
	      .p131(n29),
	      .p132(),
	      .p133(n30),
	      .p134(),
	      .p135(n31),
	      .p136(),
	      .p137(n32),
	      .p138(),
	      .p139(n33),
	      .p140(),
              .vddint4(VDD3V3),              
	      .p142(),
	      .gsr(n34),
              .gnd14(VSS)


                        
          );

  hdr1x30 leftpins (
                    .p1(VDD5V),
                    .p2(n29),
                    .p3(n30),
                    .p4(n31),
                    .p5(n32),
                    .p6(n33),
                    .p7(n34),                    
                    .p8(n35),                    
                    .p9(n36),
                    .p10(n37),                                        
                    .p11(n38),
                    .p12(n39),
                    .p13(n40),
                    .p14(n41),
                    .p15(n42),
                    .p16(n43),
                    .p17(n44),                    
                    .p18(n45),                    
                    .p19(n46),
                    .p20(n47),                                        
                    .p21(n48),
                    .p22(n49),
                    .p23(n50),
                    .p24(n51),
                    .p25(n52),
                    .p26(n53),
                    .p27(n54),                    
                    .p28(n55),                    
                    .p29(n56),
                    .p30(VSS),                    
                    );

  hdr1x30 rightpins (
                    .p1(VDD5V),
                    .p2(n28),
                    .p3(n27),
                    .p4(n26),
                    .p5(n25),
                    .p6(n24),
                    .p7(n23),                    
                    .p8(n22),                    
                    .p9(n21),
                    .p10(n20),                                        
                    .p11(n19),
                    .p12(n18),
                    .p13(n17),
                    .p14(n16),
                    .p15(n15),
                    .p16(n14),
                    .p17(n13),                    
                    .p18(n12),                    
                    .p19(n11),
                    .p20(n10),                                        
                    .p21(n9),
                    .p22(n8),
                    .p23(n7),
                    .p24(n6),
                    .p25(n5),
                    .p26(n4),
                    .p27(n3),                    
                    .p28(n2),                    
                    .p29(n1),
                    .p30(VSS),                                        
                    );
  

  
   // Decoupling caps
   cap100nf CAP100N_1 (.p0( VSS ), .p1( VDD3V3 ));
   cap100nf CAP100N_2 (.p0( VSS ), .p1( VDD3V3 ));
   cap100nf CAP100N_3 (.p0( VSS ), .p1( VDD3V3 ));
   cap100nf CAP100N_4 (.p0( VSS ), .p1( VDD3V3 ));  

endmodule
