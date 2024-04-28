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

wire S0AC0, S0BC0, S0CC0, S0DC0, S0EC0, S0FC0, S0GC0;
wire S0AR0, S0BR0, S0CR0, S0DR0, S0ER0, S0FR0, S0GR0;
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

endmodule
