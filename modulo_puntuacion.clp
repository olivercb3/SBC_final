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
