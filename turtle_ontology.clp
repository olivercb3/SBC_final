;;; ---------------------------------------------------------
;;; turtle_ontology.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology turtle_ontology.owl
;;; :Date 10/12/2022 17:20:30

(defclass Ejercicio
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot trabaja
        (type INSTANCE)
        (create-accessor read-write))
    (slot dificultat_ejercicio
        (type INTEGER)
        (create-accessor read-write))
    (multislot impacto
        (type SYMBOL)
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

(defclass Aerobico
    (is-a Ejercicio)
    (role concrete)
    (pattern-match reactive)
    (multislot es_un
        (type INSTANCE)
        (create-accessor read-write))
    (multislot exterior
        (type SYMBOL)
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
    (multislot se_recomienda
        (type INSTANCE)
        (create-accessor read-write))
    (multislot nombre
        (type SYMBOL)
        (create-accessor read-write))
    (slot tipo_enfermedad
        (type STRING)
        (create-accessor read-write))
)

(defclass Faceta_trabajada
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot nombre
        (type SYMBOL)
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
    (multislot pos_desplazamiento
        (type SYMBOL)
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
