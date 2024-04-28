module CircuitosDigitaisProblemaUm(
	highLevel,
	mediumLevel,
	lowLevel,
	temperaturaInvertida,
	umidadeSolo,
	umidadeAr,
	gotejamento,
	aspersao,
	erro,
	alarme,
	valvulaEntrada
);

/*
Ve = (H + E)’
Bs = Al’ · Us’ · (Ua’ + T’ · M)
Vs = Al’ · Us’ · Ua · (T + M’)
Al = E + L’
E = H · M’ + M · L’
*/
input highLevel, mediumLevel, lowLevel, temperaturaInvertida, umidadeSolo, umidadeAr;
output alarme, erro, valvulaEntrada, gotejamento, aspersao;

wire temperatura;
not (temperatura, temperaturaInvertida);

wire segA_NivelCaixa, segB_NivelCaixa,  segC_NivelCaixa, segD_NivelCaixa, segE_NivelCaixa, segF_NivelCaixa, segG_NivelCaixa;
wire segA_TipoRega, segB_TipoRega, segC_TipoRega, segD_TipoRega, segE_TipoRega, segF_TipoRega, segG_TipoRega;

returnAlarme(
	.highLevel(highLevel),
	.mediumLevel(mediumLevel),
	.lowLevel(lowLevel),
	.erro(erro),
	.alarme(alarme)
);

nor nor_valvulaEntrada(valvulaEntrada, highLevel, erro);

returnGotejamento(
	.not_Medium(!mediumLevel),
	.not_UmidadeSolo(!umidadeSolo),
	.umidadeAr(umidadeAr),
	.temperatura(temperatura),
	.not_Alarme(!alarme),
	.gotejamento(gotejamento)
);

returnAspersao(
	.mediumLevel(mediumLevel),
	.not_Temperatura(temperaturaInvertida),
	.not_UmidadeAr(!umidadeAr),
	.not_UmidadeSolo(!umidadeSolo),
	.not_Alarme(!alarme),
  .aspersao(aspersao)
);

driverNivelCaixa(
  .highLevel(highLevel),
  .mediumLevel(mediumLevel),
  .lowLevel(lowLevel),
  .segA(segA_NivelCaixa),
  .segB(segB_NivelCaixa),
  .segC(segC_NivelCaixa),
  .segD(segD_NivelCaixa),
  .segE(segE_NivelCaixa),
  .segF(segF_NivelCaixa),
  .segG(segG_NivelCaixa)
);

driverTipoRega(
  .aspersao(aspersao),
  .gotejamento(gotejamento),
  .segA(segA_TipoRega),
  .segB(segB_TipoRega),
  .segC(segC_TipoRega),
  .segD(segD_TipoRega),
  .segE(segE_TipoRega),
  .segF(segF_TipoRega),
  .segG(segG_TipoRega)
);

driverMatriz(
  .chaveSeletora(chaveSeletora),
  .saidaMux(saidaMux),
  .segA_NivelCaixa(segA_NivelCaixa),
  .segA_TipoRega(segA_TipoRega),
  .segB_NivelCaixa(segB_NivelCaixa),
  .segB_TipoRega(segB_TipoRega),
  .segC_NivelCaixa(segC_NivelCaixa),
  .segC_TipoRega(segC_TipoRega),
  .segD_NivelCaixa(segD_NivelCaixa),
  .segD_TipoRega(segD_TipoRega),
  .segE_NivelCaixa(segE_NivelCaixa),
  .segE_TipoRega(segE_TipoRega),
  .segF_NivelCaixa(segF_NivelCaixa),
  .segF_TipoRega(segF_TipoRega),
  .segG_NivelCaixa(segG_NivelCaixa),
  .segG_TipoRega(segG_TipoRega)
);
endmodule
