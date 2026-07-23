(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

(defparameter *catalogo*
  (list
   (make-criatura :nome "Peixe Safe Shallows" :ambiente "Shallows" :periculosidade "Baixa" :vida-media 5)
   (make-criatura :nome "Reaper Leviathan" :ambiente "Ocean" :periculosidade "Alta" :vida-media 80)
   (make-criatura :nome "Ghost Ray" :ambiente "Deep" :periculosidade "Média" :vida-media 30)
   (make-criatura :nome "Crab Squid" :ambiente "Deep" :periculosidade "Alta" :vida-media 50)))

(defun filtra-por-perigo (catalogo)
  (remove-if (lambda (c)
               (string= (criatura-periculosidade c) "Baixa"))
             catalogo))

(defun relatorio-profundidade (catalogo)
  (mapcar (lambda (c)
            (format nil "~a: Vive em ~a" (criatura-nome c) (criatura-ambiente c)))
          (remove-if-not (lambda (c)
                           (string= (criatura-ambiente c) "Deep"))
                         catalogo)))

(list
 (filtra-por-perigo *catalogo*)
 (relatorio-profundidade *catalogo*))
