(defmodule puntuacion
	(import MAIN ?ALL)
	(export ?ALL)
)

(deftemplate restricciones
	(slot cardiovascular (type SYMBOL))
	(slot cancer (type SYMBOL))
	(slot osteoporosis (type SYMBOL))
)

(deffunction maximo-puntuacion ($?lista)
	(bind ?maximo -1)
	(bind ?elemento nil)
	(progn$ (?ejer_act $?lista)
		(bind ?punt (send ?ejer_act get-puntuacion))
		(if (> ?punt ?maximo)
			then 
			(bind ?maximo ?punt)
			(bind ?elemento ?ejer_act)
		)
	)
	(return ?elemento)
)

(deffunction ordena_lista ($?lista_sin_ord)
	(bind $?resultado (create$ ))
	(while (not (eq (length$ $?lista_sin_ord) 0))  do
		(bind ?ejer_act (maximo-puntuacion $?lista))
		(bind $?lista (delete-member$ $?lista ?curr-rec))
		(bind $?resultado (insert$ $?resultado (+ (length$ $?resultado) 1) ?curr-rec))
	)
	(return $?resultado)
)

;se ejecutara al final por el salience pequeño, por lo que primero se ejecutaran tdoas las reglas de puntuacion
;hasta que ya no halla más posibles
(defrule puntuacion::seleccion-restricciones "Se crea una lista de recomendaciones para ordenarlas"
	?lista_ejercicios <- (lista_ejercicios (puntuaciones $?lista))
	?persona <- (object (is-a Persona) (sufre $?enfermedad) )
    (declare (salience 10))
	(not (restricciones))
	=>

	(bind ?cardiovascular FALSE)

    (progn$ (?enf-act $?enfermedad) 
		(	(if(enf-act = cardiovascular) then (bind ?cardiovascular TRUE))
			;etc...
		) 
	)

	assert (restricciones (cardiovascular ?cardiovascular) )	
)

;;ejemplo de regla para una restriccion, falta rellenarlo
(defrule puntuacion::restriccion-cardiovascular "Se crea una lista de recomendaciones para ordenarlas"
	?val <-(object (is-a Valoracion) (nombre_ejercicio ?ejercicio) (puntuacion ?p))
	;;?lista_ejercicios <- (lista_ejercicios (puntuaciones $?lista))
	;;(member$ ?ejer ($?lista)) ;;ns si aqui hace falta poner (test )
	;;(test (eq (instance-name ?ejercicio) (instance-name ?ejer)))
	rest <- (restricciones (cardiovascular ?cardiovascular))
	(test (eq ?cardiovascular TRUE))
	(not (restriccion-cardiovascular ?ejercicio) )
	=>

	(	(if (eq (send ?ejer get-impacto) FALSE) then (bind ?p (- ?p 1.0))
			;etc...
	) 

	(send ?val put-puntuacion ?p)
	(assert (restriccion-cardiovascular ?ejercicio) )
)


;se ejecutara al final por el salience pequeño, por lo que primero se ejecutaran tdoas las reglas de puntuacion
;hasta que ya no halla más posibles
(defrule puntuacion::ordena_puntuaciones "Se crea una lista de recomendaciones para ordenarlas"
    ?persona <- (object (is-a Persona) (discapacidad_tren_inferior ?di)
                (discapacidad_tren_superior ?ds) (material ?m) )
    (declare (salience -1))
	=>

	(bind $?lista_sin_ord (find-all-instances (?ins Valoracion) TRUE))
    (bind $?lista_ordenada (ordena_lista $?lista_sin_ord))

	(modify ?lista_ejercicios (puntuaciones $?lista_ordenada))
    (focus organizar)
)
