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

    ;------------------- EJERCICIOS ----------------
;SENTADILLA

    ([Sentadilla] of Ejercicio
         (nombre_ejercicio  "Sentadilla")
         (parte_ejercitada  "Pierna")
    )

    ([Sentadilla_Principiante] of Anaerobico
         (es_un  [Sentadilla])
         (dificultat_ejercicio  2)
         (numero_repeticiones  5)
         (numero_series 3)
         (tipo_anaerobico "Calentamiento")
    )

    ([Sentadilla_Medio] of Anaerobico
         (es_un  [Sentadilla])
         (dificultat_ejercicio  5)
         (numero_repeticiones  8)
         (numero_series 3)
         (tipo_anaerobico "Calentamiento")
    )

    ([Sentadilla_Avanzado] of Anaerobico
         (es_un  [Sentadilla])
         (dificultat_ejercicio  8)
         (numero_repeticiones  8)
         (numero_series 4)
         (tipo_anaerobico "Calentamiento")
    )
;LATELARIZACION DEL CUELLO

    ([Lateralización_de_Cuello] of Ejercicio
         (nombre_ejercicio  "Lateralización de Cuello")
         (parte_ejercitada  "Cuello")
    )

    ([Lateralización_de_Cuello_Principiante] of Anaerobico
            (es_un  [Lateralización_de_Cuello])
            (dificultat_ejercicio 2)
            (numero_repeticiones  6)
            (numero_series  2)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Lateralización_de_Cuello_Medio] of Anaerobico
            (es_un  [Lateralización_de_Cuello])
            (dificultat_ejercicio 5)
            (numero_repeticiones  10)
            (numero_series  2)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Lateralización_de_Cuello_Avanzado] of Anaerobico
            (es_un  [Lateralización_de_Cuello])
            (dificultat_ejercicio 8)
            (numero_repeticiones  10)
            (numero_series  3)
            (tipo_anaerobico  "Calentamiento")
        )

;DIAGONAL DE CUELLO
        
    ([Diagonal_de_Cuello] of Ejercicio
            (nombre_ejercicio  "Diagonal de cuello")
            (parte_ejercitada  "Cuello")
        )
    
    ([Diagonal_de_Cuello_Principiante] of Anaerobico
            (es_un  [Diagonal_de_Cuello])
            (dificultat_ejercicio 2)
            (numero_repeticiones  6)
            (numero_series  2)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Lateralización_de_Cuello_Medio] of Anaerobico
            (es_un  [Diagonal_de_Cuello])
            (dificultat_ejercicio 5)
            (numero_repeticiones  10)
            (numero_series  2)
            (tipo_anaerobico  "Calentamiento")
        )

    ([Lateralización_de_Cuello_Avanzado] of Anaerobico
            (es_un  [Diagonal_de_Cuello])
            (dificultat_ejercicio 2)
            (numero_repeticiones  8)
            (numero_series  3)
            (tipo_anaerobico  "Calentamiento")
        )

;FLEXION DE HOMBROS

    ([Flexion_de_hombros] of Ejercicio
            (nombre_ejercicio  "Flexion de hombros")
            (parte_ejercitada  "Hombro")
        )
    
    ([Flexion_de_hombros_Principiante] of Anaerobico
            (es_un  [Flexion_de_hombros])
            (dificultat_ejercicio 2)
            (numero_repeticiones  5)
            (numero_series  2)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Flexion_de_hombros_Medio] of Anaerobico
            (es_un  [Flexion_de_hombros])
            (dificultat_ejercicio 5)
            (numero_repeticiones  8)
            (numero_series  2)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Flexion_de_hombros_Avanzado] of Anaerobico
            (es_un  [Flexion_de_hombros])
            (dificultat_ejercicio 8)
            (numero_repeticiones  6)
            (numero_series  3)
            (tipo_anaerobico  "Calentamiento")
        )

