SELECT * FROM netflix;

-- count number of movies and TV shows
SELECT 
	type,
	count(*) as total_content
FROM netflix
GROUP BY type;

--most common rating for movies and TV shows
SELECT 
	type,
	rating
FROM 
	(SELECT
		type,
		rating,
		COUNT(*),
		RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
	FROM netflix
	GROUP BY 1,2
	)
WHERE 
	ranking in (1,2,3);

--List all movies released in specific year(eg 2020)

SELECT 
	title,
	rating
FROM netflix
WHERE type = 'Movie' and release_year = 2020;

--Top 5 countries with most content on netflix

SELECT 
	UNNEST(STRING_TO_ARRAY(country, ',')) AS total_countries,	
	COUNT(show_id) as total_shows
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

--Identify the longest movie

SELECT 
	*
FROM netflix
WHERE type = 'Movie' AND duration = (SELECT MAX(duration) FROM netflix);

--Find content added in the last 5 year

SELECT 
	*
FROM netflix
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';

--Find all the movies and tv shows by director Rajiv Chilaka

SELECT 
	* 
FROM netflix 
WHERE director LIKE '%Rajiv Chilaka%'

--List all TV shows with more than 5 season

SELECT 
	* 
FROM netflix 
WHERE type = 'TV Show'
	  AND 
	  SPLIT_PART(duration,' ', 1)::numeric > 5

--Count the number of content items in each genre

SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre,
	COUNT(show_id)
FROM netflix
GROUP BY 1
	
--Find each year and average number of content release by india on netflix. 
--Return top 5 year with highest average content release.

SELECT 
	EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS year,
	COUNT(*) AS yearly_content,
	COUNT(*)::numeric/ (SELECT COUNT(*) FROM netflix WHERE country = 'India')::numeric * 100 AS average_content_per_year 
FROM netflix
GROUP BY 1
ORDER BY yearly_content DESC
LIMIT 5;

--List all movies that are documentary

SELECT 
	* 
FROM netflix
WHERE listed_in ILIKE ('%Documentaries%')

--Find all content without a director

SELECT * FROM netflix WHERE director IS NULL

--In how many movies salman khan appeared in last 10 years.
SELECT 
	count(*) as total_movies
FROM netflix 
WHERE casts ILIKE ('%salman khan%') 
	  AND 
	  release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10 

--Top 10 actors who have appeared in highest number of movies produced in india

SELECT title, casts, country FROM netflix WHERE country ILIKE '%India%'

SELECT 
	UNNEST(STRING_TO_ARRAY(casts, ',')) AS actors, 
	COUNT(*) AS total_content
FROM netflix
WHERE country ILIKE '%india%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Categorize content based on the keywords 'kill' and 'violence' in the description field. Label content containing these keywords as 'bad' and all other content as 'good'. Count how many content fall into each category. 


WITH new_table
AS
(
SELECT
	CASE WHEN 
		description ilike '%kill%' 
		OR
		description ilike '%violence%' THEN 'Bad_Content'
		ELSE 'Good_Content'
	END category
FROM netflix)
SELECT category,
	count(*) AS total_content
	FROM new_table
	GROUP BY 1
	ORDER BY 2 DESC