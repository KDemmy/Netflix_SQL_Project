-- -- NETFLIX PROJECT CASE Study Database Creation
-- DROP TABLE IF EXISTS netflix;
-- CREATE TABLE netflix
-- (
--     show_id      VARCHAR(5 ),
--     type         VARCHAR(10),
--     title        VARCHAR(250),
--     director     VARCHAR(550),
--     casts        VARCHAR(1050),
--     country      VARCHAR(550),
--     date_added   VARCHAR(55),
--     release_year INT,
--     rating       VARCHAR(15),
--     duration     VARCHAR(15),
--     listed_in    VARCHAR(250),
--     description  VARCHAR(550)
-- );
SELECT * FROM NETFLIX LIMIT 10;

-- q1
SELECT
	TYPE,
	COUNT(*)
FROM
	NETFLIX
GROUP BY
	TYPE;

-- 2. Find the Most Common Rating for Movies and TV Shows

WITH
	RATINGCOUNT AS (
		SELECT
			"type",
			RATING,
			COUNT(*) AS COUNTS
		FROM
			NETFLIX
		GROUP BY
			1,
			2
	),
	RATINGRAK AS (
		SELECT
			"type",
			RATING,
			COUNTS,
			RANK() OVER (
				PARTITION BY
					"type"
				ORDER BY
					COUNTS DESC
			)
		FROM
			RATINGCOUNT
	)
SELECT
	"type",
	RATING
FROM
	RATINGRAK
WHERE
	RANK = 1;

-- 3. List All Movies Released in a Specific Year (e.g., 2020)
SELECT * FROM NETFLIX where release_year =2020 and type= 'Movie';

-- 4. Find the Top 5 Countries with the Most Content on Netflix
SELECT
	unnest(STRING_TO_ARRAY(COUNTRY,',')) AS NEW_COUNTRY,
	COUNT(SHOW_ID) AS CONTENT_COUNT
FROM
	NETFLIX
GROUP BY
	1
ORDER BY
	CONTENT_COUNT DESC
LIMIT 5;	

-- 5. Identify the Longest Movie

SELECT
	*
FROM
	NETFLIX
WHERE
	"type" = 'Movie'
	AND DURATION IS NOT NULL
ORDER BY
	SPLIT_PART(DURATION, ' ', 1)::INT DESC
LIMIT
	1;

-- 6. Find Content Added in the Last 5 Years
WITH
	YEAR_ADDED_ AS (
		SELECT
			SHOW_ID,
			SPLIT_PART(DATE_ADDED, ',', 2)::INT AS YEAR_ADDED
		FROM
			NETFLIX
	)
SELECT
	*
FROM
	NETFLIX N
	JOIN YEAR_ADDED_ Y USING (SHOW_ID)
WHERE
	Y.YEAR_ADDED > (
		SELECT
			MAX(YEAR_ADDED) AS LAST_YEARR
		FROM
			YEAR_ADDED_) -5;
			
-- Second Method
SELECT *
FROM netflix
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';

-- 7. Find All Movies/TV Shows by Director 'Rajiv Chilaka'
SELECT * from 
	(select *, unnest(STRING_TO_ARRAY(director,',')) as director_name from netflix) 
	where director_name = 'Rajiv Chilaka';

-- 8. List All TV Shows with More Than 5 Seasons
SELECT
	*
FROM
	(Select *, SPLIT_PART(DURATION, ' ', 1)::INT as season_count from
	NETFLIX)
WHERE
	"type" = 'TV Show'
	AND DURATION IS NOT NULL
	and season_count >5;
-- Second Option 
SELECT
	*
FROM
	NETFLIX
WHERE
	"type" = 'TV Show'
	AND DURATION IS NOT NULL
	and SPLIT_PART(DURATION, ' ', 1)::INT >5;

-- 9. Count the Number of Content Items in Each Genre
SELECT unnest(string_to_array(listed_in,',')) as Genre , Count(*) FROM Netflix group BY 1 order by 2 desc;

-- 10.Find each year and the average numbers of content release in India on netflix.
SELECT 
    country,
    release_year,
    COUNT(show_id) AS total_release,
    ROUND(
        COUNT(show_id)::numeric /
        (SELECT COUNT(show_id) FROM netflix WHERE country = 'India')::numeric * 100, 2
    ) AS avg_release
FROM netflix
WHERE country = 'India'
GROUP BY country, release_year
ORDER BY avg_release DESC
LIMIT 5;


-- 11. List All Movies that are Documentaries
SELECT * from netflix where type = 'Movie' and listed_in like	'%Documentaries%'

-- 12. Find All Content Without a Director

Select * from netflix where director is null;

-- 13. Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years

SELECT * from netflix where type = 'Movie' and casts like '%Salman Khan%' 
	and release_year > (select max(release_year) from netflix)-10;

-- 14. Find the Top 10 Actors Who Have Appeared in the Highest Number of Movies Produced in India
SELECT
	unnest(string_to_array(casts,',')) as actor_name,
	count(*)
	from Netflix where type = 'Movie' and country like '%India%'
	group By 1
	order By 2 Desc
	Limit 10;

-- 15. Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords
SELECT category, Count(*)
FROM (	Select *,
	case
	when description ilike '%Kill%' or description ilike '%Violence%' THEN 'BAD'
	ELSE 'Good'
	end as Category
	from netflix)
	group BY 1;

