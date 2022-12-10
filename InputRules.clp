
(deftemplate Persona
    (slot altura (type INTEGER))
    (slot discapacidad_tren_inferior (type INTEGER))
    (slot discapacidad_tren_superior (type INTEGER))
    (slot edad (type INTEGER))
    (slot expuesto_a_caídas (type INTEGER))
    (slot agotamiento (type INTEGER))
    (slot peso (type INTEGER))
    (slot dias_deporte (type INTEGER))
    (slot dias_posibles (type INTEGER))
)

(defrule main "Main"
  ;hauria de ser amb initial-fact pero no sabem com es fa
  ?trigger <- (initial-main)
	=>
	(reset)
	(printout t crlf)
	(printout t "----------- Prototip Inicial ------------" crlf)
	(assert (preguntar))
)

(defrule PreguntesSolicitant
    ?trigger <- (preguntar)
    =>
<<<<<<< HEAD
    (bind ?edad (preguntaInteger "Cuantos años tienes?" 1 100))
    (bind ?altura (preguntaInteger "Cuanto mides (en cm)?" 50 250))
    (bind ?pes (preguntaInteger "Cuanto pesas (en kg)?" 40 200))
    (bind ?disc_sup (preguntaIntegerUnbound "Tienes alguna discapacidad del tren superior?"))
    (bind ?disc_inf (preguntaIntegerUnbound "Tienes alguna discapacidad del tren inferior?"))
    (bind ?caid (preguntaIntegerUnbound "Has tenido alguna caída en los últimos 6 meses?"))
    (bind ?dias_deporte (preguntaInteger "Cuantos días a la semana sueles practicar deporte?" 3 7))
    (bind ?agotamiento (preguntaIntegerUnbound "Al subir escaleras sientes agotamiento?"))
    (bind ?dias_posibles (preguntaIntegerUnbound "Cuantos días a la semana tienes disponibilidad para entrenar?" 3 7))
=======
    (bind ?valorsPermesosBinari (create$ "si" "no"))

    (bind ?e (preguntaInteger "Cuantos años tienes?" 1 100))
    (bind ?a (preguntaInteger "Cuanto mides (en cm)?" 50 250))
    (bind ?p (preguntaInteger "Cuanto pesas (en kg)?" 40 200))
    (bind ?disc_sup (preguntaBinaria "Tienes alguna discapacidad del tren superior?" ?valorsPermesosBinari))
    (bind ?disc_inf (preguntaBinaria "Tienes alguna discapacidad del tren inferior?" ?valorsPermesosBinari))
    (bind ?caid (preguntaBinaria "Has tenido alguna caída en los últimos 6 meses?" ?valorsPermesosBinari))
    (bind ?dias_deporte (preguntaInteger "Cuantos días a la semana sueles practicar deporte?" 0 7))
    (bind ?agotamiento (preguntaBinaria "Al subir escaleras sientes agotamiento?" ?valorsPermesosBinari))
    (bind ?dias_posibles (preguntaBinaria "Cuantos días a la semana tienes disponibilidad para entrenar?" 3 7))
>>>>>>> e612c7de4df3f8ba3bab6121480a66b0cb99d54c


    (assert (Persona
        (altura ?altura)
        (discapacidad_tren_inferior ?disc_inf)
        (discapacidad_tren_superior ?disc_sup)
        (edad ?edad)
        (expuesto_a_caídas ?caid)
        (agotamiento ?agotamiento)
        (peso ?peso)
        (dias_deporte ?dias_deporte)
        (dias_posibles ?dias_posibles)
      )
    )
<<<<<<< HEAD

=======
>>>>>>> e612c7de4df3f8ba3bab6121480a66b0cb99d54c
    assert(cercar)
)


