(defmodule preguntas)

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

(defrule PreguntesSolicitant
    ?trigger <- (preguntar)
    =>
    (bind ?valorsPermesosBinari (create$ "si" "no"))
    
   (bind ?edad (preguntaInteger "Cuantos años tienes?" 1 100))
    (bind ?altura (preguntaInteger "Cuanto mides (en cm)?" 50 250))
    (bind ?pes (preguntaInteger "Cuanto pesas (en kg)?" 40 200))
    (bind ?disc_sup (preguntaBinaria "Tienes alguna discapacidad del tren superior?" ?valorsPermesosBinari))
    (bind ?disc_inf (preguntaBinaria "Tienes alguna discapacidad del tren inferior?" ?valorsPermesosBinari))
    (bind ?caid (preguntaBinaria "Has tenido alguna caída en los últimos 6 meses?" ?valorsPermesosBinari))
    (bind ?dias_deporte (preguntaInteger "Cuantos días a la semana sueles practicar deporte?" 0 7))
    (bind ?agotamiento (preguntaBinaria "Al subir escaleras sientes agotamiento?" ?valorsPermesosBinari))
    (bind ?dias_posibles (preguntaBinaria "Cuantos días a la semana tienes disponibilidad para entrenar?" 3 7))
    (bind ?penfermedad (preguntaMalaltiesPositiva "Sufres de alguna de las siguientes enfermedades? Indiquelas en minúsucla y separadas por un espacio. Al final esribe la palabra final, para poder proceder."))



    (make-instance [p] of Persona 
        (altura ?altura)
        (discapacidad_tren_inferior ?disc_inf)
        (discapacidad_tren_superior ?disc_sup)
        (edad ?edad)
        (expuesto_a_caídas ?caid)
        (altura ?altura)
        (nivel_de_forma 0)
        (peso ?peso)
        
      )

    assert(cercar)
)
