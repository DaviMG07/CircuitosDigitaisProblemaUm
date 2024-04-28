module teste(
  umidadeAr,
  umidadeSolo,
  temperatura,
  gotejamento,
  aspersao,
  high,
  mediun,
  low,
  erro,
  alarme,
  valvulaEntrada,
  chaveSeletora,
  saidaMux
);

//medium está escrito como mediun por que medium é palavra reservada
input umidadeAr, umidadeSolo, temperatura, high, mediun, low, chaveSeletora;
output gotejamento, aspersao, erro, alarme, valvulaEntrada, saidaMux;

wire not_umidadeAr, not_umidadeSolo, not_temperatura, not_high, not_medium, critico, not_chaveSeletora, not_erro;

not(critico, low);
not(not_temperatura, temperatura);

and(and_high_notMedium, high, not_medium);
and(and_medium_critico, mediun, critico);
or(erro, and_high_notMedium, and_medium_critico);

or(alarme, erro, critico);

nor(valvulaEntrada, high, erro);

and(and_medium_notTemperatura, mediun, not_temperatura);
or(or_andMediumANDnotTemperatura_notUmidadeAr, and_medium_notTemperatura, not_umidadeAr);
and(aspersao, not_alarme, not_umidadeSolo, or_andMediumANDnotTemperatura_notUmidadeAr);

or(or_temperatura_notMedium, temperatura, not_medium);
and(gotejamento, not_alarme, not_umidadeSolo, umidadeAr, or_temperatura_notMedium);

endmodule

module mux(nivelCaixa, tipoRega, chaveSeletora, saidaMux);
  input nivelCaixa, tipoRega, chaveSeletora;
  output saidaMux;

  wire not_chaveSeletora, and_notChaveSeletora_nivelCaixa, and_chaveSeletora_tipoRega;

  not(not_chaveSeletora, chaveSeletora);
  and(and_notChaveSeletora_nivelCaixa, not_chaveSeletora, nivelCaixa);
  and(and_chaveSeletora_tipoRega), chaveSeletora, tipoRega;
  or(saidaMux, and_notChaveSeletora_nivelCaixa, and_chaveSeletora_tipoRega);

endmodule
