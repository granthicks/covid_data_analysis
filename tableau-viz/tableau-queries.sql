/*

Queries for Tableau

*/


-- 1.

SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths AS INT)) as total_deaths, SUM(cast(new_deaths AS INT))/SUM(new_cases)*100 AS death_percentage
FROM PortfolioProject..CovidDeaths
--WHERE location like '%states%'
WHERE continent IS NOT NULL
--GROUP BY date
ORDER BY 1,2


-- 2.
SELECT location, SUM(cast(new_deaths AS INT)) AS total_death_count
FROM PortfolioProject..CovidDeaths
--WHERE location like '%states%'
WHERE continent IS NULL
AND location NOT IN ('World', 'European Union', 'International')
AND location NOT LIKE '%income'
GROUP BY location
ORDER BY total_death_count DESC


-- 3.
SELECT location, population, MAX(total_cases) AS highest_infection_count, MAX((total_cases/population))*100 AS percent_population_infected
FROM PortfolioProject..CovidDeaths
--WHERE location like '%states%'
GROUP BY location, population
ORDER BY percent_population_infected DESC


-- 4.
SELECT location, population, date, MAX(total_cases) AS highest_infection_count, MAX((total_cases/population))*100 AS percent_population_infected
FROM PortfolioProject..CovidDeaths
--WHERE location like '%states%'
GROUP BY location, population, date
ORDER BY percent_population_infected DESC
