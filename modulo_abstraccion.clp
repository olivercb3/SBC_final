;Funciones de abstraccion

(deffunction abstraccion::enfermedad_en_lista (?nombre $?enfermedades)

	(bind ?encontrado FALSE)
	
	(if (> (length$ $?enfermedades) 0) then
		(loop-for-count (?i 1 (length$ $?enfermedades)) do
			(bind ?enfermedad_act (nth$ ?i $?enfermedades))
			(if (eq (str-compare (send ?enfermedad_act get-nombre) ?nombre) 0) then
				(bind ?encontrado TRUE)
			)
		)
	)
	(return ?encontrado)
)


(deffunction abstraccion::eliminar_incomp (?material ?dis_inf ?dis_sup $?lista)
	
	(switch ?material
		(case TRUE then 
			(switch ?dis_sup
				(case TRUE then 
					(switch ?dis_inf
						(case TRUE then 
							(progn$ (?ejer_act $?lista)

								(bind ?mat (send ?ejer_act get-material))
								(bind ?parte_ejercitada (send ?ejer_act get-parte_ejercitada))
								;tiene material y las dos discapacidades
								(if (or  (= (str-compare "Pierna" ?parte_ejercitada) 0) 
										 (= (str-compare "Brazo" ?parte_ejercitada) 0) )
									then 
									(bind $?lista (delete-member$ $?lista ?ejer_act) )
								)
							)
						)
						(case FALSE then 
							(progn$ (?ejer_act $?lista)

								(bind ?mat (send ?ejer_act get-material))
								(bind ?parte_ejercitada (send ?ejer_act get-parte_ejercitada))
								;tiene material y discapacidad superior
								(if (= (str-compare "Brazo" ?parte_ejercitada) 0) 
									then 
									(bind $?lista (delete-member$ $?lista ?ejer_act) )
								)
							)
						)
					)
				)
				(case FALSE then 
					(switch ?dis_inf
						(case TRUE then 
							(progn$ (?ejer_act $?lista)

								(bind ?mat (send ?ejer_act get-material))
								(bind ?parte_ejercitada (send ?ejer_act get-parte_ejercitada))
								;tiene material y discapacidad inferior
								(if (= (str-compare "Pierna" ?parte_ejercitada) 0)
									then 
									(bind $?lista (delete-member$ $?lista ?ejer_act) )
								)
							)
						)
					)
				)
			)
		)
		(case FALSE then 
			(switch ?dis_sup
				(case TRUE then 
					(switch ?dis_inf
						(case TRUE then 
							(progn$ (?ejer_act $?lista)

								(bind ?mat (send ?ejer_act get-material))
								(bind ?parte_ejercitada (send ?ejer_act get-parte_ejercitada))
								;NO tiene material y las dos discapacidades
								(if (or ?mat  (or (= (str-compare "Pierna" ?parte_ejercitada) 0) 
										(= (str-compare "Brazo" ?parte_ejercitada) 0) )
									) 
									then 
									(bind $?lista (delete-member$ $?lista ?ejer_act) ) 
								)
							)
						)
						(case FALSE then 
							(progn$ (?ejer_act $?lista)

								(bind ?mat (send ?ejer_act get-material))
								(bind ?parte_ejercitada (send ?ejer_act get-parte_ejercitada))
								;NO tiene material y discapacidad superior
								(if (or ?mat	(= (str-compare "Brazo" ?parte_ejercitada) 0) )
									then 
									(bind $?lista (delete-member$ $?lista ?ejer_act) )
								)
							)
						)
					)
				)
				(case FALSE then 
					(switch ?dis_inf
						(case TRUE then 
							(progn$ (?ejer_act $?lista)

								(bind ?mat (send ?ejer_act get-material))
								(bind ?parte_ejercitada (send ?ejer_act get-parte_ejercitada))
								;NO tiene material ni discapacidad inferior
								(if (or (not ?mat) 
									(= (str-compare "Pierna" ?parte_ejercitada) 0) )
									then 
									(bind $?lista (delete-member$ $?lista ?ejer_act) )
								)
							)
						)
						(case FALSE then 
							(progn$ (?ejer_act $?lista)

								(bind ?mat (send ?ejer_act get-material))
								(bind ?parte_ejercitada (send ?ejer_act get-parte_ejercitada))
								;NO tiene material
								(if (not ?mat) 
									then 
									(bind $?lista (delete-member$ $?lista ?ejer_act) )
								)
							)
						)
					)
				)
			)
		)
	)
	(return $?lista)
)

