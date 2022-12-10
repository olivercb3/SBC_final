;;;-------------------------------PREGUNTAS-------------------------------------


;; Pregunta segur(si/no), (si/no), indiferent
(deffunction preguntaBinaria (?text $?valors-permesos)
  (printout t crlf)
  (format t "%s (%s) " ?text (implode$ ?valors-permesos))
  (printout t crlf)
  (bind ?r (read))
  (while (not (member$ (lowcase ?r) ?valors-permesos)) do
    (format t "¿%s? (%s) " ?text (implode$ ?valors-permesos))
    (printout t crlf)
    (bind ?r (read))
  )
  (if (eq (str-compare "si" ?r) 0)
    then (bind ?resp TRUE)
    else
      (if (eq (str-compare "no" ?r) 0)
        then (bind ?resp FALSE)
      )
    )
    ?resp
)

;;; Pregunta per un integer
(deffunction preguntaInteger (?text ?min ?max)
	(printout t crlf)
	(printout t ?text crlf)
	(bind ?r (read))
	(while (not(and(>= ?r ?min)(<= ?r ?max))) do
    (printout t "Numero invalid; ha d'estar entre " ?min " i " ?max crlf)
		(bind ?r (read))
	)
	?r
)

(deffunction preguntaIntegerUnbound (?text)
	(printout t crlf)
	(printout t ?text crlf)
	(bind ?r (read))
	(while (not (and (integerp ?r) (>= ?r 0))) do
    		(printout t "Introdueix un número positiu" crlf)
		(bind ?r (read))
	)
	?r
)

;; Pregunta serveis positiva
(deffunction preguntaMalaltiesPositiva (?text)
  (bind ?valors-serveis (create$ "cardiovascular" "hipertension" "sobrepeso" "diabetes" "pulmonar" "osteoporosis" "cancer" "artritis reumatoide" "depresion"))
  (printout t crlf)
  (format t "%s (%s) " ?text (implode$ ?valors-serveis))
  (printout t crlf)
  (bind ?r (readline))
  (bind ?r (str-cat ?r))
  (while TRUE
    do
    (bind ?op1 (lowcase ?r))
    (if (eq (str-compare "final" ?op1) 0)
      then (return (create$ 0 null))
    )
    (if (member$ ?op1 ?valors-serveis)
      then (return (create$ 1 ?op1))
    )
    (printout t ?text crlf)
    (bind ?r (readline))
    (bind ?r (str-cat ?r))
  )
  (return (create$ 0 null))
)