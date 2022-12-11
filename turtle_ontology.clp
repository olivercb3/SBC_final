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

;-------------------EJERCICIOS ----------------
;SENTADILLA

    ([Sentadilla] of Ejercicio
         (dificultat  3)
         (nombre_ejercicio  "Sentadilla")
         (parte_ejercitada  "Pierna")
    )

    ([Sentadilla_Principiante] of Anaerobico
         (es_un  [Sentadilla])
         (numero_repeticiones  5)
         (numero_series 3)
         (tipo_anaerobico "Calentamiento")
    )

    ([Sentadilla_Medio] of Anaerobico
         (es_un  [Sentadilla])
         (numero_repeticiones  8)
         (numero_series 3)
         (tipo_anaerobico "Calentamiento")
    )

    ([Sentadilla_Avanzado] of Anaerobico
         (es_un  [Sentadilla])
         (numero_repeticiones  8)
         (numero_series 4)
         (tipo_anaerobico "Calentamiento")
    )
;LATELARIZACION DEL CUELLO

    ([Lateralización_de_Cuello] of Ejercicio
         (dificultat  1)
         (nombre_ejercicio  "Lateralización de Cuello")
         (parte_ejercitada  "Cuello")
    )

    ([Lateralización_de_Cuello_Principiante] of Anaerobico
            (es_un  [Lateralización_de_Cuello])
            (numero_repeticiones  6)
            (numero_series  2)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Lateralización_de_Cuello_Medio] of Anaerobico
            (es_un  [Lateralización_de_Cuello])
            (numero_repeticiones  10)
            (numero_series  2)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Lateralización_de_Cuello_Avanzado] of Anaerobico
            (es_un  [Lateralización_de_Cuello])
            (numero_repeticiones  10)
            (numero_series  3)
            (tipo_anaerobico  "Calentamiento")
        )

;DIAGONAL DE CUELLO
        
    ([Diagonal_de_Cuello] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Diagonal de cuello")
            (parte_ejercitada  "Cuello")
        )
    
    ([Diagonal_de_Cuello_Principiante] of Anaerobico
            (es_un  [Diagonal_de_Cuello])
            (numero_repeticiones  6)
            (numero_series  2)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Lateralización_de_Cuello_Avanzado] of Anaerobico
            (es_un  [Diagonal_de_Cuello])
            (numero_repeticiones  10)
            (numero_series  2)
            (tipo_anaerobico  "Calentamiento")
        )

    ([Lateralización_de_Cuello_Avanzado] of Anaerobico
            (es_un  [Diagonal_de_Cuello])
            (numero_repeticiones  8)
            (numero_series  3)
            (tipo_anaerobico  "Calentamiento")
        )

;FLEXION DE HOMBROS

    ([Flexion_de_hombros] of Ejercicio
            (dificultat  3)
            (nombre_ejercicio  "Flexion de hombros")
            (parte_ejercitada  "Hombro")
        )
    
    ([Flexion_de_hombros_Principiante] of Anaerobico
            (es_un  [Flexion_de_hombros])
            (numero_repeticiones  5)
            (numero_series  2)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Flexion_de_hombros_Medio] of Anaerobico
            (es_un  [Flexion_de_hombros])
            (numero_repeticiones  8)
            (numero_series  2)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Flexion_de_hombros_Avanzado] of Anaerobico
            (es_un  [Flexion_de_hombros])
            (numero_repeticiones  6)
            (numero_series  3)
            (tipo_anaerobico  "Calentamiento")
        )

;EXTENSIÓN DE HOMBROS
    
    ([Extension_de_hombros] of Ejercicio
            (dificultat  2)
            (nombre_ejercicio  "Extension de hombros")
            (parte_ejercitada  "Hombro")
        )
    
    ([Extension_de_hombros_Principiante] of Anaerobico
            (es_un  [Extension_de_hombros])
            (numero_repeticiones  6)
            (numero_series  2)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Extension_de_hombros_Medio] of Anaerobico
            (es_un  [Extension_de_hombros])
            (numero_repeticiones  6)
            (numero_series  3)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Extension_de_hombros_Avanzado] of Anaerobico
            (es_un  [Extension_de_hombros])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
;ROTADORES DE HOMBRO

    ([Rotadores_de_hombro] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Rotadores de hombro")
            (parte_ejercitada  "Hombro")
        )
    
    ([Rotadores_de_hombro_Avanzado] of Anaerobico
            (es_un  [Rotadores_de_hombro])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Rotadores_de_hombro_Avanzado] of Anaerobico
            (es_un  [Rotadores_de_hombro])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Rotadores_de_hombro_Avanzado] of Anaerobico
            (es_un  [Rotadores_de_hombro])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )

