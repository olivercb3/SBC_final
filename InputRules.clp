
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
    (bind ?edad (preguntaInteger "Cuantos años tienes?" 1 100))
    (bind ?altura (preguntaInteger "Cuanto mides (en cm)?" 50 250))
    (bind ?pes (preguntaInteger "Cuanto pesas (en kg)?" 40 200))
    (bind ?disc_sup (preguntaIntegerUnbound "Tienes alguna discapacidad del tren superior?"))
    (bind ?disc_inf (preguntaIntegerUnbound "Tienes alguna discapacidad del tren inferior?"))
    (bind ?caid (preguntaIntegerUnbound "Has tenido alguna caída en los últimos 6 meses?"))
    (bind ?dias_deporte (preguntaInteger "Cuantos días a la semana sueles practicar deporte?" 3 7))
    (bind ?agotamiento (preguntaIntegerUnbound "Al subir escaleras sientes agotamiento?"))
    (bind ?dias_posibles (preguntaIntegerUnbound "Cuantos días a la semana tienes disponibilidad para entrenar?" 3 7))


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

    ;llamar a la función evaluadora de estado fisico

   ;loop sobre tots els exercicis, descartant en cas que no compleixin amb les condicions mínimes, i puntuant en cas contrari
  (bind $?vivendes (find-all-instances ((?ins Vivenda)) TRUE))
  (loop-for-count (?i 1 (length$ $?vivendes))
    do
    (bind ?curr-obj (nth$ ?i ?vivendes))
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
      ;organizar en sesiones los ejercicios

      ;imprimir por pantalla
))
