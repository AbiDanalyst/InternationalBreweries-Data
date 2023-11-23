Select *
from dbo.[International-Breweries]

select distinct [REGION ]
from dbo.[International-Breweries]

select sum(cast(profit as int)) as Profit_worth
from dbo.[International-Breweries]

select sum(cast(profit as int)) as Profit_worth,
            CASE 
			WHEN COUNTRIES='Ghana' THEN 'Anglophone'
			WHEN COUNTRIES='Nigeria' THEN 'Anglophone'
			ELSE 'Francophone'
			END AS TERRITORY
from dbo.[International-Breweries]
GROUP BY COUNTRIES

SELECT TOP 1 COUNTRIES,sum(cast(profit as int)) AS HIGHEST_PROFIT
FROM DBO.[International-Breweries]
WHERE YEARS = '2019'
GROUP BY COUNTRIES
ORDER BY  HIGHEST_PROFIT DESC

SELECT TOP 1 YEARS, sum(cast(profit as int)) AS HIGHEST_PROFIT
FROM DBO.[International-Breweries]
GROUP BY YEARS
ORDER BY HIGHEST_PROFIT desc

SELECT TOP 1 MONTHS, sum(cast(profit as int)) AS LOWEST_PROFIT, YEARS
FROM DBO.[International-Breweries]
GROUP BY MONTHS, YEARS
ORDER BY LOWEST_PROFIT ASC

SELECT MONTHS, YEARS, MIN(PROFIT) AS LOWEST_PROFIT
FROM DBO.[International-Breweries]
WHERE YEARS = '2018' AND MONTHS = 'December'
GROUP BY MONTHS, YEARS
ORDER BY MIN(PROFIT) ASC

SELECT DISTINCT MONTHS, sum(cast(profit as int)) as Profit_worth
FROM DBO.[International-Breweries]
WHERE YEARS = '2019'
GROUP BY MONTHS
ORDER BY MONTHS ASC, Profit_worth DESC

SELECT top 1 BRANDS,  sum(cast(profit as int)) as Profit_worth, COUNTRIES
FROM DBO.[International-Breweries]
WHERE COUNTRIES = 'Senegal'
GROUP BY BRANDS, COUNTRIES
ORDER BY Profit_worth desc

SELECT top 3 BRANDS,  sum(cast(profit as int)) as FrancophonesMostConsumed_Brands, COUNTRIES
FROM DBO.[International-Breweries]
WHERE COUNTRIES IN ('Senegal','Togo','Benin') 
GROUP BY BRANDS, COUNTRIES
ORDER BY FrancophonesMostConsumed_Brands desc

SELECT top 2 BRANDS,  sum(cast(profit as int)) as TopChoice_Brands, COUNTRIES
FROM DBO.[International-Breweries]
WHERE COUNTRIES = 'Ghana' 
GROUP BY BRANDS, COUNTRIES
ORDER BY TopChoice_Brands desc

SELECT *
FROM dbo.[International-Breweries]
WHERE COUNTRIES = 'Nigeria'
ORDER BY PROFIT DESC

SELECT COUNT(BRANDS) AS FAVOURITE_BRANDS, BRANDS, COUNTRIES, YEARS, sum(cast(profit as int)) as PROFITS_GENERATED
FROM DBO.[International-Breweries]
WHERE COUNTRIES IN ('Ghana','Nigeria') AND BRANDS LIKE '%malt%' AND YEARS IN ('2018', '2019')
GROUP BY BRANDS, COUNTRIES, YEARS
ORDER BY 1 desc, 4 DESC

SELECT TOP 5 BRANDS,sum(cast(profit as int)) AS HIGHEST_PROFIT, YEARS
FROM dbo.[International-Breweries]
WHERE COUNTRIES = 'Nigeria' AND YEARS = '2019'
GROUP BY BRANDS, YEARS
ORDER BY HIGHEST_PROFIT DESC

SELECT BRANDS, COUNT(BRANDS) AS FAVOURITE_BRANDS,sum(cast(profit as int)) AS HIGHEST_PROFIT,[REGION ]
FROM dbo.[International-Breweries]
WHERE COUNTRIES = 'Nigeria' AND [REGION ] = 'southsouth'
GROUP BY BRANDS, [REGION ]
ORDER BY HIGHEST_PROFIT DESC, FAVOURITE_BRANDS desc

SELECT BRANDS, SUM(QUANTITY) AS BEER_CONSUMPTION
FROM dbo.[International-Breweries]
WHERE BRANDS IN ('trophy','budweiser', 'hero')
GROUP BY BRANDS
ORDER BY BEER_CONSUMPTION DESC--, BRANDS desc