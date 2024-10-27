-- name view: score_map

SELECT 
  municipality_code,
  high_investor as score,
  'High' as investor,
  INITCAP(type) AS type,
  latitude,
  longitude,
  INITCAP(city_name_normalized) AS city_name_normalized,
  INITCAP(department_name) AS department_name,
  growth_population,
  salary_rent_ratio,
  price_volatility,
  real_estate_tension,
  touristic_attractiveness_index,
  housing_demand_index 
FROM `prello-project-434904.prello.score_geo` 

UNION ALL

SELECT 
  municipality_code,
  moderate_investor as score,
  'Moderate' as investor,
  INITCAP(type) AS type,
  latitude,
  longitude,
  INITCAP(city_name_normalized) AS city_name_normalized,
  INITCAP(department_name) AS department_name,
  growth_population,
  salary_rent_ratio,
  price_volatility,
  real_estate_tension,
  touristic_attractiveness_index,
  housing_demand_index 
FROM `prello-project-434904.prello.score_geo` 

UNION ALL

SELECT 
  municipality_code,
  low_investor as score,
  'Low' as investor,
  INITCAP(type) AS type,
  latitude,
  longitude,
  INITCAP(city_name_normalized) AS city_name_normalized,
  INITCAP(department_name) AS department_name,
  growth_population,
  salary_rent_ratio,
  price_volatility,
  real_estate_tension,
  touristic_attractiveness_index,
  housing_demand_index 
FROM `prello-project-434904.prello.score_geo` 

-- name view: dimesion_sales

WITH m AS(
  SELECT
    k.municipality_code,  
    PARSE_DATE('%Y-%m-%d', s.sales_date) AS date_date,
    s.sales_amount,
    INITCAP(s.premise_type) AS premise_type,
    s.number_of_principal_rooms,
    s.sales_price_m2    
  FROM `prello-project-434904.prello.notary_real_estate_sales` s
  RIGHT JOIN `prello-project-434904.prello.score_all` k
  ON s.municipality_code = k.municipality_code
  )
SELECT
  m.*,
  INITCAP(g.city_name_normalized) AS city_name_normalized,
  INITCAP(g.department_name) AS department_name
FROM m
LEFT JOIN `prello-project-434904.prello.geographical_referential` g
ON m.municipality_code = g.municipality_code
WHERE m.date_date >= '2021-01-01'

-- name view: dimension_touristic

WITH t AS (
  SELECT
    e.*,
    'establishments' AS type
  FROM
    `prello-project-434904.prello.POI_tourist_establishments` e

  UNION ALL 

  SELECT
    s.*,
    'sites' AS type
  FROM
    `prello-project-434904.prello.sites` s
),
 l AS(
  SELECT
    t.poi,
    t.name,
    t.importance,
    t.type,
    k.municipality_code
  FROM t
  RIGHT JOIN `prello-project-434904.prello.score_all` k
  ON t.municipality_code = k.municipality_code
  ORDER BY t.municipality_code
),
g AS (
  SELECT
    l.municipality_code,
    INITCAP(l.poi) AS poi,
    l.name,
    l.importance,
    INITCAP(l.type) AS type
  FROM l
)
SELECT
  g.*,
  INITCAP(a.city_name_normalized) AS city_name_normalized,
  INITCAP(a.department_name) AS department_name
FROM g
LEFT JOIN `prello-project-434904.prello.geographical_referential` a
ON g.municipality_code = a.municipality_code


-- name view: modelo_city

WITH z AS(
  SELECT
    s.municipality_code,
    m.appartement_avg_price_m2,
    m.appartement_med_size_m2,
    m.avg_net_salary,
    m.avg_price_m2,
    m.establishments_importance,
    m.house_avg_price_m2,
    m.house_med_size_m2,
    m.med_size_m2,
    m.n_appartement,
    m.n_house,
    m.n_sales,
    m.nb_second_home,
    m.nb_tot_housing,
    m.nb_vacants_housing,
    m.population,
    m.population_growth,
    m.total_amount,
    m.total_amount_appartement,
    m.total_amount_house,
  FROM
    `prello-project-434904.prello.score_all` s
  LEFT JOIN
    `prello-project-434904.prello.modelo` m
  ON s.municipality_code = m.municipality_code
)
SELECT
  z.*,
  INITCAP(g.city_name_normalized) AS city_name_normalized,
  INITCAP(g.department_name) AS department_name,
  g.latitude,
  g.longitude 
FROM z
LEFT JOIN
  `prello-project-434904.prello.geographical_referential` g
ON  z.municipality_code = g.municipality_code

-- name view: importences_df

SELECT
  variable,
  ROUND(high,2) AS importence,
  INITCAP(type) AS type,
  'High' AS investor  
FROM `prello-project-434904.prello.importences_rf` 

UNION ALL

SELECT
  variable,
  ROUND(moderate,2) AS importence,
  INITCAP(type) AS type,
  'Moderate' AS investor  
FROM `prello-project-434904.prello.importences_rf`

UNION ALL

SELECT
  variable,
  ROUND(low,2) AS importence,
  INITCAP(type) AS type,
  'Low' AS investor  
FROM `prello-project-434904.prello.importences_rf`