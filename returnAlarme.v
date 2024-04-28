module returnAlarme(
	highLevel,
	mediumLevel,
	lowLevel,
	erro,
	alarme
);

input highLevel, mediumLevel, lowLevel;
output alarme, erro;

wire not_Medium, not_Low;
wire and_High_notMedium, and_Medium_notLow;

not (not_Medium, mediumLevel);
not (not_Low, lowLevel);

and and_HighNotMedium(and_High_notMedium, highLevel, not_Medium);
and and_MediumNotLow(and_Medium_notLow, mediumLevel, not_Low);
or or_erro(erro, and_High_notMedium, and_Medium_notLow);

or or_alarme(alarme, erro, not_Low);
 
endmodule