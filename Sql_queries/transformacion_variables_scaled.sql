-- dimensión all
-- name view: variables_all_scaled

WITH stats AS (
  SELECT
    MIN(population_growth) AS min_pop,
    MAX(population_growth) AS max_pop,
    MIN(price_rental) AS min_rental,
    MAX(price_rental) AS max_rental,
    MIN(price_volatility) AS min_price,
    MAX(price_volatility) AS max_price,
    MIN(iti_log) AS min_iti,
    MAX(iti_log) AS max_iti,
    MIN(tai_log) AS min_tai,
    MAX(tai_log) AS max_tai,
    MIN(hdi_log) AS min_hdi,
    MAX(hdi_log) AS max_hdi
  FROM
    `prello-project-434904.prello.variables_all_log`
),
scaled_data AS (
  SELECT
    municipality_code,
    (population_growth - stats.min_pop) / (stats.max_pop - stats.min_pop) AS pop_scaler,
    (price_rental - stats.min_rental) / (stats.max_rental - stats.min_rental) AS rental_scaler,
    (price_volatility - stats.min_price) / (stats.max_price - stats.min_price) AS price_scaler,
    (iti_log - stats.min_iti) / (stats.max_iti - stats.min_iti) AS iti_scaler,
    (tai_log - stats.min_tai) / (stats.max_tai - stats.min_tai) AS tai_scaler,
    (hdi_log - stats.min_hdi) / (stats.max_hdi - stats.min_hdi) AS hdi_scaler
  FROM
    `prello-project-434904.prello.variables_all_log`,
    stats
)
SELECT * FROM scaled_data;

-- Dimensión house 
-- name view: variables_house_scaled

WITH stats AS (
  SELECT
    MIN(population_growth) AS min_pop,
    MAX(population_growth) AS max_pop,
    MIN(price_rental) AS min_rental,
    MAX(price_rental) AS max_rental,
    MIN(price_volatility) AS min_price,
    MAX(price_volatility) AS max_price,
    MIN(iti_log) AS min_iti,
    MAX(iti_log) AS max_iti,
    MIN(tai_log) AS min_tai,
    MAX(tai_log) AS max_tai,
    MIN(hdi_log) AS min_hdi,
    MAX(hdi_log) AS max_hdi
  FROM
    `prello-project-434904.prello.variables_log_houses`
),
scaled_data AS (
  SELECT
    municipality_code,
    (population_growth - stats.min_pop) / (stats.max_pop - stats.min_pop) AS pop_scaler,
    (price_rental - stats.min_rental) / (stats.max_rental - stats.min_rental) AS rental_scaler,
    (price_volatility - stats.min_price) / (stats.max_price - stats.min_price) AS price_scaler,
    (iti_log - stats.min_iti) / (stats.max_iti - stats.min_iti) AS iti_scaler,
    (tai_log - stats.min_tai) / (stats.max_tai - stats.min_tai) AS tai_scaler,
    (hdi_log - stats.min_hdi) / (stats.max_hdi - stats.min_hdi) AS hdi_scaler
  FROM
    `prello-project-434904.prello.variables_log_houses`,
    stats
)
SELECT * FROM scaled_data;

--Dimensión apartment
-- name view: variables_apartment_scaled

WITH stats AS (
  SELECT
    MIN(population_growth) AS min_pop,
    MAX(population_growth) AS max_pop,
    MIN(price_rental) AS min_rental,
    MAX(price_rental) AS max_rental,
    MIN(price_volatility) AS min_price,
    MAX(price_volatility) AS max_price,
    MIN(iti_log) AS min_iti,
    MAX(iti_log) AS max_iti,
    MIN(tai_log) AS min_tai,
    MAX(tai_log) AS max_tai,
    MIN(hdi_log) AS min_hdi,
    MAX(hdi_log) AS max_hdi
  FROM
    `prello-project-434904.prello.variables_log_apartment`
),
scaled_data AS (
  SELECT
    municipality_code,
    (population_growth - stats.min_pop) / (stats.max_pop - stats.min_pop) AS pop_scaler,
    (price_rental - stats.min_rental) / (stats.max_rental - stats.min_rental) AS rental_scaler,
    (price_volatility - stats.min_price) / (stats.max_price - stats.min_price) AS price_scaler,
    (iti_log - stats.min_iti) / (stats.max_iti - stats.min_iti) AS iti_scaler,
    (tai_log - stats.min_tai) / (stats.max_tai - stats.min_tai) AS tai_scaler,
    (hdi_log - stats.min_hdi) / (stats.max_hdi - stats.min_hdi) AS hdi_scaler
  FROM
    `prello-project-434904.prello.variables_log_apartment`,
    stats
)
SELECT * FROM scaled_data;