(defrule buscarPossibles
    ;en el nostre cas haurà de ser de persona
  ?carSolicitant <- (Persona
        (altura ?altura)
        (discapacidad_tren_inferior ?disc_inf)
        (discapacidad_tren_superior ?disc_sup)
        (edad ?edad)
        (expuesto_a_caídas ?caid)
        (agotamiento ?agotamiento)
        (peso ?peso)
        (dias_deporte ?dias_deporte)
        (dias_posibles ?dias_posibles)
      )
  ?trigger <- (cercar)
  =>
  (printout t crlf)
  (printout t "...Buscant vivendes..." crlf)
  (printout t crlf)

    ;crear una estructura on emmagatzemar els exercicis amb la seva puntuacio
  (bind ?llistaIdeal (create$))

<<<<<<< HEAD
    ;llamar a la función evaluadora de estado fisico

   ;loop sobre tots els exercicis, descartant en cas que no compleixin amb les condicions mínimes, i puntuant en cas contrari
  (bind $?vivendes (find-all-instances ((?ins Vivenda)) TRUE))
  (loop-for-count (?i 1 (length$ $?vivendes))
    do
    (bind ?curr-obj (nth$ ?i ?vivendes))
=======
    ;Funciones de abstraccion

(deftemplate abstraccion::atributos
(slot edat (type STRING)  (default ""))
(slot IMC (type STRING) (default ""))
(slot enfermetats (type STRING) (default ""))
(slot forma_fisica (type STRING) (default ""))
)

(defrule abstraccion::abstraccion-edad "Establece el tamanyo del grupo"
	(not (atributos))
	=>
  (if (< ?e 70) then (bind ?edat "Adult"))
  (if (and (>= ?e 70) (< ?e 85) then (bind ?edat "Gran")))
  (if (>= ?e 85) then (bind ?edat "Molt Gran"))
	(assert (atributos (edat ?edat)))
)

(defrule abstraccion::abstraccion-imc "Establece el tamanyo del grupo"
	?atr <- (atributos (IMC ?IMC))
  (test (= (str-compare ?IMC "") 0) )
	=>
	(bind ?imc (/ ?a ?p))
  (if (< ?imc 18.5) then (bind ?IMC "delgadez"))
  (if (and(>= ?imc 18.5) (< ?imc 25)) then (bind ?IMC "normal"))
  (if (and(>= ?imc 25) (< ?imc 30)) then (bind ?IMC "sobrepeso"))
  (if (>= ?imc 30) then (bind ?IMC "obesidad"))
	(modify ?atr ((IMC ?IMC))
)

(defrule abstraccion::abstraccion-enfermedades "Establece el tamanyo del grupo"
	?atr <- (atributos (enfermetats ?enfermetats))
  (test (= (str-compare ?enfermetats "") 0) )
	=>
	(if (member$ "fragilitat" $?e) then (bind ?enfermetats "Greu"))
  (if (or(member$ "pulmonar" $?e) (member$ "cardiovascular" $?e) then (bind ?enfermetats "lleu"))
	(if (and(member$ "pulmonar" $?e) (member$ "cardiovascular" $?e) then (bind ?enfermetats "Moderada"))
  (modify ?atr ((enfermetats ?enfermetats))
)

(defrule abstraccion::abstraccion-forma_fisica "Establece el tamanyo del grupo"
	?atr <- (atributos (forma_fisica ?forma_fisica))
  (test (= (str-compare ?forma_fisica "") 0) )
	=>
  (if (and(>= ?dias_deporte  2) (or( (eq ?agotamiento  TRUE) (eq ?caid  TRUE)))  
  then (bind ?forma_fisica "normal"))
  (if (or (>= ?dias_deporte  5) (and (>= ?dias_deporte  2) (and (eq ?agotamiento  FALSE) (eq ?caid  FALSE) )))
  then (bind ?forma_fisica "bona"))
  (if (or ((and (eq ?agotamiento  TRUE) (eq ?caid  TRUE))) (< ?dias_deporte  2)) 
  then (bind ?forma_fisica "dolenta"))
	(modify ?atr ((forma_fisica ?forma_fisica))
)

(defrule abstraccion::clasificaion_estado "Pasa a la recopilacion de preferencias"
    (declare (salience 10))	
	  ?atr <- (atributos (IMC ~"IMC")(edat ?edat) (enfermetats ?enfermetats) (forma_fisica ?forma_fisica) )
    (test (not(= (str-compare ?IMC "") 0)))
    (test (not(= (str-compare ?edat "") 0)))
    (test (not(= (str-compare ?enfermetats "") 0)))
    (test (not(= (str-compare ?forma_fisica "") 0)))
	=>
	(focus puntuacion_ejercicios)
)

  ;loop sobre tots els exercicis, descartant en cas que no compleixin amb les condicions mínimes, i puntuant en cas contrari
  ;para descartar solo hay que cambiar el TRUE del find-all por una condicion sobre la intensidad del ejercicio
  
  (defclass Valoracion 
	(is-a USER)
	(role concrete)
    (slot nombre_ejercicio
		(type INSTANCE)
		(create-accessor read-write))
    (slot puntuacion
        (type FLOAT)
        (create-accessor read-write))
)
  
  (bind $?ejercicios_posibles (find-all-instances ((?ins Vivenda)) TRUE))

  (progn$ (?ejer_act ?ejercicios_posibles)
		(make-instance (sym-cat ejercicio- (gensym)) of Valoracion (nombre_ejercicio ?ejer_act)(puntuacion 0.0))
	)	

  (loop-for-count (?i 1 (length$ $?vivendes))
    do
    (bind ?curr-obj (nth$ ?i ?vivendes))
  
>>>>>>> e612c7de4df3f8ba3bab6121480a66b0cb99d54c
    ;comprobar si és acceptable
      (bind ?acceptable (comprovarVivenda ?curr-obj ?habflex
						    ?pPreuMaxFlex
						    ?pPreuMinFlex
						    ?pSupMaxFlex
						    ?pSupMinFlex
						    ?pGaratge
						    ?pBalco
						    ?pMascota
						    ?llistaPositivaForta
						    ?llistaNegativaForta))
      (if ?acceptable
      ;posar la puntuacio
        then
          (bind ?resultat (puntuarVivenda ?curr-obj ?edat
					 	    ?fills
						    ?personesGrans
						    ?pnumhab
						    ?pPreuMax
						    ?pPreuMin
						    ?pSupMax
						    ?pSupMin
						    ?pGaratge
						    ?pBalco
						    ?pMascota
						    ?llistaPositivaDebil
						    ?llistaNegativaDebil))
      )
<<<<<<< HEAD
      ;organizar en sesiones los ejercicios

      ;imprimir por pantalla
=======
      ;organizar en sesiones los ejercicios, otro modulo

      ;imprimir por pantalla, otro modulo
>>>>>>> e612c7de4df3f8ba3bab6121480a66b0cb99d54c
))
