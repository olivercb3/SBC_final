;;; ---------------------------------------------------------
;;; turtle_ontology.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology turtle_ontology.owl
;;; :Date 11/12/2022 18:55:24

(defclass MAIN::Ejercicio
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot trabaja
        (type INSTANCE)
        (create-accessor read-write))
    (multislot material
        (type SYMBOL)
        (create-accessor read-write))
    (multislot nombre
        (type SYMBOL)
        (create-accessor read-write))
    (multislot parte_ejercitada
        (type STRING)
        (create-accessor read-write))
)

(defclass MAIN::Aerobico
    (is-a Ejercicio)
    (role concrete)
    (pattern-match reactive)
    (multislot es_un
        (type INSTANCE)
        (create-accessor read-write))
    (multislot exterior
        (type SYMBOL)
        (create-accessor read-write))
    (multislot impacto
        (type SYMBOL)
        (create-accessor read-write))
    (slot minutos
        (type INTEGER)
        (create-accessor read-write))
    (slot dificultat_ejercicio
        (type INTEGER)
        (create-accessor read-write))
)

(defclass MAIN::Anaerobico
    (is-a Ejercicio)
    (role concrete)
    (pattern-match reactive)
    (multislot es_un
        (type INSTANCE)
        (create-accessor read-write))
    (slot numero_repeticiones
        (type INTEGER)
        (create-accessor read-write))
    (slot numero_series
        (type INTEGER)
        (create-accessor read-write))
    (slot dificultat_ejercicio
        (type INTEGER)
        (create-accessor read-write))
)

(defclass MAIN::Enfermedad
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot se_recomienda
        (type INSTANCE)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass MAIN::Faceta_trabajada
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot nombre
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass MAIN::Persona
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot sufre
        (type INSTANCE)
        (create-accessor read-write))
    (multislot agotamiento
        (type SYMBOL)
        (create-accessor read-write))
    (slot altura
        (type INTEGER)
        (create-accessor read-write))
    (multislot dias_deporte
        (type INTEGER)
        (create-accessor read-write))
    (multislot discapacidad_tren_inferior
        (type SYMBOL)
        (create-accessor read-write))
    (multislot discapacidad_tren_superior
        (type SYMBOL)
        (create-accessor read-write))
    (slot edad
        (type INTEGER)
        (create-accessor read-write))
    (slot expuesto_a_caídas
        (type SYMBOL)
        (create-accessor read-write))
    (multislot material
        (type SYMBOL)
        (create-accessor read-write))
    (slot peso
        (type INTEGER)
        (create-accessor read-write))
)

(defclass MAIN::Plan_Ejercicios "Plan de ejercicios diseñado para una persona concreta en un momento dado."
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot diseñado_para
        (type INSTANCE)
        (create-accessor read-write))
    (multislot formado_por
        (type INSTANCE)
        (create-accessor read-write))
    (multislot numero_dias
        (type INTEGER)
        (create-accessor read-write))
)

(defclass MAIN::Sesion
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot formada_por
        (type INSTANCE)
        (create-accessor read-write))
    (multislot dia
        (type INTEGER)
        (create-accessor read-write))
)

(definstances instances

    ([Cardiovascular] of Enfermedad
            (nombre "Cardiovascular")
    )

    ([Hipertension] of Enfermedad
            (nombre "Hipertension")
        )
    
    ([Depresion] of Enfermedad
            (nombre "Depresion")
        )

    ([Pulmonar] of Enfermedad
            (nombre "Pulmonar")
        )
    
    ([Osteoporosis] of Enfermedad
            (nombre "Osteoporosis")
        )
    
    ([Cancer] of Enfermedad
            (nombre "Cancer")
        )
    
    ([Artritis_reumatoide] of Enfermedad
            (nombre "Artritis_reumatoide")
        )
    
    ([Fibrosis_quistica] of Enfermedad
            (nombre "Fibrosis_quistica")
        )

    ([Diabetes] of Enfermedad
            (nombre "Diabetes")
        )
)
