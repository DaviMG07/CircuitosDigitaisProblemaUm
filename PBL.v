module PBL(UmidadeAr, UmidadeSolo, Temperatura, Gotejamento, Aspersao, High, Medium, Low, Erro, Alarme, ValvulaEntrada, ChaveSeletora, SaidaMux);
    
	input UmidadeAr, UmidadeSolo, Temperatura, High, Medium, Low, ChaveSeletora;
	output Gotejamento, Aspersao, Erro, Alarme, ValvulaEntrada, SaidaMux;
   
	wire segmentoA_NivelCaixa, segmentoB_NivelCaixa, segmentoC_NivelCaixa, segmentoD_NivelCaixa, segmentoE_NivelCaixa, segmentoF_NivelCaixa, segmentoG_NivelCaixa;
	wire segmentoA_TipoRega, segmentoB_TipoRega, segmentoC_TipoRega, segmentoD_TipoRega, segmentoE_TipoRega, segmentoF_TipoRega, segmentoG_TipoRega;
	
	wire notUmidadeSolo, notMedium, or_notMedium_Temperatura, F4, notUmidadeAr, er;
	wire A1, notMedium2, notLow, notTemperatura, A5, notHigh;
	wire notMedium2, notLow2, and_High_notMedium2, and_Medium_notLow2;
	wire and_Medium_notTemperatura_notUmidadeSolo, and_notUmidadeSolo_UmidadeAr, or__and_notUmidadeSolo_UmidadeAr__and_Medium_notTemperatura_notUmidadeSolo, notAlarme;
    
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
    
	//Sistema de Aspersao
	and(and_Medium_notTemperatura_notUmidadeSolo, Medium, notTemperatura, notUmidadeSolo);
	and(and_notUmidadeSolo_UmidadeAr, notUmidadeSolo, notUmidadeAr);
	or(or__and_notUmidadeSolo_UmidadeAr__and_Medium_notTemperatura_notUmidadeSolo, and_notUmidadeSolo_UmidadeAr, and_Medium_notTemperatura_notUmidadeSolo);
     not(notAlarme, Alarme);
     and(Aspersao, or__and_notUmidadeSolo_UmidadeAr__and_Medium_notTemperatura_notUmidadeSolo, notAlarme);
    
	not(notMedium2, Medium);
	not(notLow2, Low);
    
	and(and_High_notMedium2, High, notMedium2);
	and(and_Medium_notLow2, Medium, notLow2);
    
	//Erro
	or(Erro, and_High_notMedium2, and_Medium_notLow2);
	not(er, Erro);
    
	//Alarme
	or(Alarme, notLow2, Erro);
    
	//ValvulaEntrada de Agua
	and(ValvulaEntrada, er, notHigh);
	//----------------------------------------------------
	//Chamando o Codificador da Caixa D'água
	CodificaCxa Caixa(
	.High(High), 
	.Medium(Medium), 
	.Low(Low), 
	.segmentoA_NivelCaixa(segmentoA_NivelCaixa), 
	.segmentoB_NivelCaixa(segmentoB_NivelCaixa), 
	.segmentoC_NivelCaixa(segmentoC_NivelCaixa), 
	.segmentoD_NivelCaixa(segmentoD_NivelCaixa), 
	.segmentoE_NivelCaixa(segmentoE_NivelCaixa), 
	.segmentoF_NivelCaixa(segmentoF_NivelCaixa), 
	.segmentoG_NivelCaixa(segmentoG_NivelCaixa)
	);
	
	//Chamando o Codificador dos Acionamentos de Irrigação
	CodificaAciona Aciona(
	.Gotejamento(Gotejamento), 
	.Aspersao(Aspersao), 
	.segmentoA_TipoRega(segmentoA_TipoRega), 
	.segmentoB_TipoRega(segmentoB_TipoRega), 
	.segmentoC_TipoRega(segmentoC_TipoRega), 
	.segmentoD_TipoRega(segmentoD_TipoRega), 
	.segmentoE_TipoRega(segmentoE_TipoRega), 
	.segmentoF_TipoRega(segmentoF_TipoRega), 
	.segmentoG_TipoRega(segmentoG_TipoRega)
	);

	//Multiplexadores >>>
	
	Multiplexador Mux1(
	.acio(segmentoA_TipoRega), 
	.cxa(segmentoA_NivelCaixa), 
	.ChaveSeletora(ChaveSeletora), 
	.SaidaMux(SaidaMux)
	);
	
	Multiplexador Mux2(
	.acio(segmentoB_TipoRega), 
	.cxa(segmentoB_NivelCaixa), 
	.ChaveSeletora(ChaveSeletora), 
	.SaidaMux(SaidaMux)
	);
	
	Multiplexador Mux3(
	.acio(segmentoC_TipoRega), 
	.cxa(segmentoC_NivelCaixa), 
	.ChaveSeletora(ChaveSeletora), 
	.SaidaMux(SaidaMux)
	);
	
	Multiplexador Mux4(
	.acio(segmentoD_TipoRega), 
	.cxa(segmentoD_NivelCaixa), 
	.ChaveSeletora(ChaveSeletora), 
	.SaidaMux(SaidaMux)
	);
	
	Multiplexador Mux5(
	.acio(segmentoE_TipoRega), 
	.cxa(segmentoE_NivelCaixa), 
	.ChaveSeletora(ChaveSeletora), 
	.SaidaMux(SaidaMux)
	);
	
	Multiplexador Mux6(
	.acio(segmentoF_TipoRega), 
	.cxa(segmentoF_NivelCaixa), 
	.ChaveSeletora(ChaveSeletora), 
	.SaidaMux(SaidaMux)
	);
	
	Multiplexador Mux7(
	.acio(segmentoG_TipoRega), 
	.cxa(segmentoG_NivelCaixa), 
	.ChaveSeletora(ChaveSeletora), 
	.SaidaMux(SaidaMux)
	);
	
endmodule

module CodificaCxa(High, Medium, Low, segmentoA_NivelCaixa, segmentoB_NivelCaixa, segmentoC_NivelCaixa, segmentoD_NivelCaixa, segmentoE_NivelCaixa, segmentoF_NivelCaixa, segmentoG_NivelCaixa);
    
	 wire notLow, notMedium, notHigh;
	 
    input Low, Medium, High;
	 not(notLow, Low);
	 not(notMedium, Medium);
	 not(notHigh, High);
	 wire auxe, auxe2;
	 wire auxf, auxf2;
	 
    output segmentoA_NivelCaixa, segmentoB_NivelCaixa, segmentoC_NivelCaixa, segmentoD_NivelCaixa, segmentoE_NivelCaixa, segmentoF_NivelCaixa, segmentoG_NivelCaixa;
    
	 //Letra A
	 and(segmentoA_NivelCaixa, notLow, High);
	 
	 //Letra B
	 or(segmentoB_NivelCaixa, Low, notLow);
	 
	 //Letra C
	 or(segmentoC_NivelCaixa, Low, notLow);
	 
	 //Letra D
	 and(segmentoD_NivelCaixa, Low, notLow);
	 
	 //Letra E
	 and(auxe, notLow, High);
	 and(auxe2, Medium, High);
	 or(segmentoE_NivelCaixa, auxe, auxe2);
	 
	 //Letra F
	 and(auxf, notLow, High);
	 and(auxf2, Medium, High);
	 or(segmentoF_NivelCaixa, auxf, auxf2);
	 
	 //Letra G
	 and(segmentoG_NivelCaixa, notLow, notMedium, notHigh);
    
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
