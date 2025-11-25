# ##################################################
#   OWSD III Simposio Nacional de Mujeres en Ciencia
#   Análisis de registros y encuestas de participación
#   Autoría: Antonella Rivera
#   Fecha: 19 de febrero de 2025
# ##################################################

# AVISO IMPORTANTE:
# Este script ha sido desarrollado por Antonella Rivera y Larissa Acosta para el análisis del III Simposio Nacional de Mujeres en Ciencia de OWSD Honduras.
# Si este código es reutilizado para otro propósito, publicación o visualización externa,
# se solicita de manera amable que se me consulte sobre la posibilidad de autoría/colaboración incluyendo a antonellarivera.p@gmail.com
# ¡Gracias por contribuir con la visibilidad de las científicas hondureñas!

# --------------------------------------------------
# Instrucciones de uso:
# 1. Asegúrese de tener los archivos Excel en la misma carpeta que este script.
# 2. Instale las librerías necesarias si aún no están instaladas: tidyverse, readxl, formattable.
# 3. Ejecute el script paso a paso según las secciones marcadas.
# --------------------------------------------------

## Cargar librerias  -----
library(tidyverse)
library(formattable)


# Cargar datos ------

setwd("/Users/toni/OneDrive/OWSD 24 - 26/III Simposio Mujer y Nina en la Ciencia/datos")

registro_unah <-  readxl::read_excel("LISTA DE ASISTENCIA PARA EVENTOS - III Simposio Niña en la Ciencia.xlsx", sheet="Sheet1")

registro_owsd <- readxl::read_excel("Registro para el III Simposio Nacional de Mujeres.xlsx", sheet= "Respuestas de formulario 1")

encuesta_salida <- readxl::read_excel("20250219 Encuesta de Salida – III Simposio Nacional de Mujeres en Ciencia.xlsx")

# Revisar los datos
str(registro_unah)
str(registro_owsd)
str(encuesta_salida)

# Limpieza de datos ----

registro_owsd$'Cargo que desempeña' <- as.factor(registro_owsd$'Cargo que desempeña')
levels(registro_owsd$'Cargo que desempeña')

registro_owsd <- registro_owsd %>%
  mutate(Cargo_categoria = case_when(
    `Cargo que desempeña` %in% c(
      "Académico", "Asistente de Cooperación", "Asistente de investigación", "Asistente Técnica",
      "Asistente Técnico", "Asistente Técnico de Laboratorio", "Asistente técnico pedagógico",
      "Asistente técnico Unidad de Admisión y Monitoreo Académico", "ATL", "Catedrática posgrado",
      "Coordinadora Carrera Administración de Empresas Agro.", "Instructor AIII",
      "Coordinadora del Programa Nacional de Alimentación Escolar", "Director",
      "Director de la Escuela de Física, UNAH", "Directora", "Directora de Planificación y Gobernabilidad Local",
      "Docencia", "Docente", "Docente de la Facultad de Posgrado", "Docente e investigadora",
      "Docente UNAH / Miembro OWSD / Presidenta CBH", "Docente universitario", "Docente-administrativo",
      "JEFATURA DEPARTAMENTO DE MICROBIOLOGIA", "Jefe de Departamento de Ciencias Nsturales",
      "Jefe del Bloque de Estructura y Función/ Fundamentación Biologica", "Jefe Departamento de Quimica",
      "Jefe Departamento Química", "Prodesora", "Profesor", "profesor auxiliar",
      "Profesor de Laboratorio", "Profesor Titular", "Profesor Titular II",
      "Profesor titular IV, directora del herbario TEFH", "Profesor-Investigador",
      "Profesora", "Profesora investigadora", "Profesora Titular II",
      "Science and biology teacher", "STEAM Teacher", "Vicedecana Facultad de Ciencias Básicas"
    ) ~ "Académico/Docente",
    
    `Cargo que desempeña` %in% c(
      "Tesista- Bachiller", "Universitario", "Estudiantes", "Estudiantil", "Esrudiante",
      "estudiante", "Estudiante", "ESTUDIANTE", "Estudiante de química y farmacia",
      "Alumna", "Alumno"
    ) ~ "Estudiante",
    
    `Cargo que desempeña` %in% c(
      "Estudiante e Investigadora", "Investigador postdoctoral", "Investigadora",
      "Investigadora Principal", "Jefa de Investigación en SAN", "Jefe de Investigación",
      "Socióloga y Especialista en Gestión de Investigación Científica", "doctoranda"
    ) ~ "Investigador",
    
    TRUE ~ "Otro"  
  ))

