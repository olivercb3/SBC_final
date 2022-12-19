(defmodule MAIN (export ?ALL))

(defmodule preguntas
	(import MAIN ?ALL)
	(export ?ALL)
)

(defmodule abstraccion
	(import MAIN ?ALL)
	(import preguntas deftemplate ?ALL)
	(export ?ALL)
)

(defclass Valoracion 
	(is-a USER)
	(role concrete)
  (slot nombre_ejercicio  (type INSTANCE)  (create-accessor read-write))
  (slot puntuacion  (type FLOAT)  (create-accessor read-write))
)

(deftemplate MAIN::lista_ejercicios
	(multislot puntuaciones (type INSTANCE))
)

(deftemplate MAIN::nivel_de_forma
	(slot forma (type INTEGER))
)

(defrule main "Main"
  	(declare (salience 10))
	=>
	(load "C:/Users/Jordi/Desktop/UNI/IA/Practica SBC/SBC_final/turtle_ontology.clp")
	(load "C:/Users/Jordi/Desktop/UNI/IA/Practica SBC/SBC_final/modulo_preguntas.clp")
    (load "C:/Users/Jordi/Desktop/UNI/IA/Practica SBC/SBC_final/modulo_abstraccion.clp")
    ;(load "C:/Users/Jordi/Desktop/UNI/IA/Practica SBC/SBC_final/modulo_puntuacion.clp")
    ;(load "C:/Users/Jordi/Desktop/UNI/IA/Practica SBC/SBC_final/modulo_organizar.clp")
    ;(load "C:/Users/Jordi/Desktop/UNI/IA/Practica SBC/SBC_final/modulo_imprimir.clp")
	(reset)
	(printout t crlf)
	(printout t "----------- Recomendacion ejercicio ------------" crlf)
	(focus preguntas)
)

;organizar en sesiones los ejercicios, otro module
;imprimir por pantalla, otro modulo

