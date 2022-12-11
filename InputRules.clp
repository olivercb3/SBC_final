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
  (declare (salience 10))
	=>
	(reset)
	(printout t crlf)
	(printout t "----------- Prototip Inicial ------------" crlf)
	(focus preguntas)
)

;organizar en sesiones los ejercicios, otro module
;imprimir por pantalla, otro modulo

