(defmodule abstraccion
	(import MAIN ?ALL)
	(import preguntas deftemplate ?ALL)
	(export ?ALL)
)

(deftemplate abstraccion::nivel_de_forma
	(slot forma (type INTEGER))
)

;Funciones de abstraccion

(deffunction eliminar_incomp ($?lista ?material ?dis_inf ?dis_sup)
	(switch ?material
 	(case TRUE then 
		(switch ?dis_inf
 			(case TRUE then 
				(switch ?dis_inf
 					(case TRUE then 
					()
					)
 					(case FALSE then 
					()
	 				)
				)
			)
 			(case FALSE then 
				(switch ?dis_inf
 					(case TRUE then 
					()
					)
 					(case FALSE then 
					()
	 				)
				)
	 		)
		)
	)
 	(case FALSE then 
		(switch ?dis_inf
 			(case TRUE then 
				(switch ?dis_inf
 					(case TRUE then 
					()
					)
 					(case FALSE then 
					()
	 				)
				)
			)
 			(case FALSE then 
				(switch ?dis_inf
 					(case TRUE then 
					()
					)
 					(case FALSE then 
					()
	 				)
				)
	 		)
		)
 	)
	)
	(return ?elemento)
)

;Reglas de abstraccion

(deftemplate abstraccion::atributos
    (slot edat (type INTEGER)  (default -1) (range -1 2))
    (slot IMC (type INTEGER) (default -1) (range -1 3))
    (slot enfermetats (type INTEGER) (default -1) (range -1 2))
    (slot forma_fisica (type INTEGER) (default -1) (range -1 2))
)

(defrule abstraccion::abstraccion-edad "Establece el tamanyo del grupo"
	(not (atributos))
    ?persona <- (object (is-a Persona) (edad ?e))
	=>

    (if (< ?e 70) then (bind ?edat 0))                              ;adult
    (if (and (>= ?e 70) (< ?e 85) then (bind ?edat 1)))             ;gran
    (if (>= ?e 85) then (bind ?edat 2))                             ;molt gran
	(assert (atributos (edat ?edat)))
)

(defrule abstraccion::abstraccion-imc "Establece el tamanyo del grupo"
	?atr <- (atributos (IMC ?IMC))
    (test (< ?IMC  0) )
    ?persona <- (object (is-a Persona) (altura ?a) (peso ?p))
	=>

	(bind ?imc (/ ?a ?p))
    (if (< ?imc 18.5) then (bind ?IMC 0))                       ;delgadez
    (if (and(>= ?imc 18.5) (< ?imc 25)) then (bind ?IMC 1))     ;normal
    (if (and(>= ?imc 25) (< ?imc 30)) then (bind ?IMC 2))       ;sobrepeso
    (if (>= ?imc 30) then (bind ?IMC 3))                        ;obesidad
	(modify ?atr (IMC ?IMC)
)

(defrule abstraccion::abstraccion-enfermedades "Establece el tamanyo del grupo"
	?atr <- (atributos (enfermetats ?enfermetats))
    (test (< ?enfermetats  0) )
    ?persona <- (object (is-a Persona) (sufre ?e))
	=>

    (bind ?enfermetats 0)                                                                              ;lleu
	(if (member$ "fragilitat" $?e) then (bind ?enfermetats 2))                                         ;Greu
    (if (or(member$ "pulmonar" $?e) (member$ "cardiovascular" $?e) then (bind ?enfermetats 0))         ;lleu
	(if (and(member$ "pulmonar" $?e) (member$ "cardiovascular" $?e) then (bind ?enfermetats 1))        ;Moderada
    (modify ?atr (enfermetats ?enfermetats)
)

(defrule abstraccion::abstraccion-forma_fisica "Establece el tamanyo del grupo"
	?atr <- (atributos (forma_fisica ?forma_fisica))
    (test (< ?forma_fisica  0) )
	=>

    (if (and(>= ?dias_deporte  2) (or( (eq ?agotamiento  TRUE) (eq ?caid  TRUE)))  
        then (bind ?forma_fisica 1))                                                                 ;normal
    (if (or (>= ?dias_deporte  5) (and (>= ?dias_deporte  2) (and (eq ?agotamiento  FALSE) (eq ?caid  FALSE) )))
        then (bind ?forma_fisica 0))                                                                   ;bona
    (if (or ((and (eq ?agotamiento  TRUE) (eq ?caid  TRUE))) (< ?dias_deporte  2)) 
        then (bind ?forma_fisica 2))                                                                ;dolenta
	(modify ?atr (forma_fisica ?forma_fisica)
)

(defrule abstraccion::clasificaion_estado "Pasa a la recopilacion de preferencias"
    (declare (salience 10))	
	?atr <- (atributos (IMC ~"IMC")(edat ?edat) (enfermetats ?enfermetats) (forma_fisica ?forma_fisica) )
    (test (not(< ?edat  0) ))
    (test (not(< ?IMC  0) ))
    (test (not(< ?enfermetats  0) ))
    (test (not(< ?forma_fisica  0) ))
    (not (lista_ejercicios))
    (not (nivel_de_forma))
	=>
    if(  (and  (and (= ?IMC 0) (= ?edat 0)) (and (= ?IMC 0) (= ?edat 0)))
        then (bind ?forma 10)
    )
    (assert (nivel_de_forma (forma ?forma) ))
    (assert (lista_ejercicios))
)

(defrule abstraccion::asignar_ejercicios "Se crea una lista de recomendaciones para ordenarlas"
	?lista_ejercicios <- (lista_ejercicios (puntuaciones $?lista))
    ?persona <- (object (is-a Persona) (discapacidad_tren_inferior ?di)
                (discapacidad_tren_superior ?ds) (material ?m) )
	(nivel_de_forma (forma ?forma) )
	=>

    (bind $?ejercicios_aerobicos (find-all-instances (?ins Aerobico) (<= ?inst:dificultat_ejercicio
    (* ?forma 2))))
	(bind $?ejercicios_anaerobicos (find-all-instances (?ins Aerobico) (<= ?inst:dificultat_ejercicio
    (* ?forma 2))))
	(bind $?ejercicios_posibles 
		(progn$ (?var ?ejercicios_anaerobicos) (insert$ ?lista (+ (length$ ?lista) 1) ?var)) 
    )

    (bind $?ejercicios_posibles (eliminar_incomp $?ejercicios_posibles ?m ?di ?ds))

    (progn$ (?ejer_act $?ejercicios_posibles)
		(make-instance (sym-cat ejercicio- (gensym)) of Valoracion (nombre_ejercicio ?ejer_act)(puntuacion 0.0))
	)

    (bind $?lista_ordenada (ordena_lista $?lista_sin_ord))

	(modify ?lista_ejercicios (puntuaciones $?lista_ordenada))
    (focus puntuacion)
)
  
  
  
  