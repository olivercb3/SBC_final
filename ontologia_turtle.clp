;;; ---------------------------------------------------------
;;; ontologia_turtle.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontologia_turtle.owl
;;; :Date 08/12/2022 16:31:31

(defclass Ejercicio
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot dificultat_ejercicio
        (type INTEGER)
        (create-accessor read-write))
    (slot nombre_ejercicio
        (type STRING)
        (create-accessor read-write))
    (multislot parte_ejercitada
        (type STRING)
        (create-accessor read-write))
)

(defclass Aerobico
    (is-a Ejercicio)
    (role concrete)
    (pattern-match reactive)
    (multislot es_un
        (type INSTANCE)
        (create-accessor read-write))
    (slot minutos
        (type INTEGER)
        (create-accessor read-write))
    (slot tipo_deporte
        (type STRING)
        (create-accessor read-write))
)

(defclass Anaerobico
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
    (slot tipo_anaerobico
        (type STRING)
        (create-accessor read-write))
)

(defclass Enfermedad
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot tipo_enfermedad
        (type STRING)
        (create-accessor read-write))
)

(defclass Persona
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot sufre
        (type INSTANCE)
        (create-accessor read-write))
    (slot altura
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
    (slot nivel_de_forma
        (type INTEGER)
        (create-accessor read-write))
    (slot peso
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Plan_Ejercicios "Plan de ejercicios diseñado para una persona concreta en un momento dado."
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot diseñado_para
        (type INSTANCE)
        (create-accessor read-write))
    (multislot formado_por
        (type INSTANCE)
        (create-accessor read-write))
    (slot dias
        (type INTEGER)
        (create-accessor read-write))
    (slot dificultat
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Sesion
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
)