;Reglas de abstraccion

(deftemplate abstraccion::atributos
    (slot edat (type INTEGER)  (default -1) (range -1 2))
    (slot IMC (type INTEGER) (default -1) (range -1 2))
    (slot enfermetats (type INTEGER) (default -1) (range -1 2))
    (slot forma_fisica (type INTEGER) (default -1) (range -1 2))
)

(defrule abstraccion::abstraccion-edad "Abstraccion de la edad"
	(not (atributos))
    ?persona <- (object (is-a Persona) (edad ?e))
	=>

	(printout t crlf)
	(printout t "----------- Pasando a abstraccion ------------" crlf)

    (if (< ?e 70) then (bind ?edat 0))                              ;adult
    (if (and (>= ?e 70) (< ?e 85)) then (bind ?edat 1))	           	;gran
    (if (>= ?e 85) then (bind ?edat 2))                             ;molt gran
	(assert (atributos (edat ?edat)))
)

(defrule abstraccion::abstraccion-imc "Abstraccion del indice de masa corporal"
	?atr <- (atributos (IMC ?IMC))
    (test (< ?IMC  0) )
    ?persona <- (object (is-a Persona) (altura ?a) (peso ?p))
	=>
	
	(bind ?imc (/ ?a ?p))
    (if (and(>= ?imc 18.5) (< ?imc 25)) then (bind ?IMC 0))     				;normal
    (if (or (< ?imc 18.5) (and(>= ?imc 25) (< ?imc 30))) then (bind ?IMC 1))    ;sobrepeso o delgadez
    (if (>= ?imc 30) then (bind ?IMC 2))                        				;obesidad
	(modify ?atr (IMC ?IMC) )
)

(defrule abstraccion::abstraccion-enfermedades "Abstraccion de las enfermedades que afectan a la hora de realizar ejercicio"
	?atr <- (atributos (enfermetats ?enfermetats))
    (test (< ?enfermetats  0) )
    ?persona <- (object (is-a Persona) (sufre $?e))
	=>
 
    (bind ?enfermetats 0)                                                           	;lleu    

	(if (or	(or (enfermedad_en_lista "Pulmonar" $?e) 
			 	(enfermedad_en_lista "Cardiovascular" $?e) )
			(enfermedad_en_lista "Fibrosis_quistica" $?e) )	
	then (bind ?enfermetats 1))        													;Moderada

    (if (or	(or	(or	(enfermedad_en_lista "Artritis_reumatoide" $?e)
					(enfermedad_en_lista "Osteoporosis" $?e) )
				(and(enfermedad_en_lista "Pulmonar" $?e)
					(enfermedad_en_lista "Cardiovascular" $?e) ) )
			(or	(and(enfermedad_en_lista "Pulmonar" $?e)
					(enfermedad_en_lista "Fibrosis_quistica" $?e) )
				(and(enfermedad_en_lista "Fibrosis_quistica" $?e)
					(enfermedad_en_lista "Cardiovascular" $?e) ) ) )	 
	then (bind ?enfermetats 2))   														;Greu, o alduna de las dos peores o una combinacion de dos moderadas

	(modify ?atr (enfermetats ?enfermetats) )
)

(defrule abstraccion::abstraccion-forma_fisica "Abstraccion de la forma fisica a nivel de movilidad de la persona"
	?atr <- (atributos (forma_fisica ?forma_fisica))
	?persona <- (object (is-a Persona) (agotamiento ?agotamiento) (dias_deporte ?dias_deporte)
				(expuesto_a_caídas ?caid))
    (test (< ?forma_fisica  0) )
	=>

    (if (and (>= ?dias_deporte  2) (or (eq ?agotamiento  TRUE) (eq ?caid  TRUE)) )  
        then (bind ?forma_fisica 1))                                              		;normal
    (if (or (>= ?dias_deporte  5) (and (>= ?dias_deporte  2) (and (eq ?agotamiento  FALSE) (eq ?caid  FALSE) )))
        then (bind ?forma_fisica 0))                                                   	;bona
    (if (or (and (eq ?agotamiento  TRUE) (eq ?caid  TRUE))  (< ?dias_deporte  2)) 
        then (bind ?forma_fisica 2))                                                   	;dolenta
	(modify ?atr (forma_fisica ?forma_fisica) )
)

