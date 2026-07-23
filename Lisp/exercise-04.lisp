(defstruct ocorrencia
  nome
  ritual
  nivel-medo
  agentes-enviados)

(defun soma-medo-recursiva (lista-ocorrencias)
  (if (null lista-ocorrencias)
      0
      (+ (ocorrencia-nivel-medo (car lista-ocorrencias))
         (soma-medo-recursiva (cdr lista-ocorrencias)))))

(defun analise-final (lista-ocorrencias)
  (let* ((total (soma-medo-recursiva lista-ocorrencias))
         (qtd (length lista-ocorrencias))
         (media (/ total qtd)))
    (mapcar #'ocorrencia-nome
            (remove-if-not (lambda (o)
                             (and (> (ocorrencia-agentes-enviados o) 3)
                                  (> (ocorrencia-nivel-medo o) media)))
                           lista-ocorrencias))))

(defparameter *missoes*
  (list
   (make-ocorrencia :nome "Rito da Névoa" :ritual "Selo" :nivel-medo 40 :agentes-enviados 2)
   (make-ocorrencia :nome "Invocação do Sanguíneo" :ritual "Sacrifício" :nivel-medo 90 :agentes-enviados 5)
   (make-ocorrencia :nome "Choros do Subsolo" :ritual "Ressonância" :nivel-medo 60 :agentes-enviados 4)
   (make-ocorrencia :nome "Eco Carmesim" :ritual "Projeção" :nivel-medo 20 :agentes-enviados 1)
   (make-ocorrencia :nome "Dama da Janela" :ritual "Manifestação" :nivel-medo 75 :agentes-enviados 6)))

(analise-final *missoes*)