;EXTENSIÓN DE HOMBROS
    
    ([Extension_de_hombros] of Ejercicio
            (nombre_ejercicio  "Extension de hombros")
            (parte_ejercitada  "Hombro")
        )
    
    ([Extension_de_hombros_Principiante] of Anaerobico
            (es_un  [Extension_de_hombros])
            (dificultat_ejercicio 2)
            (numero_repeticiones  6)
            (numero_series  2)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Extension_de_hombros_Medio] of Anaerobico
            (es_un  [Extension_de_hombros])
            (dificultat_ejercicio 5)
            (numero_repeticiones  6)
            (numero_series  3)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Extension_de_hombros_Avanzado] of Anaerobico
            (es_un  [Extension_de_hombros])
            (dificultat_ejercicio 8)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
;ROTADORES DE HOMBRO

    ([Rotadores_de_hombro] of Ejercicio
            (nombre_ejercicio  "Rotadores de hombro")
            (parte_ejercitada  "Hombro")
        )
    
    ([Rotadores_de_hombro_Principante] of Anaerobico
            (es_un  [Rotadores_de_hombro])
            (dificultat_ejercicio 2)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Rotadores_de_hombro_Medio] of Anaerobico
            (es_un  [Rotadores_de_hombro])
            (dificultat_ejercicio 5)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Rotadores_de_hombro_Avanzado] of Anaerobico
            (es_un  [Rotadores_de_hombro])
            (dificultat_ejercicio 8)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )

;ESTIRAMIENTO DE MIEMBROS SUPERIORES
    
    ([Estiramiento_de_miembros_superiores] of Ejercicio
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazo")
        )
    
    ([Estiramiento_de_miembros_superiores_Principiante] of Anaerobico
            (es_un  [Estiramiento_de_miembros_superiores])
            (dificultat_ejercicio 2)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Estiramiento_de_miembros_superiores_Medio] of Anaerobico
            (es_un  [Estiramiento_de_miembros_superiores])
            (dificultat_ejercicio 5)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Estiramiento_de_miembros_superiores_Avanzado] of Anaerobico
            (es_un  [Estiramiento_de_miembros_superiores])
            (dificultat_ejercicio 8)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )

;LATERALIZACION DEL TRONCO
    
    ([Lateralización_del_tronco] of Ejercicio
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Lateralización_del_tronco_Principiante] of Anaerobico
            (es_un  [Lateralización_del_tronco])
            (dificultat_ejercicio 2)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Lateralización_del_tronco_Medio] of Anaerobico
            (es_un  [Lateralización_del_tronco])
            (dificultat_ejercicio 5)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Lateralización_del_tronco_Avanzado] of Anaerobico
            (es_un  [Lateralización_del_tronco])
            (dificultat_ejercicio 8)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )

;GIROS DE CINTURA
    
    ([Giros_de_cintura] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Cintura")
        )
    
    ([Giros_de_cintura_Principiante] of Anaerobico
            (es_un  [Giros_de_cintura])
            (dificultat_ejercicio 2)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Giros_de_cintura_Medio] of Anaerobico
            (es_un  [Giros_de_cintura])
            (dificultat_ejercicio 5)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Giros_de_cintura_Avanzado] of Anaerobico
            (es_un  [Giros_de_cintura])
            (dificultat_ejercicio 8)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )

;ESTIRAMIENTO DE MIEMBROS INFERIORES
    
    ([Estiramiento_de_miembros_inferiores] of Ejercicio
            (nombre_ejercicio  "Estiramiento de miembros inferiores")
            (parte_ejercitada  "Pierna")
        )
    
    ([Estiramiento_de_miembros_inferiores_Principiante] of Anaerobico
            (es_un  [Estiramiento_de_miembros_inferiores])
            (dificultat_ejercicio 2)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Estiramiento_de_miembros_inferiores_Medio] of Anaerobico
            (es_un  [Estiramiento_de_miembros_inferiores])
            (dificultat_ejercicio 5)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Estiramiento_de_miembros_inferiores_Avanzado] of Anaerobico
            (es_un  [Estiramiento_de_miembros_inferiores])
            (dificultat_ejercicio 8)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )

