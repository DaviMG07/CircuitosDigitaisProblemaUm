module encoderTipoRega(
  gotejamento,
  aspersao,
  segA,
  segB,
  segC,
  segD,
  segE,
  segF,
  segG
);

input gotejamento, aspersao;
output segA, segB, segC, segD, segE, segF, segG;

and (segA, !aspersao, !gotejamento);

not (segB, aspersao);

not (segC, aspersao);

not (segD, gotejamento);

and (segE, !aspersao, !gotejamento);

and (segF, !aspersao, !gotejamento);

and (segG, gotejamento, gotejamento);

endmodule
