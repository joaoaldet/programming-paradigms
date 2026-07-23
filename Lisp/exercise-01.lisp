(defun calcula-dosagem (peso-kg idade-anos)
  (cond
    ((or (< idade-anos 5) (< peso-kg 20)) 10)
    ((and (>= idade-anos 5) (<= idade-anos 12) (>= peso-kg 20)) 25)
    (t 50)))

(defun ajusta-preco (preco-base nome-da-erva)
  (cond
    ((string= nome-da-erva "Ginseng") (* preco-base 3.0))
    ((string= nome-da-erva "Lótus") (* preco-base 1.5))
    (t preco-base)))

(let* ((idade 14)
       (peso 60)
       (preco-base 10)
       (erva "Lótus")
       (dose (calcula-dosagem peso idade))
       (preco (ajusta-preco preco-base erva)))
  (list :dosagem dose :preco-final preco))

(list
 (calcula-dosagem 15 3)
 (calcula-dosagem 25 10)
 (calcula-dosagem 70 30)
 (ajusta-preco 10 "Ginseng")
 (ajusta-preco 10 "Lótus")
 (ajusta-preco 10 "Outra"))
