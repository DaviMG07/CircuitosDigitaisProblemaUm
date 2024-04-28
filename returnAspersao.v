module returnAspersao(
	mediumLevel,
	not_Temperatura,
	not_UmidadeAr,
	not_UmidadeSolo,
	not_Alarme,
  aspersao
);

input mediumLevel, not_Temperatura, not_UmidadeAr, not_UmidadeSolo, not_Alarme;
output aspersao;

wire and_NotTemperatura_Medium, or_AndNotTemperaturaMedium_NotUmidadeAr;

and (and_NotTemperatura_Medium, not_Temperatura, mediumLevel);
or (or_AndNotTemperaturaMedium_NotUmidadeAr, and_NotTemperatura_Medium, not_UmidadeAr);

and (aspersao, not_Alarme, not_UmidadeSolo, or_AndNotTemperaturaMedium_NotUmidadeAr);

endmodule