;ESTIRAMIENTO DE MIEMBROS SUPERIORES
    
    ([Estiramiento_de_miembros_superiores] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazo")
        )
    
    ([Estiramiento_de_miembros_superiores_Principiante] of Anaerobico
            (es_un  [Estiramiento_de_miembros_superiores])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Estiramiento_de_miembros_superiores_Medio] of Anaerobico
            (es_un  [Estiramiento_de_miembros_superiores])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Estiramiento_de_miembros_superiores_Avanzado] of Anaerobico
            (es_un  [Estiramiento_de_miembros_superiores])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )

;LATERALIZACION DEL TRONCO
    
    ([Lateralización_del_tronco] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Brazos")
        )
    
    ([Lateralización_del_tronco_Principiante] of Anaerobico
            (es_un  [Lateralización_del_tronco])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Lateralización_del_tronco_Medio] of Anaerobico
            (es_un  [Lateralización_del_tronco])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Lateralización_del_tronco_Avanzado] of Anaerobico
            (es_un  [Lateralización_del_tronco])
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
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Giros_de_cintura_Medio] of Anaerobico
            (es_un  [Giros_de_cintura])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Giros_de_cintura_Avanzado] of Anaerobico
            (es_un  [Giros_de_cintura])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )

;ESTIRAMIENTO DE MIEMBROS INFERIORES
    
    ([Estiramiento_de_miembros_inferiores] of Ejercicio
            (dificultat  1)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Pierna")
        )
    
    ([Estiramiento_de_miembros_inferiores_Principiante] of Anaerobico
            (es_un  [Estiramiento_de_miembros_inferiores])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Estiramiento_de_miembros_inferiores_Medio] of Anaerobico
            (es_un  [Estiramiento_de_miembros_inferiores])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )
    
    ([Estiramiento_de_miembros_inferiores_Avanzado] of Anaerobico
            (es_un  [Estiramiento_de_miembros_inferiores])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Calentamiento")
        )

;DELTOIDES
    
    ([Deltoides] of Ejercicio
            (dificultat  3)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Hombro")
        )
    
    ([Deltoides_Principiante] of Anaerobico
            (es_un  [Deltoides])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Deltoides_Medio] of Anaerobico
            (es_un  [Deltoides])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Deltoides_Avanzado] of Anaerobico
            (es_un  [Deltoides])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )

;TRAPECIO
    
    ([Trapecio] of Ejercicio
            (dificultat  3)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Espalda")
        )
    
    ([Trapecio_Principiante] of Anaerobico
            (es_un  [Trapecio])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Trapecio_Medio] of Anaerobico
            (es_un  [Trapecio])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Trapecio_Avanzado] of Anaerobico
            (es_un  [Trapecio])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )

;PECTORALES

    ([Pectorales] of Ejercicio
            (dificultat  3)
            (nombre_ejercicio  "Estiramiento de miembros superiores")
            (parte_ejercitada  "Pecho")
        )
    
    ([Pectorales_Principiante] of Anaerobico
            (es_un  [Pectorales])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Pectorales_Medio] of Anaerobico
            (es_un  [Pectorales])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Pectorales_Avanzado] of Anaerobico
            (es_un  [Pectorales])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
;BICEPS

    ([Biceps] of Ejercicio
            (dificultat  3)
            (nombre_ejercicio  "Biceps")
            (parte_ejercitada  "Brazo")
        )
    
    ([Biceps_Principiante] of Anaerobico
            (es_un  [Biceps])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Biceps_Medio] of Anaerobico
            (es_un  [Biceps])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Biceps_Avanzado] of Anaerobico
            (es_un  [Biceps])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )

;TRICEPS
    
    ([Triceps] of Ejercicio
            (dificultat  3)
            (nombre_ejercicio  "Triceps")
            (parte_ejercitada  "Brazo")
        )

    ([Triceps_Principiante] of Anaerobico
            (es_un  [Triceps])
            (numero_repeticiones  6)
            (numero_series  3)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Triceps_Medio] of Anaerobico
            (es_un  [Triceps])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Triceps_Avanzado] of Anaerobico
            (es_un  [Triceps])
            (numero_repeticiones  10)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )

;PUENTE
    
    ([Puente] of Ejercicio
            (dificultat  2)
            (nombre_ejercicio  "Puente")
            (parte_ejercitada  "Lumbar")
        )
    
    ([Puente_Principiante] of Anaerobico
            (es_un  [Puente])
            (numero_repeticiones  6)
            (numero_series  3)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Puente_Medio] of Anaerobico
            (es_un  [Puente])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Puente_Avanzado] of Anaerobico
            (es_un  [Puente])
            (numero_repeticiones  10)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )

