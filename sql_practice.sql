-- 1.
-- The example uses a WHERE clause to show the population of 'France'. Note that strings (pieces of text that are data) should be in 'single quotes';

-- Modify it to show the population of Germany

SELECT population FROM world
  WHERE name = 'Germany'

-- 2.
-- Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.

-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark' );

-- 3.
-- Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values).
--  The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries
--   with an area between 200,000 and 250,000.

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000



-- 1.
-- Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries.

SELECT name, continent, population FROM world


-- 2.
-- How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.


SELECT name FROM world
WHERE population >= 200000000

-- 3.
-- Give the name and the per capita GDP for those countries with a population of at least 200 million.

-- HELP:How to calculate per capita GDP

select name, GDP/population 
FROM world
WHERE population >= 200000000

-- 4.
-- Show the name and population in millions for the countries of the continent 'South America'. 
-- Divide the population by 1000000 to get population in millions.

SELECT name, population/1000000
FROM world 
WHERE continent= 'South America'

-- 5.
-- Show the name and population for France, Germany, Italy


select name, population
from world
where name in ('France', 'Germany', 'Italy')

-- 6.
-- Show the countries which have a name that includes the word 'United'

select name
from world
where name LIKE '%United%'


-- 7.
-- Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

-- Show the countries that are big by area or big by population. Show name, population and area.

select name, population, area
from world
where area > 3000000 or population > 250000000

-- 8.
-- Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

-- Australia has a big area but a small population, it should be included.
-- Indonesia has a big population but a small area, it should be included.
-- China has a big population and big area, it should be excluded.
-- United Kingdom has a small population and a small area, it should be excluded.

select name, population, area
from world
where area > 3000000 xor population > 250000000


-- 9.
-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

-- For South America show population in millions and GDP in billions both to 2 decimal places.

select name, ROUND(population/1000000,2),
       ROUND(GDP/1000000000, 2)
from world
where continent = 'South America'



-- 10.
-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.

-- Show per-capita GDP for the trillion dollar countries to the nearest $1000.

select name, ROUND(GDP/population/1000)*1000 
FROM world
WHERE GDP >= 1000000000000


-- 11.
-- Greece has capital Athens.

-- Each of the strings 'Greece', and 'Athens' has 6 characters.

-- Show the name and capital where the name and the capital have the same number of characters.

-- You can use the LENGTH function to find the number of characters in a string

SELECT name, capital
  FROM world
 WHERE  LENGTH(name) = LENGTH(capital)


--  12.
-- The capital of Sweden is Stockholm. Both words start with the letter 'S'.

-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
-- You can use the function LEFT to isolate the first character.
-- You can use <> as the NOT EQUALS operator.

SELECT name, capital
FROM world
where LEFT(name,1) = LEFT(capital,1)
AND name <> capital


-- 13.
-- Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.

-- Find the country that has all the vowels and no spaces in its name.

-- You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
-- The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'


SELECT name
   FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %'


--   1.
-- Change the query shown so that it displays Nobel prizes for 1950.


SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950


--  2.
-- Show who won the 1962 prize for Literature.

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

--  3.
-- Show the year and subject that won 'Albert Einstein' his prize.

select yr, subject 
from nobel
where winner='Albert Einstein'


-- 4.
-- Give the name of the 'Peace' winners since the year 2000, including 2000.

select winner
from nobel
where subject='Peace' and yr>=2000


-- 5.
-- Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.


select yr, subject, winner
from nobel
where subject='Literature' 
   and yr>=1980 and yr<=1989


-- 6.
-- Show all details of the presidential winners:

-- Theodore Roosevelt
-- Woodrow Wilson
-- Jimmy Carter
-- Barack Obama

SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter','Barack Obama')


-- 7.
-- Show the winners with first name John

select winner
from nobel
where winner like 'John%'



-- 8.
-- Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.


select yr, subject, winner
from nobel
where (yr=1980 and subject='Physics')
   OR (yr=1984 and subject='Chemistry')


-- 9.
-- Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine

select yr, subject, winner
from nobel
where yr=1980 
 and (subject <> 'Chemistry' and subject <> 'Medicine')


--  10.
-- Show year, subject, and name of people who won a 'Medicine' prize in an early year 
-- (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

select yr, subject, winner
from nobel
where (subject='Medicine' and yr <1910)
   OR (subject='Literature' and yr >=2004)


-- 11.
-- Find all details of the prize won by PETER GRÜNBERG

-- Non-ASCII characters


select *
from nobel
where winner='PETER GRÜNBERG'



-- 12.
-- Find all details of the prize won by EUGENE O'NEILL

-- Escaping single quotes


select *
from nobel
where winner='EUGENE O\'NEILL'




-- 13.
-- Knights in order

-- List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.


select winner, yr, subject
from nobel
  where winner like 'Sir%'
  order by yr DESC, winner



-- 14.
-- The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.
-- Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject, winner


--  1.
-- List each country name where the population is larger than that of 'Russia'.

-- world(name, continent, area, population, gdp)

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')


-- 2.
-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

select name
from world
where continent='Europe'
  and GDP/population > (select GDP/population
                         from world
                         where name = 'United Kingdom')


-- 3.

-- List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

select name, continent
from world 
 where continent in (select continent
                     from world
                      where name='Argentina' or name='Australia' )
  order by name


-- 4.
-- Which country has a population that is more than Canada but less than Poland? Show the name and the population.


select name, population from world
 where population > (select population from
                        world where name='Canada')
     and population < (select population from
                        world where name= 'Poland')


5.
Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

The format should be Name, Percentage for example:

name	percentage
Albania	3%
Andorra	0%
Austria	11%
...	...


select name, concat ( Round(population/(select population
                          from world where name='Germany')*100,0),'%')
from world
  where continent='Europe'



-- 6.
-- Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

select name 
 from world
  where GDP > (select max(GDP) from world where continent='Europe')



-- 7.
-- Find the largest country (by area) in each continent, show the continent, the name and the area:

SELECT continent, name, area
 from world x
  WHERE area>= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent)


-- 8.
-- List each continent and the name of the country that comes first alphabetically.

select continent, min(name) from world
      group by continent


-- 9.
-- Find the continents where all countries have a population <= 25000000. 
-- Then find the names of the countries associated with these continents. Show name, continent and population.

select name, continent, population 
 from world
  where continent IN (select distinct continent
 from world
 where continent NOT IN (select distinct continent from world
    where population > 25000000))



--  10.
-- Some countries have populations more than three times that of any 
-- of their neighbours (in the same continent). Give the countries and continents.

SELECT continent, name
 from world x
  WHERE population >= ALL
    (SELECT population*3 as pop3 FROM world y
        WHERE y.continent=x.continent)


