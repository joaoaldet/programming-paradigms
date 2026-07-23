filho(zeus, cronos).
filho(hades, cronos).
filho(posseidon, cronos).
filho(hera, cronos).
filho(demeter, cronos).
filho(hestia, cronos).

mae(zeus, reia).
mae(hades, reia).
mae(posseidon, reia).
mae(hera, reia).
mae(demeter, reia).
mae(hestia, reia).

dominio(zeus, ceu).
dominio(posseidon, mar).
dominio(hades, submundo).

divindade_olimpica(Deus) :-
    filho(Deus, cronos),
    dominio(Deus, Dominio),
    member(Dominio, [ceu, mar, submundo]).
