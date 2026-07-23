(defstruct item
  nome
  tipo
  preco
  forca-magica)

(defparameter *catalogo*
  (list
   (make-item :nome "Espada Sombria" :tipo "Arma" :preco 200 :forca-magica 90)
   (make-item :nome "Poção de Sussurros" :tipo "Pocao" :preco 50 :forca-magica 20)
   (make-item :nome "Máscara do Véu" :tipo "Artefato" :preco 300 :forca-magica 70)
   (make-item :nome "Machado do Vazio" :tipo "Arma" :preco 250 :forca-magica 120)
   (make-item :nome "Frasco Carmesim" :tipo "Pocao" :preco 80 :forca-magica 40)))

(defun adiciona-imposto (preco)
  (* preco 1.15))

(defun bonus-maldicao (forca)
  (if (> forca 80)
      (* forca 1.5)
      forca))

(defun processa-venda (catalogo)
  (let* ((armas (remove-if-not (lambda (i)
                                 (string= (item-tipo i) "Arma"))
                               catalogo))
         (armas-precificadas (mapcar (lambda (i)
                                       (make-item :nome (item-nome i)
                                                  :tipo (item-tipo i)
                                                  :preco (adiciona-imposto (item-preco i))
                                                  :forca-magica (item-forca-magica i)))
                                     armas)))
    (mapcar (lambda (i)
              (list (item-nome i)
                    (bonus-maldicao (item-forca-magica i))))
            armas-precificadas)))

(processa-venda *catalogo*)
