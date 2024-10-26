# Real-Estate-Investments

### Objetivo del Proyecto
Este proyecto tiene como objetivo desarrollar un sistema de scoring que permita clasificar ciudades francesas según su atractivo para la inversión en segundas viviendas considerando perfiles de riesgo alto, moderado y bajo.

### Contexto y Motivación
El proyecto se enmarca dentro de una casuística en la cual Prello necesita optimizar el despliegue de cazadores de propiedades, identificando las mejores zonas. Para ello, se cuenta con un conjunto de datos que presenta limitaciones, ya que no todas las ciudades tienen información completa. Parte de la motivación detrás del proyecto es aplicar y poner en práctica conocimientos de BigQuery, Python, análisis y visualización de datos para crear un sistema acorde al objetivo.

### Metodología

Para el desarrollo del sistema de puntuación se utilizan 6 ratios clave: growth population, salary price, price volatility, intensité tension immo (ITI), tourist attractiveness index (TAI) y housing demand index (HDI). Estos ratios cubren variables de demografía, precios de renta, disponibilidad de propiedades, infraestructura y ventas, asegurando la coherencia del modelo.

El análisis se organiza en tres dimensiones de propiedades (general, casas y apartamentos) y tres perfiles de riesgo (alto, moderado y bajo).

El proceso comienza con la exploración y limpieza de datos en Python utilizando librerías como pandas, numpy, matplotlib y seaborn. Dado que los datos están distribuidos en varios datasets, algunos como series de tiempo y otros sin fechas específicas, se asume que la última fecha disponible en cada tabla representa los datos más recientes para fines prácticos del análisis. De igual forma, en coherencia con el objetivo del caso se filtran las ciudades con una población mayor a 50,000 habitantes. El resultado final se guarda en el archivo CSV "modelo.csv", que luego se importa en BigQuery, donde se aplican transformaciones adicionales mediante consultas SQL.

"transformacion_variables.sql"
"transformacion_variables_log.sql"
"transformacion_variables_scaled.sql"
"transformacion_variables_score.sql"
"unificar_dimensiones.sql"
"agregar_varibles_geograficas.sql"
"tablas_dasboard.sql"

Finalmente, con las variables procesadas y el score calculado, se aplica un modelo de regresión utilizando Random Forest. Este modelo permite identificar las importancias de las variables en cada perfil de riesgo, empleando el score como variable dependiente y las variables procesadas como independientes. El proyecto dispone de la parte visual en Looker Studio y los datos estan disponibles en la carpeta "Data".

- Formula para el calculo de las variables
  
  - 1 Growth Population
    Este ratio mide el crecimiento poblacional en una localidad.
 
    Growth Population = (population_1 - population_0)/population_0
    
    - population_1: Población actual.
    - population_0: Población inicial.
      
  - 2 Salary Price
    El ratio de salary price indica la relación entre los salarios anuales y la renta mensual por una propiedad de tamaño medio.

    Salary Price = average_salary / (rental_med * median_size)

    - average_salary = Promedio de salario anual.
    - rental_med = mediana del precio de renta por m2 (según tipo: general, casa o apartamento).
    - median_size = Tamaño medio de la propiedad (según tipo: general, casa o apartamento).

  - 3 Price Volatility
    Este ratio mide la volatilidad de los precios de renta.

    Price Volatility = (rental_max - rental_min)/rental_med

    - rental_max: Renta máxima por m2 (según tipo: general, casa o apartamento).
    - rental_min: Renta mínima por m2 (según tipo: general, casa o apartamento).
    - rental_med: Renta mediana por m2 (según tipo: general, casa o apartamento).

  - 4 Intensité Tension Immo (ITI)
    El ITI mide la tensión inmobiliaria basada en la oferta de segundas viviendas y las viviendas vacantes.

    ITI = (nb_second_housing *(1-vacants_housing_rate))/nb_tot_housing

    - nb_second_housing:Número de segundas viviendas.
    - vacants_housing_rate:Tasa de viviendas vacantes.
    - nb_tot_housing: Número total de viviendas.

  - 5 Touristic Attractiveness Index (TAI)
    Este índice mide el atractivo turístico basado en la importancia de los establecimientos y sitios turísticos.

    TAI = Σ(importance_establishments) + Σ(importance_sites)

    - importance_establishments: Importancia de los establecimientos turísticos.
    - importance_sites: Importancia de los sitios turísticos.

  - 6 Housing Demand Index (HDI)
    El índice de demanda habitacional se calcula en función del volumen de ventas y el precio por metro cuadrado.
 
    HDI = (Total_amount * avg_price_m2)/number_sales
    
    - Total_amount: Volumen total de ventas.
    - avg_price_m2: Promedio del precio por m2(según tipo: general, casa o apartamento).
    - number_sales: Número de ventas.
    
- Ponderaciones de los perfiles de riesgo
   
  - Alto Riesgo
    
  La estrategia para inversores de alto riesgo se enfoca en maximizar oportunidades de alta volatilidad y retornos rápidos. Los factores clave son la volatilidad de precios (25%) y el Housing Demand Index (HDI) (20%), que ayudan a identificar mercados con fluctuaciones y alta demanda. El crecimiento poblacional (20%) y el ratio salario/alquiler (10%) son relevantes pero secundarios. La Intensité Tension Immo (10%) y el Índice de Atractivo Turístico (15%) también influyen, aunque tienen menor peso.

  - Riesgo Moderado
    
  Los inversores moderados buscan balance entre estabilidad y rentabilidad. El crecimiento poblacional (25%) y el ratio salario/alquiler (20%) son esenciales para asegurar demanda y sostenibilidad. La Intensité Tension Immo (15%) y el HDI (15%) apuntan a la apreciación del valor, mientras que la volatilidad de precios (15%) y el Índice de Atractivo Turístico (10%) ayudan a equilibrar riesgos y oportunidades.

  - Bajo Riesgo
    
  Para inversores conservadores, la estabilidad es prioritaria. El crecimiento poblacional (30%) y el ratio salario/alquiler (25%) son los pilares fundamentales. Factores como la volatilidad de precios (10%) y el HDI (10%) tienen menor relevancia, mientras que la Intensité Tension Immo (10%) y el Índice de Atractivo Turístico (5%) son los menos considerados, enfocándose en mercados estables y predecibles.

Resultados y Conclusiones

Se identificaron las principales ciudades francesas con mayor potencial de inversión inmobiliaria, destacando La Rochelle, Aix en Provence, y Annecy en los primeros lugares del ranking.

Para los inversores conservadores, las ciudades con mayor estabilidad poblacional y crecimiento moderado resultan ser las más atractivas, mientras que para perfiles más arriesgados, los mercados emergentes ofrecen oportunidades significativas.
