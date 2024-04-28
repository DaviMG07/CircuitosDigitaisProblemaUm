module returnMux(
  ifTrue,
  ifFalse,
  chaveSeletora,
  saidaMux
);

input ifTrue, ifFalse, chaveSeletora;
output saidaMux;

wire and_ChaveSeletora_IfTrue, and_NotChaveSeletora_IfFalse;

and (and_ChaveSeletora_IfTrue, chaveSeletora, ifTrue);
and (and_NotChaveSeletora_IfFalse, !chaveSeletora, ifFalse);

or (saidaMux, and_ChaveSeletora_IfTrue, and_NotChaveSeletora_IfFalse);

endmodule