;DELTOIDES
    
    ([Deltoides] of Ejercicio
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Hombro")
        )
    
    ([Deltoides_Principiante] of Anaerobico
            (es_un  [Deltoides])
            (dificultat_ejercicio 2)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Deltoides_Medio] of Anaerobico
            (es_un  [Deltoides])
            (dificultat_ejercicio 5)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Deltoides_Avanzado] of Anaerobico
            (es_un  [Deltoides])
            (dificultat_ejercicio 8)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )

;TRAPECIO
    
    ([Trapecio] of Ejercicio
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Espalda")
        )
    
    ([Trapecio_Principiante] of Anaerobico
            (es_un  [Trapecio])
            (dificultat_ejercicio 2)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Trapecio_Medio] of Anaerobico
            (es_un  [Trapecio])
            (dificultat_ejercicio 5)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Trapecio_Avanzado] of Anaerobico
            (es_un  [Trapecio])
            (dificultat_ejercicio 8)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )

;PECTORALES

    ([Pectorales] of Ejercicio
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Pecho")
        )
    
    ([Pectorales_Principiante] of Anaerobico
            (es_un  [Pectorales])
            (dificultat_ejercicio 2)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Pectorales_Medio] of Anaerobico
            (es_un  [Pectorales])
            (dificultat_ejercicio 5)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Pectorales_Avanzado] of Anaerobico
            (es_un  [Pectorales])
            (dificultat_ejercicio 8)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
;BICEPS

    ([Biceps] of Ejercicio
            (nombre_ejercicio  "Biceps")
            (parte_ejercitada  "Brazo")
        )
    
    ([Biceps_Principiante] of Anaerobico
            (es_un  [Biceps])
            (dificultat_ejercicio 2)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Biceps_Medio] of Anaerobico
            (es_un  [Biceps])
            (dificultat_ejercicio 5)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Biceps_Avanzado] of Anaerobico
            (es_un  [Biceps])
            (dificultat_ejercicio 8)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )

;TRICEPS
    
    ([Triceps] of Ejercicio
            (nombre_ejercicio  "Triceps")
            (parte_ejercitada  "Brazo")
        )

    ([Triceps_Principiante] of Anaerobico
            (es_un  [Triceps])
            (dificultat_ejercicio 2)
            (numero_repeticiones  6)
            (numero_series  3)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Triceps_Medio] of Anaerobico
            (es_un  [Triceps])
            (dificultat_ejercicio 5)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Triceps_Avanzado] of Anaerobico
            (es_un  [Triceps])
            (dificultat_ejercicio 5)
            (numero_repeticiones  10)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )

;PUENTE
    
    ([Puente] of Ejercicio
            (nombre_ejercicio  "Puente")
            (parte_ejercitada  "Lumbar")
        )
    
    ([Puente_Principiante] of Anaerobico
            (es_un  [Puente])
            (dificultat_ejercicio 2)
            (numero_repeticiones  6)
            (numero_series  3)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Puente_Medio] of Anaerobico
            (es_un  [Puente])
            (dificultat_ejercicio 5)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Puente_Avanzado] of Anaerobico
            (es_un  [Puente])
            (dificultat_ejercicio 8)
            (numero_repeticiones  10)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )

;ABDOMINALES
    
    ([Abdominales] of Ejercicio
            (nombre_ejercicio  "Abdominales")
            (parte_ejercitada  "Abdomen")
        )
    
    ([Abdominales_Principiante] of Anaerobico
            (es_un  [Abdominales])
            (dificultat_ejercicio 2)
            (numero_repeticiones  6)
            (numero_series  3)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Abdominales_Medio] of Anaerobico
            (es_un  [Abdominales])
            (dificultat_ejercicio 5)
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Abdominales_Avanzado] of Anaerobico
            (es_un  [Abdominales])
            (dificultat_ejercicio 8)
            (numero_repeticiones  10)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )


