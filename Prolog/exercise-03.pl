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

irmaos_germanos(A, B) :-
    filho(A, P),
    filho(B, P),
    mae(A, M),
    mae(B, M),
    A \= B.
