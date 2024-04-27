module PBL(UmidadeAr, UmidadeSolo, Temperatura, Gotejamento, Aspersao, High, Medium, Low, Erro, Alarme, ValvulaEntrada, ChaveSeletora, SaidaMux);
    
	input UmidadeAr, UmidadeSolo, Temperatura, High, Medium, Low, ChaveSeletora;
	output Gotejamento, Aspersao, Erro, Alarme, ValvulaEntrada, SaidaMux;
   
	wire Caixa_A, Caixa_B, Caixa_C, Caixa_D, Caixa_E, Caixa_F, Caixa_G;
	wire Aciona_A, Aciona_B, Aciona_C, Aciona_D, Aciona_E, Aciona_F, Aciona_G;
	
	wire notUmidadeSolo, notMedium, or_notMedium_Temperatura, F4, notUmidadeAr, er;
	wire A1, notMedium2, notLow, notTemperatura, A5, notHigh;
	wire E1, E2, E3, E4;
	wire As1, As2, X1, notAlarme;
    
	not(notUmidadeSolo, UmidadeSolo);
	not(notUmidadeAr, UmidadeAr);
	not(notMedium, Medium);
	not(notMedium2, Medium);
	not(notHigh, High);
	not(notLow, Low);
	not(notTemperatura, Temperatura);
    
	//Sistema de Gotejamento
	or(or_notMedium_Temperatura, notMedium, Temperatura);
	and(Gotejamento, notUmidadeSolo, UmidadeAr, or_notMedium_Temperatura, notAlarme);
    
	// ChaveSeletoraistema de Aspersao
	and(As1, m, notTemperatura, notUmidadeSolo);
	and(As2, notUmidadeSolo, notUmidadeAr);
	or(X1, As2, As1);
     not(notAlarme, Alarme);
     and(Aspersao, X1, notAlarme);
    
	not(E1, m);
	not(E2, l);
    
	and(E3, High, E1);
	and(E4, m, E2);
    
	// Erro
	or(Erro, E3, E4);
	not(er, Erro);
    
	//Alarme
	or(Alarme, E2, Erro);
    
	//ValvulaEntrada de Agua
	and(ValvulaEntrada, er, notHigh);
	// ----------------------------------------------------
	// CHighamando o Codificador da Caixa D'água
	CodificaCxa Caixa(
	.High(High), 
	.m(m), 
	.l(l), 
	.Caixa_A(Caixa_A), 
	.Caixa_B(Caixa_B), 
	.Caixa_C(Caixa_C), 
	.Caixa_D(Caixa_D), 
	.Caixa_E(Caixa_E), 
	.Caixa_F(Caixa_F), 
	.Caixa_G(Caixa_G)
	);
	
	// CHighamando o Codificador dos Acionamentos de Irrigação
	CodificaAciona Aciona(
	.Gotejamento(Gotejamento), 
	.Aspersao(Aspersao), 
	.Aciona_A(Aciona_A), 
	.Aciona_B(Aciona_B), 
	.Aciona_C(Aciona_C), 
	.Aciona_D(Aciona_D), 
	.Aciona_E(Aciona_E), 
	.Aciona_F(Aciona_F), 
	.Aciona_G(Aciona_G)
	);

	// Multiplexadores >>>
	
	Multiplexador Mux1(
	.acio(Aciona_A), 
	.cxa(Caixa_A), 
	.ChaveSeletora(ChaveSeletora), 
	.SaidaMux(SaidaMux)
	);
	
	Multiplexador Mux2(
	.acio(Aciona_B), 
	.cxa(Caixa_B), 
	.ChaveSeletora(ChaveSeletora), 
	.SaidaMux(SaidaMux)
	);
	
	Multiplexador Mux3(
	.acio(Aciona_C), 
	.cxa(Caixa_C), 
	.ChaveSeletora(ChaveSeletora), 
	.SaidaMux(SaidaMux)
	);
	
	Multiplexador Mux4(
	.acio(Aciona_D), 
	.cxa(Caixa_D), 
	.ChaveSeletora(ChaveSeletora), 
	.SaidaMux(SaidaMux)
	);
	
	Multiplexador Mux5(
	.acio(Aciona_E), 
	.cxa(Caixa_E), 
	.ChaveSeletora(ChaveSeletora), 
	.SaidaMux(SaidaMux)
	);
	
	Multiplexador Mux6(
	.acio(Aciona_F), 
	.cxa(Caixa_F), 
	.ChaveSeletora(ChaveSeletora), 
	.SaidaMux(SaidaMux)
	);
	
	Multiplexador Mux7(
	.acio(Aciona_G), 
	.cxa(Caixa_G), 
	.ChaveSeletora(ChaveSeletora), 
	.SaidaMux(SaidaMux)
	);
	
endmodule

module CodificaCxa(High, m, l, Caixa_A, Caixa_B, Caixa_C, Caixa_D, Caixa_E, Caixa_F, Caixa_G);
    
	 wire nlow, nmedium, nHighigHigh;
	 
    input l, m, High;
	 not(nlow, l);
	 not(nmedium, m);
	 not(nHighigHigh, High);
	 wire auxe, auxe2;
	 wire auxf, auxf2;
	 
    output Caixa_A, Caixa_B, Caixa_C, Caixa_D, Caixa_E, Caixa_F, Caixa_G;
    
	 // Letra A
	 and(Caixa_A, nlow, High);
	 
	 // Letra B
	 or(Caixa_B, l, nlow);
	 
	 // Letra C
	 or(Caixa_C, l, nlow);
	 
	 // Letra D
	 and(Caixa_D, l, nlow);
	 
	 // Letra E
	 and(auxe, nlow, High);
	 and(auxe2, m, High);
	 or(Caixa_E, auxe, auxe2);
	 
	 // Letra F
	 and(auxf, nlow, High);
	 and(auxf2, m, High);
	 or(Caixa_F, auxf, auxf2);
	 
	 // Letra G
	 and(Caixa_G, nlow, nmedium, nHighigHigh);
    
endmodule

module Multiplexador(cxa, acio, ChaveSeletora, SaidaMux);
	input cxa, acio;
	input ChaveSeletora;
	output SaidaMux;
	
	wire ChaveSeletoraneg, a1, b1;
 
	not (Sneg, ChaveSeletora);
	and (a1, ChaveSeletoraneg, cxa);
	and (b1, ChaveSeletora, acio);
	or  (SaidaMux, a1, b1);
	
endmodule