;ABDOMINALES
    
    ([Abdominales] of Ejercicio
            (dificultat  2)
            (nombre_ejercicio  "Abdominales")
            (parte_ejercitada  "Abdomen")
        )
    
    ([Abdominales_Principiante] of Anaerobico
            (es_un  [Abdominales])
            (numero_repeticiones  6)
            (numero_series  3)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Abdominales_Medio] of Anaerobico
            (es_un  [Abdominales])
            (numero_repeticiones  6)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )
    
    ([Abdominales_Avanzado] of Anaerobico
            (es_un  [Abdominales])
            (numero_repeticiones  10)
            (numero_series  4)
            (tipo_anaerobico  "Fuerza")
        )


;-----AEROBICOS
;MARCHA
    
    ([Marcha] of Ejercicio
            (dificultat  3)
            (nombre_ejercicio  "Marcha")
            (parte_ejercitada  "Pierna")
        )
    
    ([Marcha_Principante] of Aerobico
            (es_un  [Marcha])
            (minutos  10)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Marcha_Medio] of Aerobico
            (es_un  [Marcha])
            (minutos  20)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Marcha_Avanzado] of Aerobico
            (es_un  [Marcha])
            (minutos  30)
            (tipo_deporte "Cardiovascular")
        )
    
;ANDAR

    ([Andar] of Ejercicio
            (dificultat  2)
            (nombre_ejercicio  "Andar")
            (parte_ejercitada  "Pierna")
        )
    
    ([Andar_Principante] of Aerobico
            (es_un  [Andar])
            (minutos  10)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Andar_Medio] of Aerobico
            (es_un  [Andar])
            (minutos  20)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Andar_Avanzado] of Aerobico
            (es_un  [Andar])
            (minutos  30)
            (tipo_deporte "Cardiovascular")
        )

;CICLISMO
    
    ([Ciclismo] of Ejercicio
            (dificultat  3)
            (nombre_ejercicio  "Ciclismo")
            (parte_ejercitada  "Pierna")
        )
    
    ([Ciclismo_Principante] of Aerobico
            (es_un  [Ciclismo])
            (minutos  10)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Ciclismo_Medio] of Aerobico
            (es_un  [Ciclismo])
            (minutos  20)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Ciclismo_Avanzado] of Aerobico
            (es_un  [Ciclismo])
            (minutos  30)
            (tipo_deporte "Cardiovascular")
        )

;PEDALEAR EN EL GIMNASIO
    
    ([Pedalear] of Ejercicio
            (dificultat  2)
            (nombre_ejercicio  "Pedalear")
            (parte_ejercitada  "Pierna")
        )
    
    ([Pedalear_Principante] of Aerobico
            (es_un  [Pedalear])
            (minutos  10)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Pedalear_Medio] of Aerobico
            (es_un  [Pedalear])
            (minutos  20)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Pedalear_Avanzado] of Aerobico
            (es_un  [Pedalear])
            (minutos  30)
            (tipo_deporte "Cardiovascular")
        )
;NADAR

    ([Nadar] of Ejercicio
            (dificultat  2)
            (nombre_ejercicio  "Nadar")
            (parte_ejercitada  "Todo el cuerpo")
        )
    
    ([Nadar_Principante] of Aerobico
            (es_un  [Nadar])
            (minutos  10)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Nadar_Medio] of Aerobico
            (es_un  [Nadar])
            (minutos  20)
            (tipo_deporte "Cardiovascular")
        )
    
    ([Nadar_Avanzado] of Aerobico
            (es_un  [Nadar])
            (minutos  30)
            (tipo_deporte "Cardiovascular")
        )

;----------------ENFERMEDADES

    ([Cardiovascular] of Enfermedad
            (tipo_enfermedad "Cardiovascular")
        )

    ([Hipertension] of Enfermedad
            (tipo_enfermedad "Hipertension")
        )

    ([Sobrepeso] of Enfermedad
            (tipo_enfermedad "Sobrepeso")
        )
    
    ([Diabetes] of Enfermedad
            (tipo_enfermedad "Depresion")
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
    
    ([Artritis_reumatoide] of Enfermedad
            (tipo_enfermedad "Artritis_reumatoide")
        )
    
    ([Fibrosis_quistica] of Enfermedad
            (tipo_enfermedad "Fibrosis_quistica")
        )
    
    ([Depresion] of Enfermedad
            (tipo_enfermedad "Depresion")
        )
)
