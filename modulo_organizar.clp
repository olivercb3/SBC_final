(defmodule organizar
	(import MAIN ?ALL)
	(export ?ALL)
)

(deffunction dias_semanales(?persona ?plan_ejercicios)
	
)

 
(bind ?c (send ?vivenda get-te_car_vivenda))

    ;;preu
    (bind ?preu (send ?c get-preu))
    (bind ?res (acceptableInteger ?preu ?pPreuMax ?pPreuMin))
    (if (not ?res)
	then (return FALSE)
    )


;; para conseguir el nivel de forma para saber cuantos dias y la duracion de las sesiones, esta en
;; un deftemplate en el MAIN 