(defrule abstraccion::clasificaion_estado "Clasifica el estado general de la persona segun los 4 param anteriores"
    (declare (salience 10))	
	?atr <- (atributos (IMC ?IMC)(edat ?edat) (enfermetats ?enfermetats) (forma_fisica ?forma_fisica) )
    (test (not(< ?edat  0) ))
    (test (not(< ?IMC  0) ))
    (test (not(< ?enfermetats  0) ))
    (test (not(< ?forma_fisica  0) ))
    (not (lista_ejercicios))
    (not (nivel_de_forma))
	=>

	;todos son 0
    (if (and  (and (= ?IMC 0) (= ?edat 0)) (and (= ?enfermetats 0) (= ?forma_fisica 0)) )
        then (bind ?forma 5)
    )
	;uno es 1, los otros son 0
	(if (or  (or (= ?IMC 1) (= ?edat 1)) (or (= ?enfermetats 1) (= ?forma_fisica 1)) )
        then (bind ?forma 4)
    )
	;dos son 1, los otros son 0
	(if	(or	(or	(or  (and (= ?IMC 1) (= ?edat 1)) (and (= ?enfermetats 1) (= ?forma_fisica 1)))
		 		(or  (and (= ?IMC 1) (= ?forma_fisica 1)) (and (= ?enfermetats 1) (= ?edat 1))))
			(or  (and (= ?IMC 1) (= ?enfermetats 1)) (and (= ?edat 1) (= ?forma_fisica 1)))
		)
        then (bind ?forma 3)
    )
	;tres son 1, los otros son 0
	(if	(or	(or	(or	(and  (and (= ?IMC 1) (= ?edat 1)) (or (= ?enfermetats 1) (= ?forma_fisica 1)))
					(and  (and (= ?IMC 1) (= ?forma_fisica 1)) (or (= ?enfermetats 1) (= ?edat 1))))
				(or (and  (and (= ?IMC 1) (= ?enfermetats 1)) (or (= ?edat 1) (= ?forma_fisica 1)))
					(and  (and (= ?edat 1) (= ?forma_fisica 1)) (or (= ?enfermetats 1) (= ?IMC 1))))
			)
				(or (and  (and (= ?forma_fisica 1) (= ?enfermetats 1)) (or (= ?edat 1) (= ?IMC 1)))
					(and  (and (= ?edat 1) (= ?enfermetats 1)) (or (= ?IMC 1) (= ?forma_fisica 1))))

		)
        then (bind ?forma 2)
    )
	;alguno es 2, es una persona de edad avanzada por lo que un atributo elevado ya es determinante
	(if  (or  (or (= ?IMC 2) (= ?edat 2)) (or (= ?enfermetats 2) (= ?forma_fisica 2)))
        then (bind ?forma 1)
    )
    (assert (nivel_de_forma (forma ?forma) ))
    (assert (lista_ejercicios))
)

(defrule abstraccion::asignar_ejercicios "Se crea una lista de recomendaciones con los ejercicios posibles para el nivel de la persona"
	?lista_ejercicios <- (lista_ejercicios (puntuaciones $?lista))
    ?persona <- (object (is-a Persona) (discapacidad_tren_inferior ?di)
                (discapacidad_tren_superior ?ds) (material ?m) )
	(nivel_de_forma (forma ?forma) )
	=>

    (bind $?ejercicios_aerobicos (find-all-instances ((?ins Aerobico)) (<= ?ins:dificultat_ejercicio (* ?forma 2) ) ) )
	(bind $?ejercicios_anaerobicos (find-all-instances ((?ins Anaerobico)) (<= ?ins:dificultat_ejercicio
    (* ?forma 2) ) ))
	(bind $?ejercicios_posibles 
		(progn$ (?var $?ejercicios_anaerobicos) (bind $?lista (insert$ $?lista (+ (length$ $?lista) 1) ?var) ) ) 
    )

    (bind $?ejercicios_posibles (eliminar_incomp ?m ?di ?ds $?ejercicios_posibles))

    (progn$ (?ejer_act $?ejercicios_posibles)
		(make-instance (sym-cat ejercicio- (gensym)) of Valoracion (nombre_ejercicio ?ejer_act)(puntuacion 0.0))
	)

	(modify ?lista_ejercicios (puntuaciones (find-all-instances ((?ins Valoracion)) TRUE)) )
    (printout t "nivel de forma: " ?forma crlf)
	;(focus puntuacion)
)
  
  
  
  