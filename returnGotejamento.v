module returnGotejamento(
	not_Medium,
	not_UmidadeSolo,
	umidadeAr,
	temperatura,
	not_Alarme,
	gotejamento
);

input not_Medium, not_UmidadeSolo, umidadeAr, temperatura, not_Alarme;
output gotejamento;

wire or_Temperatura_NotMedium;

or (or_Temperatura_NotMedium, temperatura, not_Medium);
and (gotejamento, not_Alarme, not_UmidadeSolo, umidadeAr, or_Temperatura_NotMedium);

endmodule