# Ver los datos actualizados
table(registro_owsd$Cargo_categoria)

# Área de conocimiento
registro_owsd$`Carrera, profesión u oficio` <- as.factor(registro_owsd$`Carrera, profesión u oficio`)
levels(registro_owsd$`Carrera, profesión u oficio`)


# CCrear nueva columna "OWSD_Area" con las categorias de OWSD
registro_owsd <- registro_owsd %>%
  mutate(OWSD_Area = case_when(
    # Agricultural Sciences
    `Carrera, profesión u oficio` %in% c(
      "Ingeniero en Ciencias Forestales", "MSc. en Biotecnología Agrícola",
      "Ing. Agroindustria Alimentaria", "Gestión Ambiental y Desarrollo Sostenible ( Maestria)", "Master en ciencia y economia del cafe"  
    ) ~ "Ciencias agrícolas",
    

    #  Biological Systems and Organisms
    `Carrera, profesión u oficio` %in% c(
      "Bilogia", "Biológa", "Bióloga", "Biologia", "Biología",
      "Carrera de biología", "Ciencias biológicas", "Doctora en biología",
      "Doctorado en Ciencias Biológicas (Biología)", "Estudiante de biología", "Licenciada en ciencias naturales", "Licda. Ciencias Naturales", "Licda en Recursos Naturales y Ambiente" , "Lic. En ciencias naturales"  ,"Lic. En CCNN","Docente de Ciencias naturales" , "Ciencias naturales"     
    ) ~ "Sistemas biológicos y organismos",
    
    # Chemical Sciences
    `Carrera, profesión u oficio` %in% c(
      "Ciencias Químicas y Farmacia", "Facultad de química y farmacia",
      "Química y farmacia", "Química y Farmacia", "Químico Farmacéutico",
      "Doctora en Ciencia y Tecnología Química", "Doctora en Química y Farmacia",
      "Dra en Ciencias Químicas y Farmacia", "Dra en Quimica y farmacia",
      "Dra QF", "Dra Química y Farmacia", "Química y Farmacia, Investigación de Análisis Químico", 
      "Estudiante de química y farmacia", "Doctora en ciencia y Tecnología QUímica - PhD"  
    ) ~ "Ciencias químicas",
    
    # Engineering Sciences
    `Carrera, profesión u oficio` %in% c(
      "Ingeniera Civil", "Ingeniera Industrial Master en Gestión de Proyectos",
      "Ingeniera industrial, Master en gestión de proyectos", "Ingeniería Civil",
      "Ingeniería en gestión de ambiente y desarrollo", "Ingeniería en tecnología alimentaria", "Ingeniería en Sistemas", 
      "Ing. En mecatronica"
    ) ~ "Ingenierías",
    
    # Mathematical Sciences
    `Carrera, profesión u oficio` %in% c(
      "Física", "Master en Física", "Licenciada en Matemática",
      "Matematicas", "licenciatura en matemática con orientación en ingeniería matemática", "Docente de Matemática"      
    ) ~ "Ciencias matemáticas",
    
    # Medical and Health Sciences
    `Carrera, profesión u oficio` %in% c(
      "Medicina", "MEDICINA Y CIRUGÍA", "Medicina y cirugía general",
      "Medico", "Médico", "Psiquiatra", "Enfermera", "Licenciada en enfermería",
      "Odontologia", "Odontología", "Nutrición", "Nutricionista",
      "Estudiante de medicina", "estudiante de odontología", "Tecnología de alimentos", "Tecnología de Alimentos",
      "Tecnologia en Alimentos"
    ) ~ "Ciencias de la salud",
    
    # Physics
    `Carrera, profesión u oficio` %in% c(
      "Física", "Master en Física"
    ) ~ "Física",
    
    # Social and Economic Sciences
    `Carrera, profesión u oficio` %in% c(
      "Administracion", "Administración Aduanera", "Administracion y Generación de empresas",
      "Direccion Empresarial", "Comercio internacional", "Comercio Internacional",
      "Lic. En Relaciones Internacionales", "Mercadeo", "Mercadotecnia y Master en Gobernanza y DDHH",
      "MSc. Administración de empresas con orientación en finanzas",
      "MSc. En gestión de servicios de salud/Lic. En Ciencias Naturales",
      "Máster en Evaluación del Impacto Ambiental", "Máster en Planificación y Gestión de Riesgos Naturales",
      "Licenciada en Desarrollo Local","Licenciatura de Letras" , "Socióloga", "Sociología", "Sociologa",
      "Socióloga y Especialista en Gestión de Investigación Científica",
      "Técnico en Microfinanzas", "Letraa", "Letras", "Letras y literatura" ,
      "Docente universitaria UNAH,  escritora y gestora cultural" 
    ) ~ "Ciencias sociales y económicas",
    
    # Structural, Cell, and Molecular Biology
    `Carrera, profesión u oficio` %in% c(
      "Microbilogo", "Microbiologa", "Microbióloga", "Microbiologia",
      "MICROBIOLOGIA", "Microbiología", "Doctora en Microbiología",
      "Jefe de Investigación"
    ) ~ "Biología molecular",
    
    # Other (Uncategorized)
    TRUE ~ "Otros"
  ))

