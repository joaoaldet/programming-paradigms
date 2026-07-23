disciplina(calculo1, matematica, 4).
disciplina(algebra, matematica, 4).
disciplina(programacao1, computacao, 4).
disciplina(programacao2, computacao, 4).
disciplina(ia, aplicacoes, 4).

prerequisito(programacao2, programacao1).
prerequisito(ia, programacao2).

disciplina_raiz(D) :-
    disciplina(D, _, _),
    \+ prerequisito(_, D).

disciplina_folha(D) :-
    disciplina(D, _, _),
    \+ prerequisito(D, _).
