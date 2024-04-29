module CircuitosDigitaisProblemaUm(
 highLevel,
  mediumLevel,
  lowLevel,
  temperatura,
  umidadeSolo,
  umidadeAr,
  alarme,
  chaveSeletora,
  saidaMux,
  valvulaEntrada,
  gotejamento,
  aspersao
);

input highLevel, mediumLevel, lowLevel, temperatura, umidadeSolo, umidadeAr, chaveSeletora;
output alarme, saidaMux, valvulaEntrada, gotejamento, aspersao;

wire segA_NivelCaixa, segB_NivelCaixa, segC_NivelCaixa, segD_NivelCaixa, segE_NivelCaixa, segF_NivelCaixa, segG_NivelCaixa;
wire segA_TipoRega, segB_TipoRega, segC_TipoRega, segD_TipoRega, segE_TipoRega, segF_TipoRega, segG_TipoRega;
wire erro;
wire and_High_NotMedium, and_Medium_NotLow;

//erro 
and And_High_NotMedium(and_High_NotMedium, highLevel, !mediumLevel);
and And_Medium_NotLow(and_Medium_NotLow, mediumLevel, !lowLevel);
or Or_erro(erro, and_High_NotMedium, and_Medium_NotLow);

//alarme 
or Or_alarme(alarme, erro, !lowLevel);

//valvula de Entrada
nor (valvulaEntrada, highLevel, erro);

//gotejamento
or (or_Temperatura_NotMedium, temperatura, !mediumLevel);
and Gotejamento(gotejamento, !umidadeSolo, !alarme, umidadeAr, or_Temperatura_NotMedium);

//aspersao 
and (and_NotTemperatura_Medium, !temperatura, mediumLevel);
or (or_AndNotTemperaturaMedium_NotUmidadeAr, and_NotTemperatura_Medium, !umidadeAr);
and Aspersao(aspersao, !umidadeSolo, !alarme, or_AndNotTemperaturaMedium_NotUmidadeAr);

encoderNivelCaixa(
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

encoderTipoRega(
  .gotejamento(gotejamento),
  .aspersao(aspersao),
  .segA(segA_TipoRega),
  .segB(segB_TipoRega),
  .segC(segC_TipoRega),
  .segD(segD_TipoRega),
  .segE(segE_TipoRega),
  .segF(segF_TipoRega),
  .segG(segG_TipoRega)
);

//matriz de sete segmentos
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