# Ver datos actualizados
table(registro_owsd$OWSD_Area)

registro_unah$`Categoría del participante` <- as.factor(registro_unah$`Categoría del participante`)
levels(registro_unah$`Categoría del participante`)

registro_unah$`Categoría del participante2` <- registro_unah$`Categoría del participante`
levels(registro_unah$`Categoría del participante2`)[c(1,2, 5:8)] <- "Otros"

# Arreglar nombres en la encuesta de salida 

encuesta_salida <- encuesta_salida %>%
  rename(
    Edad = "Edad",
    Ocupación = "Ocupación",
    Organización = "¿Cómo calificaría los siguientes aspectos del evento? (1 = Muy Malo, 5 = Excelente) [Organización del evento: ⭐️⭐️⭐️⭐️⭐️]",
    Ponencias = "¿Cómo calificaría los siguientes aspectos del evento? (1 = Muy Malo, 5 = Excelente) [Calidad de las ponencias: ⭐️⭐️⭐️⭐️⭐️]",
    Relevancia = "¿Cómo calificaría los siguientes aspectos del evento? (1 = Muy Malo, 5 = Excelente) [Relevancia de los temas: ⭐️⭐️⭐️⭐️⭐️]",
    Logística = "¿Cómo calificaría los siguientes aspectos del evento? (1 = Muy Malo, 5 = Excelente) [Espacio y logística: ⭐️⭐️⭐️⭐️⭐️]",
    Networking = "¿Cómo calificaría los siguientes aspectos del evento? (1 = Muy Malo, 5 = Excelente) [Oportunidades de networking: ⭐️⭐️⭐️⭐️⭐️]"
  )

# Arreglar niveles de edad
encuesta_salida <- encuesta_salida %>%
  mutate(Edad = factor(Edad, levels = c("15-20", "21-30", "31-40", "41-50", "51+"), ordered = TRUE))

# Arreglar niveles de ocupación
encuesta_salida$Ocupación <- as.factor(encuesta_salida$Ocupación)
levels(encuesta_salida$Ocupación)[3]  <- "Investigador/a" 

# Arreglar niveles de percepciones

perception_levels <- c("Muy malo", "Malo", "Regular", "Bueno", "Excelente")

encuesta_salida <- encuesta_salida %>%
  mutate(
    Organización = factor(trimws(Organización), levels = perception_levels, ordered = TRUE),
    Ponencias    = factor(trimws(Ponencias),    levels = perception_levels, ordered = TRUE),
    Relevancia   = factor(trimws(Relevancia),   levels = perception_levels, ordered = TRUE),
    Logística    = factor(trimws(Logística),    levels = perception_levels, ordered = TRUE),
    Networking   = factor(trimws(Networking),   levels = perception_levels, ordered = TRUE)
  )


# Comparación correos duplicados

# Estandarizar correos
registro_unah <- registro_unah %>%
  mutate(Correo_electronico2 = tolower(trimws(`Correo electrónico2`)))

registro_owsd <- registro_owsd %>%
  mutate(Correo_electronico_contacto = tolower(trimws(`Correo electrónico de contacto`)))

colnames(registro_owsd)[16] <- "Modalidad"

# Correos presentes en las dos bases de datos
common_emails <- intersect(registro_unah$Correo_electronico2, registro_owsd$Correo_electronico_contacto)
print(common_emails)

#Contar el número de correos duplicados
cat("Total emails in both datasets:", length(common_emails), "\n")

# Gráficas -----


# Definir paleta de colores OWSD Honduras 
owsd_colors <- c("#005F73", "#0A9396", "#94D2BD", "#2D6A4F", "#EE9B00", "#CA6702", "#BB3E03", "#AE2012","#9C6644", "#ADB5BD"  )