;-----AEROBICOS
;MARCHA
    
    ([Marcha] of Ejercicio
            (dificultat  3)
            (parte_ejercitada  "Pierna")
        )
    
    ([Marcha_Principante] of Aerobico
            (es_un  [Marcha])
            (dificultat_ejercicio 2)
            (minutos  10)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Marcha_Medio] of Aerobico
            (es_un  [Marcha])
            (dificultat_ejercicio 5)
            (minutos  20)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Marcha_Avanzado] of Aerobico
            (es_un  [Marcha])
            (dificultat_ejercicio 8)
            (minutos  30)
            (tipo_deporte "Cardiovascular")
        )
    
;ANDAR

    ([Andar] of Ejercicio
            (nombre_ejercicio  "Andar")
            (parte_ejercitada  "Pierna")
        )
    
    ([Andar_Principante] of Aerobico
            (es_un  [Andar])
            (dificultat_ejercicio 2)
            (minutos  10)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Andar_Medio] of Aerobico
            (es_un  [Andar])
            (dificultat_ejercicio 5)
            (minutos  20)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Andar_Avanzado] of Aerobico
            (es_un  [Andar])
            (dificultat_ejercicio 8)
            (minutos  30)
            (tipo_deporte "Cardiovascular")
        )

;CICLISMO
    
    ([Ciclismo] of Ejercicio
            (nombre_ejercicio  "Ciclismo")
            (parte_ejercitada  "Pierna")
        )
    
    ([Ciclismo_Principante] of Aerobico
            (es_un  [Ciclismo])
            (dificultat_ejercicio 2)
            (minutos  10)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Ciclismo_Medio] of Aerobico
            (es_un  [Ciclismo])
            (dificultat_ejercicio 5)
            (minutos  20)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Ciclismo_Avanzado] of Aerobico
            (es_un  [Ciclismo])
            (dificultat_ejercicio 8)
            (minutos  30)
            (tipo_deporte "Cardiovascular")
        )

;PEDALEAR EN EL GIMNASIO
    
    ([Pedalear] of Ejercicio
            (nombre_ejercicio  "Pedalear")
            (parte_ejercitada  "Pierna")
        )
    
    ([Pedalear_Principante] of Aerobico
            (es_un  [Pedalear])
            (dificultat_ejercicio 2)
            (minutos  10)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Pedalear_Medio] of Aerobico
            (es_un  [Pedalear])
            (dificultat_ejercicio 5)
            (minutos  20)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Pedalear_Avanzado] of Aerobico
            (es_un  [Pedalear])
            (dificultat_ejercicio 8)
            (minutos  30)
            (tipo_deporte "Cardiovascular")
        )
;NADAR

    ([Nadar] of Ejercicio
            (nombre_ejercicio  "Nadar")
            (parte_ejercitada  "Todo el cuerpo")
        )
    
    ([Nadar_Principante] of Aerobico
            (es_un  [Nadar])
            (dificultat_ejercicio 2)
            (minutos  10)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Nadar_Medio] of Aerobico
            (es_un  [Nadar])
            (dificultat_ejercicio 5)
            (minutos  20)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Nadar_Avanzado] of Aerobico
            (es_un  [Nadar])
            (dificultat_ejercicio 8)
            (minutos  30)
            (tipo_deporte "Cardiovascular")
        )

;----------------ENFERMEDADES

    ([Cardiovascular] of Enfermedad
            (nombre "Cardiovascular")
        )

    ([Hipertension] of Enfermedad
            (nombre "Hipertension")
        )

    ([Sobrepeso] of Enfermedad
            (nombre "Sobrepeso")
        )
    
    ([Diabetes] of Enfermedad
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
    
    ([Depresion] of Enfermedad
            (nombre "Depresion")
        )
)
