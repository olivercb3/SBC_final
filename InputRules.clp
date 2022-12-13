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
	(load "modulo_preguntas.clp")
    (load "modulo_abstraccion.clp")
    (load "modulo_puntuacion.clp")
    (load "modulo_organizar.clp")
    (load "modulo_imprimir.clp")
	(reset)
	(printout t crlf)
	(printout t "----------- Prototip Inicial ------------" crlf)
	(focus preguntas)
)

;organizar en sesiones los ejercicios, otro module
;imprimir por pantalla, otro modulo

