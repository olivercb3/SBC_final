(deffunction preguntas::preguntaBinaria (?text $?valors-permesos)
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
(deffunction preguntas::preguntaInteger (?text ?min ?max)
	(printout t crlf)
	(printout t ?text crlf)
	(bind ?r (read))
	(while (not(and(>= ?r ?min)(<= ?r ?max))) do
    (printout t "Numero invalido, tiene que estar entre " ?min " i " ?max crlf)
		(bind ?r (read))
	)
	?r
)

(deffunction preguntas::preguntaIntegerUnbound (?text)
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
(deffunction preguntas::preguntaMalaltiesPositiva (?text)
  (bind ?valors (create$ "cardiovascular" "hipertension" "diabetes" "pulmonar" "osteoporosis" "cancer" "artritis_reumatoide" "depresion" "fibrosis_quistica"))
  (printout t crlf)
  (format t "%s (%s) " ?text (implode$ ?valors))
  (printout t crlf)
  (bind ?r (readline))
  (bind ?r (str-cat ?r))
  (bind $?enfermedades (create$ ))
  (while TRUE
    do
    (bind ?op1 (lowcase ?r))
    (if (eq (str-compare "final" ?op1) 0)
      then (return $?enfermedades) )
    (if (member$ ?op1 ?valors)
      then 
          (bind ?e (find-instance ((?inst Enfermedad)) (eq (str-compare (lowcase ?inst:nombre) ?op1) 0) ))
          (bind $?enfermedades (insert$ $?enfermedades (+ (length$ $?enfermedades) 1) ?e) )
    )
    (printout t ?text crlf)
    (bind ?r (readline))
    (bind ?r (str-cat ?r))
  )
  (return (create$ 0))
)

(defrule preguntas::PreguntesSolicitant
    (not (object (is-a Persona)))
    =>
    (bind ?valorsPermesosBinari (create$ si no))
    (bind ?edad (preguntaInteger "Cuantos anos tienes?" 60 100))
    (bind ?altura (preguntaInteger "Cuanto mides (en cm)?" 130 250))
    (bind ?peso (preguntaInteger "Cuanto pesas (en kg)?" 40 200))
    (bind ?disc_sup (preguntaBinaria "Tienes alguna discapacidad del tren superior?" ?valorsPermesosBinari))
    (bind ?disc_inf (preguntaBinaria "Tienes alguna discapacidad del tren inferior?" ?valorsPermesosBinari))
    (bind ?material (preguntaBinaria "Tienes la capacidad de ir a un gimnasio o dispones de las instalaciones equivalentes?" ?valorsPermesosBinari))
    (bind ?caid (preguntaBinaria "Has tenido alguna caida en los ultimos 6 meses?" ?valorsPermesosBinari))
    (bind ?dias_deporte (preguntaInteger "Cuantos dias a la semana sueles practicar deporte?" 0 7))
    (bind ?agotamiento (preguntaBinaria "Al subir escaleras sientes agotamiento?" ?valorsPermesosBinari))
    (bind ?dias_posibles (preguntaInteger "Cuantos dias a la semana tienes disponibilidad para entrenar?" 3 7))
    (bind $?enfermedades (preguntaMalaltiesPositiva "Sufres de alguna de las siguientes enfermedades? Indiquelas en minusucla y una por linea. Al final esriba final, para poder continuar."))

    (make-instance [p] of Persona 
      (sufre $?enfermedades)
      (agotamiento ?agotamiento)
      (altura ?altura)
      (dias_deporte ?dias_deporte)
      (discapacidad_tren_inferior ?disc_inf)
      (discapacidad_tren_superior ?disc_sup)
      (edad ?edad)
      (expuesto_a_caídas ?caid)
      (material ?material)
      (peso ?peso)  
    )

  (printout t crlf)
	(printout t "----------- Preguntas Realizadas ------------" crlf)
  (focus abstraccion)
)
