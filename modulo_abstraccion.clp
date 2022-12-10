(defmodule abstraccion
	(import MAIN ?ALL)
	(import preguntas deftemplate ?ALL)
	(export ?ALL)
)

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
	(modify ?atr (IMC ?IMC)
)

(defrule abstraccion::abstraccion-enfermedades "Establece el tamanyo del grupo"
	?atr <- (atributos (enfermetats ?enfermetats))
    (test (= (str-compare ?enfermetats "") 0) )
	=>
	(if (member$ "fragilitat" $?e) then (bind ?enfermetats "Greu"))
    (if (or(member$ "pulmonar" $?e) (member$ "cardiovascular" $?e) then (bind ?enfermetats "lleu"))
	(if (and(member$ "pulmonar" $?e) (member$ "cardiovascular" $?e) then (bind ?enfermetats "Moderada"))
    (modify ?atr (enfermetats ?enfermetats)
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
	(modify ?atr (forma_fisica ?forma_fisica)
)

(defrule abstraccion::clasificaion_estado "Pasa a la recopilacion de preferencias"
    (declare (salience 10))	
	?atr <- (atributos (IMC ~"IMC")(edat ?edat) (enfermetats ?enfermetats) (forma_fisica ?forma_fisica) )
    (test (not(= (str-compare ?IMC "") 0)))
    (test (not(= (str-compare ?edat "") 0)))
    (test (not(= (str-compare ?enfermetats "") 0)))
    (test (not(= (str-compare ?forma_fisica "") 0)))
    (not (lista_ejercicios))
    ?persona <- (object (is-a Persona) (nivel_de_forma ?forma))
	=>
    
    (send ?persona put-nivel_de_forma ?forma)
    (assert (lista_ejercicios))
)

(defrule abstraccion::asignar_ejercicios "Se crea una lista de recomendaciones para ordenarlas"
	?lista_ejercicios <- (lista_ejercicios (puntuaciones $?lista))
	=>
    (bind $?ejercicios_posibles (find-all-instances (?ins Ejercicio)))

    (progn$ (?ejer_act $?ejercicios_posibles)
		(make-instance (sym-cat ejercicio- (gensym)) of Valoracion (nombre_ejercicio ?ejer_act)(puntuacion 0.0))
	)
    (bind $?lista_sin_ord (find-all-instances ((?ins Valoracion)) TRUE))
    (bind $?lista_ordenada (ordena_lista $?lista_sin_ord))
	(modify ?lista_ejercicios (puntuaciones $?lista_ordenada))
)

  ;loop sobre tots els exercicis, descartant en cas que no compleixin amb les condicions mínimes, i puntuant en cas contrari
  ;para descartar solo hay que cambiar el TRUE del find-all por una condicion sobre la intensidad del ejercicio
  
  
  
  