
;Tenir aquí el deftemplate de persona

(defrule main "Main"
  ;hauria de ser amb initial-fact pero no sabem com es fa
  ?trigger <- (initial-main)
	=>
	(reset)
	(printout t crlf)
	(printout t "----------- Prototip Inicial ------------" crlf)
	(assert (preguntar))
)

(defrule PreguntesSolicitant
    ?trigger <- (preguntar)
    =>
    (bind ?pEdat (preguntaIntegerUnbound "Quina edat tens?"))
)
