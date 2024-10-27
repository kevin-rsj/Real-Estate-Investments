-- name view: score_geo

SELECT
    s.*,
    g.latitude,
    g.longitude,
    INITCAP(g.city_name_normalized) AS city_name_normalized,
    INITCAP(g.department_name) AS department_name
FROM
  `prello-project-434904.prello.score` s
LEFT JOIN `prello-project-434904.prello.geographical_referential` g
ON s.municipality_code = g.municipality_code