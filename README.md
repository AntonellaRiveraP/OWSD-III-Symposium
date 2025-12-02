# 📊 Procesos de análisis y visualización de datos del III Simposio Nacional de Mujeres en Ciencia  
### Experiencia de OWSD Honduras 🇭🇳

> Repositorio de análisis reproducible elaborado con R Markdown, como parte del III Simposio Nacional de Mujeres en Ciencia – OWSD Honduras 2025.

![R](https://img.shields.io/badge/Made%20with-R-blue?logo=r)
![License: CC BY 4.0](https://img.shields.io/badge/License-CC--BY%204.0-green)
![Conference: LatinR](https://img.shields.io/badge/Presented%20at-LatinR%202025-orange)

---

## 🧭 Descripción general

Este repositorio documenta el flujo completo de análisis y visualización de los datos generados durante el **III Simposio Nacional de Mujeres en Ciencia**, organizado por la **Organización para las Mujeres en la Ciencia para el Mundo en Desarrollo (OWSD Honduras)**.  

El análisis fue elaborado con **R 4.4.3** y **R Markdown 2.29**, aplicando principios de ciencia abierta, reproducibilidad y comunicación científica clara.  

🔗 Sitio oficial del evento:  
[https://owsd.net/news/iii-simposio-nacional-de-mujeres-en-ciencia-owsd-honduras-2025](https://owsd.net/news/iii-simposio-nacional-de-mujeres-en-ciencia-owsd-honduras-2025)

---

## 🧰 Estructura del repositorio

```
OWSD-III-Symposium/
├── data/       # Archivos de entrada (.xlsx) — datos crudos
├── scripts/    # Código fuente en R Markdown
│   └── Simposio.Rmd
├── output/     # Informe HTML y visualizaciones exportadas
│   ├── Simposio.html
│   └── figuras/
├── LICENSE     # Licencia Creative Commons
└── README.md

```
---

## 🚀 Reproducibilidad

Este análisis fue ejecutado en el siguiente entorno:

- 🧩 **R:** 4.4.3 (2025-02-28 ucrt)  
- 📦 **Paquetes principales:** `tidyverse`, `readxl`, `formattable`, `rlang`, `ggplot2`, `rmarkdown`  
- 💻 **Sistema operativo:** Windows 11 x64  

### ▶️ Para reproducir el análisis:

```r
# Instalar los paquetes necesarios
install.packages(c("tidyverse", "readxl", "formattable", "rlang", "ggplot2", "rmarkdown"))
```
---

## ▶️ Renderizar el informe

Para generar el informe HTML desde el archivo principal en R Markdown, ejecuta el siguiente comando en R o RStudio:

```r
rmarkdown::render("scripts/Simposio.Rmd")
```
---

## 🔍 Flujo de trabajo

El análisis sigue una estructura **reproducible y modular** en R Markdown, basada en principios de **ciencia abierta** y **transparencia metodológica**.

### 🧩 Etapas principales

1. **Carga y verificación de librerías.**  
   Se asegura que los paquetes necesarios estén instalados antes de continuar.

2. **Integración y limpieza de datos.**  
   - Homologación de nombres de columnas.  
   - Normalización de texto y creación de categorías derivadas.

3. **Clasificación OWSD.**  
   Agrupación de participantes por **cargo institucional** y **área de conocimiento**,  
   siguiendo las categorías científicas establecidas por OWSD Internacional.

4. **Análisis descriptivo y visualización.**  
   - Elaboración de gráficos reproducibles con **ggplot2**.  
   - Uso de la paleta de colores institucional (`owsd_colors`).

5. **Síntesis y reporte.**  
   Resultados comunicados en formato **HTML** mediante **R Markdown**,  
   con bloques explicativos y métricas resumidas.

---

## 📈 Resultados destacados

El **III Simposio Nacional de Mujeres en Ciencia – OWSD Honduras** logró una participación significativa y diversa, reflejando el creciente interés por fortalecer el papel de las mujeres en la ciencia en contextos como el hondureño.

🧮 **Total de participantes registrados**: más de **480** personas, combinando registros de la UNAH y OWSD Honduras.

🧑‍🎓 **Amplia representación estudiantil**, acompañada por investigadoras, docentes y profesionales de múltiples disciplinas.

🌎 **Participación nacional e internacional**, tanto presencial como virtual, con representación desde distintas regiones y universidades del país.

💬 **Evaluaciones positivas del evento**, destacando la organización, relevancia de los temas, y las oportunidades de networking científico.

Este nivel de participación demuestra el potencial transformador de espacios colaborativos y equitativos para impulsar el liderazgo científico de las mujeres en América Latina.

---

## 📜 Licencia

Este repositorio y su código se distribuyen bajo la licencia  
**Creative Commons Attribution 4.0 International (CC BY 4.0)**.

Puedes reutilizar el código total o parcialmente, siempre que cites la fuente y reconozcas a las autoras.

🔗 [Ver licencia completa CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)

---

## ✉️ Contacto

**Antonella Rivera**  
📩 [antonellarivera.p@gmail.com](mailto:antonellarivera.p@gmail.com)

En representación del equipo de autoras del proyecto:  
**Antonella Rivera**, **Larissa Acosta Salgado**, **Dariana Ávila-Velásquez**, **Karen Orellana**, **Liliana Núñez** y **Eleana Cano Sosa**.

---

> “OWSD Honduras promueve la visibilidad, colaboración y liderazgo de las mujeres científicas en el país,  
> impulsando la ciencia abierta y la participación equitativa en la investigación.” 🌎✨

> © 2025 Antonella Rivera *et al.* — Distribuido bajo licencia [Creative Commons CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