# Función para hacer las gráficas estandarizadas

plot_categorical_distribution <- function(data, column, title) {
  var_sym <- rlang::sym(column)

  data_summary <- data %>%
    count(!!var_sym) %>%
    mutate(
      percentage = n / sum(n) * 100,
      # Re-apply factor order if column is a factor
      !!column := if (is.factor(data[[column]])) {
        factor(!!var_sym, levels = levels(data[[column]]))
      } else {
        !!var_sym
      }
    )

  ggplot(data_summary, aes(x = !!sym(column), y = n, fill = !!sym(column))) +
    geom_bar(stat = "identity", color = "white", size = 0.3) +
    scale_fill_manual(values = owsd_colors) +
    coord_flip() +
    geom_text(aes(label = paste0(round(percentage, 1), "%")),
              hjust = 1, size = 5, color = "white", fontface = "bold") +
    labs(title = title, x = NULL, y = "Conteo") +
    theme_minimal(base_family = "Arial") +
    theme(
      text = element_text(size = 14, family = "Arial", color = "#1B263B"),
      plot.title = element_text(size = 18, face = "bold", color = "#005F73"),
      axis.text.x = element_text(size = 12),
      axis.text.y = element_text(size = 12),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      legend.position = "none"
    )
}

#Gráficas de registro OWSD----

# Género
plot_categorical_distribution(registro_owsd, "Sexo", "Distribución de Participantes por Género")
table(registro_owsd$Sexo)

plot_categorical_distribution(registro_owsd, "Cargo_categoria", "Distribución de Participantes por Cargo")
table(registro_owsd$'Cargo que desempeña')

plot_categorical_distribution(registro_owsd, "OWSD_Area", "Distribución de Participantes por Profesión")
table(registro_owsd$OWSD_Area)

plot_categorical_distribution(registro_owsd, "Modalidad", "Participación virtual vs presencial")
table(registro_owsd$Modalidad)

plot_categorical_distribution(registro_owsd, "Si todavía no eres miembro OWSD-HN, ¿Desea que le contactemos para ser miembro o amigo de OWSD?", "Interés en membresía")

#Gráficas de registro UNAH----
plot_categorical_distribution(registro_unah, "Categoría del participante2", "Distribución de Participantes por Categoría (UNAH)")
table(registro_unah$`Categoría del participante`)

#Gráficas de encuesta de salida OWSD----
plot_categorical_distribution(encuesta_salida, "Edad", "Distribución por Edad")

plot_categorical_distribution(encuesta_salida, "Ocupación", "Distribución por Ocupación")

plot_categorical_distribution(encuesta_salida, "Organización", "Evaluación: Organización del evento")

plot_categorical_distribution(encuesta_salida, "Ponencias", "Evaluación: Calidad de las ponencias")

plot_categorical_distribution(encuesta_salida, "Relevancia", "Evaluación: Relevancia de los temas")

plot_categorical_distribution(encuesta_salida , "Logística", "Evaluación: Espacio y logística")

plot_categorical_distribution(encuesta_salida, "Networking", "Evaluación: Oportunidades de networking")

# Contar participantes en ambos registros-----

nrow(registro_unah) - length(common_emails) + nrow(registro_owsd)

# 486 participantes en total
# 358 Presencial
# 101 Virtual

# Tabla resumen de participantes -----
resumen <- data.frame(
  Variable = c("Sexo", "Cargo", "Área OWSD", "Interés en membresía"),
  Categorías = c(
    paste(names(table(registro_owsd$Sexo)), table(registro_owsd$Sexo), sep = ": ", collapse = "; "),
    paste(names(table(registro_owsd$Cargo_categoria)), table(registro_owsd$Cargo_categoria), sep = ": ", collapse = "; "),
    paste(names(table(registro_owsd$OWSD_Area)), table(registro_owsd$OWSD_Area), sep = ": ", collapse = "; "),
    paste(names(table(registro_owsd$`Si todavía no eres miembro OWSD-HN, ¿Desea que le contactemos para ser miembro o amigo de OWSD?`)),
          table(registro_owsd$`Si todavía no eres miembro OWSD-HN, ¿Desea que le contactemos para ser miembro o amigo de OWSD?`),
          sep = ": ", collapse = "; ")
  )
)

formattable(resumen, list(
  Variable = formatter("span", style = ~ style(color = "#005F73", font.weight = "bold")),
  Categorías = formatter("span", style = ~ style(font.size = "12px"))
))