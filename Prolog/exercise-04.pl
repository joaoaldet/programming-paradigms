progenitor(urano, cronos).
progenitor(cronos, zeus).
progenitor(cronos, hades).
progenitor(cronos, posseidon).
progenitor(zeus, ares).
progenitor(zeus, atena).

ancestral(A, D) :-
    progenitor(A, D).

ancestral(A, D) :-
    progenitor(A, Z),
    ancestral(Z, D).
