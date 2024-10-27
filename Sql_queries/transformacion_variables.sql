-- Dimensión all
-- name view: variables_all

SELECT *
FROM (
SELECT
  municipality_code,
  ROUND(population_growth,2) AS population_growth,
  ROUND(avg_net_salary/(rental_med_all*med_size_m2),2) AS price_rental,
  ROUND((rental_max_all-rental_min_all)/rental_med_all,2) AS price_volatility,
  ROUND(nb_second_home * (1-vacants_housing_rate)/nb_tot_housing,2) AS iti,
  ROUND(establishments_importance + sites_importance,2) AS tai,
  ROUND((total_amount * avg_price_m2)/n_sales,2) AS hdi
FROM
  `prello-project-434904.prello.modelo`
) AS subquery
WHERE iti > 0.01;

-- Dimensión house 
-- name view: variables_house

SELECT *
FROM (
  SELECT
    municipality_code,
    ROUND(population_growth, 2) AS population_growth,
    ROUND(avg_net_salary / (SAFE_DIVIDE((rental_max_house + rental_min_house), 2) * house_med_size_m2), 2) AS price_rental,
    ROUND((rental_max_house - rental_min_house) / SAFE_DIVIDE((rental_max_house + rental_min_house), 2), 2) AS price_volatility,
    ROUND(nb_second_home * (1 - vacants_housing_rate) / nb_tot_housing, 2) AS iti,
    ROUND(establishments_importance + sites_importance, 2) AS tai,
    ROUND((total_amount_house *house_avg_price_m2) / n_house, 2) AS hdi_house
  FROM
    `prello-project-434904.prello.modelo`
) AS subquery
WHERE iti > 0.01;

-- Dimensión apartment
-- name view: variables_apartment 

SELECT *
FROM (
  SELECT
    municipality_code,
    ROUND(population_growth, 2) AS population_growth,
    ROUND(avg_net_salary / (SAFE_DIVIDE((rental_max_apartment + rental_min_apartment), 2) * appartement_med_size_m2), 2) AS price_rental,
    ROUND((rental_max_apartment - rental_min_apartment) / SAFE_DIVIDE((rental_max_apartment + rental_min_apartment), 2), 2) AS price_volatility,
    ROUND(nb_second_home * (1 - vacants_housing_rate) / nb_tot_housing, 2) AS iti,
    ROUND(establishments_importance + sites_importance, 2) AS tai,
    ROUND((total_amount_appartement * appartement_avg_price_m2) / n_appartement, 2) AS hdi
  FROM
    `prello-project-434904.prello.modelo`
) AS subquery
WHERE iti > 0.01;