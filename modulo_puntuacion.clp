(defmodule puntuacion
	(import MAIN ?ALL)
	(export ?ALL)
)

(deftemplate restricciones
	(slot cardiovascular (type INTEGER))
	(slot cancer (type INTEGER))
	(slot osteoporosis (type INTEGER))
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
(defrule puntuacion::ordena_puntuaciones "Se crea una lista de recomendaciones para ordenarlas"
	?lista_ejercicios <- (lista_ejercicios (puntuaciones $?lista))
    ?persona <- (object (is-a Persona) (discapacidad_tren_inferior ?di)
                (discapacidad_tren_superior ?ds) (material ?m) )
    (declare (salience -1))
	=>

    (bind $?lista_ordenada (ordena_lista $?lista_sin_ord))

	(modify ?lista_ejercicios (puntuaciones $?lista_ordenada))
    (focus organizar)
)
