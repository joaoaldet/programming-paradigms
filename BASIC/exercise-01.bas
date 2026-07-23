10 INPUT "Digite a primeira nota: ", N1
20 INPUT "Digite a segunda nota: ", N2
30 MEDIA = (N1 + N2) / 2
40 PRINT "Sua média inicial foi: ", MEDIA
50 IF MEDIA > 60 THEN PRINT "Aprovado direto." : END
60 IF MEDIA < 30 THEN PRINT "Reprovado direto." : END
70 PRINT "Sua média está entre 30 e 60. Será necessário fazer a NP3."
80 INPUT "Digite a nota da NP3: ", N3
90 MEDIA = (N1 + N2 + N3) / 3
100 PRINT "Sua nova média é: ", MEDIA
110 IF MEDIA > 50 THEN PRINT "Aprovado pela NP3." ELSE PRINT "Reprovado na NP3."
120 END
