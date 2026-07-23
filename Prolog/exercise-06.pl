disciplina(calculo1, fundamental, 4).
disciplina(calculo2, matematica, 6).
disciplina(algebra, matematica, 4).
disciplina(matematica_discreta, algoritmos, 3).
disciplina(calculo3, matematica, 6).
disciplina(inteligencia_artificial, algoritmos, 4).

prerequisito(calculo2, calculo1).
prerequisito(calculo3, calculo2).
prerequisito(inteligencia_artificial, matematica_discreta).
prerequisito(inteligencia_artificial, algebra).

concluiu(joao, calculo1).
concluiu(joao, algebra).
concluiu(joao, matematica_discreta).

concluiu(maria, calculo1).
concluiu(maria, algebra).

falta_concluir(Aluno, Disciplina) :-
    prerequisito(_, Disciplina),
    \+ concluiu(Aluno, Disciplina).

aluno_apto(Aluno, Disciplina) :-
    disciplina(Disciplina, Area, _),
    Area \= fundamental,
    forall(prerequisito(Disciplina, P), concluiu(Aluno, P)).
