module driverTipoRega(
  aspersao,
  gotejamento,
  segA,
  segB,
  segC,
  segD,
  segE,
  segF,
  segG
);

input aspersao, gotejamento;
output segA, segB, segC, segD, segE, segF, segG;

/*
a = A' · G'
b = A'
c = A'
d = G'
e = A' · G'
f = A' · G'
g = G
*/

and (segA, !aspersao, !gotejamento);

not (segB, aspersao);

not (segC, aspersao);

not (segD, gotejamento);

and (segE, !aspersao, !gotejamento);

and (segF, !aspersao, !gotejamento);

and (segG, gotejamento, gotejamento);

endmodule
