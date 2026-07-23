dominio(zeus, ceu).
dominio(zeus, trovao).
dominio(posseidon, mar).
dominio(posseidon, terremoto).
dominio(hades, submundo).

habitar(zeus, olimpo).
habitar(posseidon, olimpo).
habitar(hades, submundo).

deus_maior(Deus) :-
    habitar(Deus, olimpo),
    findall(D, dominio(Deus, D), L),
    length(L, N),
    N >= 2.
