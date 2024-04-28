module encoderNivelCaixa(
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

and (segA, !highLevel, mediumLevel);

or (segB, highLevel, !highLevel);

or (segC, highLevel, !highLevel);

nor (segD, highLevel, !highLevel);

or (auxiliarE, !highLevel, mediumLevel);
and (segE, lowLevel, auxiliarE);

and (segF, segE, segE);

and (segG, !highLevel, !mediumLevel);

endmodule

