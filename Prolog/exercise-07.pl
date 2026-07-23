disciplina(programacao1, computacao, 4).
disciplina(programacao2, computacao, 4).
disciplina(matematica_discreta, matematica, 3).
disciplina(calculo1, matematica, 4).

concluiu(joao, programacao1).
concluiu(joao, programacao2).
concluiu(joao, matematica_discreta).

concluiu(maria, programacao1).

concluiu(pedro, programacao1).
concluiu(pedro, programacao2).

concluiu(ana, calculo1).

especialista_comp(Aluno) :-
    findall(D, (disciplina(D, computacao, _), concluiu(Aluno, D)), L),
    length(L, N),
    N >= 2.

deficiencia_mat(Aluno) :-
    \+ concluiu(Aluno, D),
    disciplina(D, matematica, _).
