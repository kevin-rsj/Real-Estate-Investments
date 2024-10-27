--name view: score

SELECT  
  *
FROM `prello-project-434904.prello.score_all` 

UNION ALL

SELECT  
  *
FROM `prello-project-434904.prello.score_house`

UNION ALL

SELECT  
  *
FROM `prello-project-434904.prello.score_apartment`

