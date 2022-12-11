
(defclass Valoracion 
	(is-a USER)
	(role concrete)
  (slot nombre_ejercicio  (type INSTANCE)  (create-accessor read-write))
  (slot puntuacion  (type FLOAT)  (create-accessor read-write))
)

(deftemplate MAIN::lista_ejercicios
	(multislot puntuaciones (type INSTANCE))
)

(defrule main "Main"
  ;hauria de ser amb initial-fact pero no sabem com es fa
  ?trigger <- (initial-main)
	=>
	(reset)
	(printout t crlf)
	(printout t "----------- Prototip Inicial ------------" crlf)
	(focus preguntas)
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
        (nivel_de_forma "")
        (peso ?peso)
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
      ;organizar en sesiones los ejercicios, otro modulo

      ;imprimir por pantalla, otro modulo
))
