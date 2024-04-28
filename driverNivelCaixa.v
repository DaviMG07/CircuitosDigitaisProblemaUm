module driverNivelCaixa(
  highLevel,
  mediumLevel,
  lowLevel,
  segA,
  segB,
  segC,
  segD,
  segE,
  segF,
  segG
);

input highLevel, mediumLevel, lowLevel;

output segA, segB, segC, segD, segE, segF, segG;

wire auxiliarE;
/*
Caixa:
A = H' · L
B = 1
C = 1
D = 0
E = L · (H' + M)
F = L · (H' + M)
G = H' · M'
*/ 

and (segA, !highLevel, mediumLevel);

or (segB, highLevel, !highLevel);

or (segC, highLevel, !highLevel);

nor (segD, highLevel, !highLevel);

or (auxiliarE, !highLevel, mediumLevel);
and (segE, lowLevel, auxiliarE);

and (segF, segE, segE);

and (segG, !highLevel, !mediumLevel);

endmodule
