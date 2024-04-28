module driverMatriz(
  chaveSeletora,
  saidaMux,
  segA_NivelCaixa,
  segA_TipoRega,
  segB_NivelCaixa,
  segB_TipoRega,
  segC_NivelCaixa,
  segC_TipoRega,
  segD_NivelCaixa,
  segD_TipoRega,
  segE_NivelCaixa,
  segE_TipoRega,
  segF_NivelCaixa,
  segF_TipoRega,
  segG_NivelCaixa,
  segG_TipoRega
);

input chaveSeletora, segA_NivelCaixa, segA_TipoRega, segB_TipoRega, segB_NivelCaixa, segC_TipoRega, segC_NivelCaixa, segD_TipoRega, segD_NivelCaixa, segE_TipoRega, segE_NivelCaixa, segF_TipoRega, segF_NivelCaixa, segG_NivelCaixa, segG_TipoRega;
output saidaMux;

returnMux segA(
  .ifTrue(segA_NivelCaixa),
  .ifFalse(segA_TipoRega),
  .chaveSeletora(chaveSeletora),
  .saidaMux(saidaMux)
);

returnMux segB(
  .ifTrue(segB_NivelCaixa),
  .ifFalse(segB_TipoRega),
  .chaveSeletora(chaveSeletora),
  .saidaMux(saidaMux)
);

returnMux segC(
  .ifTrue(segC_NivelCaixa),
  .ifFalse(segC_TipoRega),
  .chaveSeletora(chaveSeletora),
  .saidaMux(saidaMux)
);

returnMux segD(
  .ifTrue(segD_NivelCaixa),
  .ifFalse(segD_TipoRega),
  .chaveSeletora(chaveSeletora),
  .saidaMux(saidaMux)
);

returnMux segE(
  .ifTrue(segE_NivelCaixa),
  .ifFalse(segE_TipoRega),
  .chaveSeletora(chaveSeletora),
  .saidaMux(saidaMux)
);

returnMux segF(
  .ifTrue(segF_NivelCaixa),
  .ifFalse(segF_TipoRega),
  .chaveSeletora(chaveSeletora),
  .saidaMux(saidaMux)
);

returnMux segG(
  .ifTrue(segG_NivelCaixa),
  .ifFalse(segG_TipoRega),
  .chaveSeletora(chaveSeletora),
  .saidaMux(saidaMux)
);

endmodule
