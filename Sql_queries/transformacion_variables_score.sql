-- Dimensión all 
-- name view: prello.score_all

SELECT
    municipality_code,
    ROUND(pop_scaler,2) AS growth_population,
    ROUND(rental_scaler,2) AS salary_rent_ratio,
    ROUND(price_scaler,2) AS price_volatility,
    ROUND(iti_scaler,2) AS real_estate_tension,
    ROUND(tai_scaler,2) AS touristic_attractiveness_index,
    ROUND(hdi_scaler,2) AS housing_demand_index,
    ROUND((pop_scaler*0.2)+ (rental_scaler*0.1)+(price_scaler*0.25)+(iti_scaler*0.1)+(tai_scaler*0.15)+(hdi_scaler*0.2),2) AS high_investor,
    ROUND((pop_scaler*0.25)+ (rental_scaler*0.2)+(price_scaler*0.15)+(iti_scaler*0.1)+(tai_scaler*0.1)+(hdi_scaler*0.2),2) AS moderate_investor,
    ROUND((pop_scaler*0.3)+ (rental_scaler*0.25)+(price_scaler*0.1)+(iti_scaler*0.1)+(tai_scaler*0.1)+(hdi_scaler*0.15),2) AS low_investor,
    'all' AS type
FROM
  `prello-project-434904.prello.variables_all_scaled`

-- Dimensión house 
-- name view: prello.score_house

SELECT 
    municipality_code,
    ROUND(pop_scaler,2) AS growth_population,
    ROUND(rental_scaler,2) AS salary_rent_ratio,
    ROUND(price_scaler,2) AS price_volatility,
    ROUND(iti_scaler,2) AS real_estate_tension,
    ROUND(tai_scaler,2) AS touristic_attractiveness_index,
    ROUND(hdi_scaler,2) AS housing_demand_index,
    ROUND((pop_scaler * 0.2) + (rental_scaler * 0.10) + (price_scaler * 0.25) + (iti_scaler * 0.10) + (tai_scaler * 0.15) + (hdi_scaler * 0.2), 2) AS high_investor,
    ROUND((pop_scaler * 0.25) + (rental_scaler * 0.2) + (price_scaler * 0.15) + (iti_scaler * 0.10) + (tai_scaler * 0.10) + (hdi_scaler * 0.2), 2) AS moderate_investor,
    ROUND((pop_scaler * 0.30) + (rental_scaler * 0.25) + (price_scaler * 0.10) + (iti_scaler * 0.10) + (tai_scaler * 0.10) + (hdi_scaler * 0.15), 2) AS low_investor,
    "house" AS type,
FROM `prello.variables-variables_house_scaled`

-- Dimensión apartment
-- name view: prello.score_apartment

SELECT 
    municipality_code,
    ROUND(pop_scaler,2) AS growth_population,
    ROUND(rental_scaler,2) AS salary_rent_ratio,
    ROUND(price_scaler,2) AS price_volatility,
    ROUND(iti_scaler,2) AS real_estate_tension,
    ROUND(tai_scaler,2) AS touristic_attractiveness_index,
    ROUND(hdi_scaler,2) AS housing_demand_index,
    ROUND((posarle * 0.2) + (rental_scaler * 0.10) + (price_scaler * 0.25) + (iti_scaler * 0.10) + (tai_scaler * 0.15) + (hdi_scaler * 0.2), 2) AS high_investor,
    ROUND((pop_scaler * 0.25) + (rental_scaler * 0.2) + (price_scaler * 0.15) + (iti_scaler * 0.10) + (tai_scaler * 0.10) + (hdi_scaler * 0.2), 2) AS moderate_investor,
    ROUND((pop_scaler * 0.30) + (rental_scaler * 0.25) + (price_scaler * 0.10) + (iti_scaler * 0.10) + (tai_scaler * 0.10) + (hdi_scaler * 0.15), 2) AS low_investor,
    "apartment" AS type,
FROM 
  `prello-project-434904.prello.variables_apartment_scaled`;
