10 RANDOMIZE TIMER
20 NUM = INT(RND * 101)
30 PRINT "Tente adivinhar o número entre 0 e 100"
40 INPUT "Digite seu palpite: ", PALPITE
50 IF PALPITE = NUM THEN PRINT "Você acertou!": END
60 IF PALPITE < NUM THEN PRINT "O número correto é MAIOR que ", PALPITE
70 IF PALPITE > NUM THEN PRINT "O número correto é MENOR que ", PALPITE
80 GOTO 40
