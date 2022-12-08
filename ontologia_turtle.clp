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

    ([Sentadilla_SuperClass] of Ejercicio
         (dificultat  3)
         (nombre_ejercicio  "Sentadilla")
         (parte_ejercitada  "Pierna")
    )

    ([Sentadilla] of Anaerobico
         (es_un  [Sentadilla_SuperClass])
         (minutos  2)
         (tipo_deporte "HIT")
    )

    ([Lateralización de Cuello] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Lateralización de Cuello")
            (parte_ejercitada  "Cuello")
        )
        
    ([Diagonal de cuello] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Diagonal de cuello")
            (parte_ejercitada  "Cuello")
        )

    ([Flexion de hombros] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Flexion de hombros")
            (parte_ejercitada  "Hombro")
        )
    
    ([Extension de hombros] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Extension de hombros")
            (parte_ejercitada  "Hombro")
        )
    
    ([Estiramiento de pectorales] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Estiramiento de pectorales")
            (parte_ejercitada  "Pectorales")
        )
    
    ([Rotadores de hombro] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Rotadores de hombro")
            (parte_ejercitada  "Pectorales")
        )
    
    ([Estiramiento de miembros superiores] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Lateralización del tronco] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Giros de cintura] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Estiramiento de miembros inferiores] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Deltoides] of Ejercicio
            (dificultat  3)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Trapecios] of Ejercicio
            (dificultat  3)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Pectorales] of Ejercicio
            (dificultat  3)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Biceps] of Ejercicio
            (dificultat  3)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Triceps] of Ejercicio
            (dificultat  3)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Puente] of Ejercicio
            (dificultat  2)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Abdominales] of Ejercicio
            (dificultat  2)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Marcha] of Ejercicio
            (dificultat  2)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Andar] of Ejercicio
            (dificultat  2)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Ciclismo] of Ejercicio
            (dificultat  2)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Pedalear] of Ejercicio
            (dificultat  2)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    ([Cardiovascular] of Enfermedad
            (tipo_enfermedad "Cardiovascular")
        )

    ([Hipertension] of Enfermedad
            (tipo_enfermedad "Hipertension")
        )

    ([Sobrepeso] of Enfermedad
            (tipo_enfermedad "Sobrepeso")
        )

    ([Pulmonar] of Enfermedad
            (tipo_enfermedad "Pulmonar")
        )
    
    ([Osteoporosis] of Enfermedad
            (tipo_enfermedad "Osteoporosis")
        )
    
    ([Cancer] of Enfermedad
            (tipo_enfermedad "Cancer")
        )
    
    ([Artritis] of Enfermedad
            (tipo_enfermedad "Artritis")
        )
    
    ([Depresion] of Enfermedad
            (tipo_enfermedad "Depresion")
        )
    
    ([PlanDeEjercicios1] of Plan_Ejercicios
            (diseñado_para  [Persona1])
            (formada_por )
            (dias 4)
            (dificultat 2)
        )
    
    ([Sesion1] of Sesion
            (formada_por [PlanDeEjercicios1])
        )
)
