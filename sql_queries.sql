SELECT DISTINCT year
FROM `plucky-respect-467323-d9.honey_production.honey_production`
WHERE year NOT BETWEEN 1998 AND 2012
ORDER BY year;


SELECT state
FROM `plucky-respect-467323-d9.honey_production.honey_production`
WHERE LENGTH(state) != 2;


SELECT *
FROM `plucky-respect-467323-d9.honey_production.honey_production`
WHERE numcol IS NULL
OR yieldpercol IS NULL
OR totalprod IS NULL
OR stocks IS NULL
OR priceperlb IS NULL
OR prodvalue IS NULL;


SELECT *, (numcol * yieldpercol) AS expected_total_production, (totalprod - (numcol * yieldpercol)) AS difference
FROM `plucky-respect-467323-d9.honey_production.honey_production`
WHERE totalprod != (numcol * yieldpercol);


SELECT *
FROM `plucky-respect-467323-d9.honey_production.honey_production`
WHERE numcol < 0
OR yieldpercol < 0
OR totalprod < 0
OR stocks < 0
OR priceperlb < 0
OR priceperlb > 10
OR prodvalue < 0;


SELECT state, year, COUNT(*) AS record_count
FROM `plucky-respect-467323-d9.honey_production.honey_production`
GROUP BY state, year
HAVING COUNT(*) > 1;
