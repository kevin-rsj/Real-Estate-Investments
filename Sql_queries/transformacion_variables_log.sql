-- Dimensión all
-- name view: variables_all_log

SELECT
  municipality_code,
  population_growth,
  price_rental,
  price_volatility,
  log(tai) AS tai_log,
  log(hdi) AS hdi_log,
  log(iti) AS iti_log
FROM
  `prello-project-434904.prello.variables_all`

-- Dimensión house 
-- name view: variables_house_log

SELECT
  municipality_code,
  population_growth,
  price_rental,
  price_volatility_house AS price_volatility,
  log(tai) AS `tai_log`,
  log(hdi_house) AS `hdi_log`,
  log(iti) AS `iti_log`,
FROM `prello.variables_house`

-- Dimensión apartment 
-- name view: variables_apartment_log

SELECT
  municipality_code,
  population_growth,
  price_rental,
  price_volatility,
  log(tai) AS tai_log,
  log(hdi) AS hdi_log,
  log(iti) AS iti_log
FROM
`prello-project-434904.prello.variables_apartment`
