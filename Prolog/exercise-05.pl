disciplina(calculo1, matematica, 4).
disciplina(calculo2, matematica, 6).
disciplina(algebra, matematica, 4).
disciplina(matematica_discreta, algoritmos, 3).
disciplina(calculo3, matematica, 6).

prerequisito(calculo2, calculo1).
prerequisito(fisica1, calculo1).
prerequisito(calculo3, calculo2).

alto_impacto(D) :-
    disciplina(D, _, Cred),
    Cred > 5,
    prerequisito(D1, D),
    prerequisito(D2, D),
    D1 \= D2.

nao_prerequisito(D) :-
    \+ prerequisito(_, D).

disciplina_matematica_sem_prereq(D) :-
    disciplina(D, matematica, 4),
    nao_prerequisito(D).
