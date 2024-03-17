-- Count the number of records in the people table
SELECT COUNT(*) AS count_records FROM people;

-- Return the unique countries from the films table
SELECT DISTINCT country FROM films;

-- Debug this code
SELECT certification
FROM films
LIMIT 5;

-- Rewrite this query
SELECT person_id, role
FROM roles
LIMIT 10;

-- Select film_ids and imdb_score with an imdb_score over 7.0
SELECT film_id, imdb_score FROM reviews where imdb_score > 7;

-- Count the Spanish-language films
select count(language) as count_spanish from films where language = 'Spanish';

-- Select the title and release_year for all German-language films released before 2000
select title , release_year from films where language = 'German' and release_year<2000

-- Find the title and year of films from the 1990 or 1999
select title , release_year from films where release_year = 1990 or release_year = 1999

-- Select the title and release_year for films released between 1990 and 2000
select title , release_year from films where release_year between 1990 and 2000

-- Select the names that start with B
select name from people where name like 'B%';

-- Find the title and release_year for all films over two hours in length released in 1990 and 2000
select title, release_year from films where duration > 120 and (release_year = 1990 or release_year = 2000)

-- Count the unique titles
SELECT count(distinct title) AS nineties_english_films_for_teens
FROM films
-- Filter to release_years to between 1990 and 1999
WHERE release_year between 1990 and 1999
-- Filter to English-language films
and	language = 'English'
-- Narrow it down to G, PG, and PG-13 certifications
and certification in ('G','PG','PG-13' );

-- List all film titles with missing budgets
select title as no_budget_info from films where budget is null

-- Query the sum of film durations
select sum(duration) as total_duration from films

-- Calculate the sum of gross from the year 2000 or later
select sum(gross) as total_gross from films where release_year >=2000

-- Round the average number of facebook_likes to one decimal place
select Round(avg(facebook_likes),1) as  avg_facebook_likes from reviews 

-- Calculate the average budget rounded to the thousands
select round(avg(budget),-3) as avg_budget_thousands from films 

-- Calculate the title and duration_hours from films
SELECT title, duration/60.0 as duration_hours 
FROM films;

-- Round duration_hours to two decimal places
SELECT title , round(duration / 60.0,2) AS duration_hours
FROM films;

-- Select name from people and sort alphabetically
select name
 from people 
 order by name

-- Select the release year, duration, and title sorted by release year and duration
select release_year,duration,title 
from films
order by release_year,duration

-- Find the release_year and film_count of each year
select release_year,count(title) as film_count 
from films 
group by release_year

-- Find the release_year, country, and max_budget, then group and order by release_year and country
select release_year,country,max(budget) as max_budget
from films
group by release_year,country
order by release_year,country

-- Select the country and distinct count of certification as certification_count
Select country , count(distinct certification) certification_count 
from films 
group by country
having  count(distinct certification)  >10
-- Group by country
--___
-- Filter results to countries with more than 10 different certifications
--___

  
-- Select the country and average_budget from films
select country , avg(budget) as average_budget from films
-- Group by country
Group by country
-- Filter to countries with an average_budget of more than one billion
having avg(budget) >1000000000
-- Order by descending order of the aggregated budget
order by average_budget

-- Select the release_year for films released after 1990 grouped by year
Select release_year
 from films 
 where release_year>1990
  group by release_year

