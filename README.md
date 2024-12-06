# Netflix Data Analysis Using SQL

This project focuses on analyzing Netflix data using SQL to answer 15 intriguing questions about content trends, ratings, contributors, and categorization. The goal is to extract meaningful insights from the dataset and showcase the power of SQL in data analysis.

## About the Dataset
The dataset contains information about Netflix content, including:
- **Content type**: Movies or TV Shows
- **Title, Genre, and Description**
- **Directors and Cast**
- **Country of origin**
- **Release year and date added**
- **Ratings and durations**

You can download the dataset [here](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download).

## Analysis Overview
We analyzed the Netflix dataset by answering 15 specific questions, each highlighting a unique aspect of the content. The queries leverage various SQL techniques, including aggregations, filtering, grouping, and subqueries.

### Questions Addressed:
1. **Count the number of movies and TV shows**  
   Understand the distribution of content types on Netflix.

2. **Most common rating for movies and TV shows**  
   Find the rating that appears most frequently.

3. **List all movies released in a specific year (e.g., 2020)**  
   Identify movies added to Netflix in a given year.

4. **Top 5 countries with the most content on Netflix**  
   Rank countries based on their contribution to Netflix’s library.

5. **Identify the longest movie**  
   Retrieve the movie with the highest duration.

6. **Find content added in the last 5 years**  
   Extract all content added to Netflix in the last 5 years.

7. **Find all movies and TV shows by director Rajiv Chilaka**  
   List content directed by Rajiv Chilaka.

8. **List all TV shows with more than 5 seasons**  
   Identify multi-season TV shows with more than 5 seasons.

9. **Count the number of content items in each genre**  
   Categorize and count content by genres.

10. **Find each year and the average number of content releases by India on Netflix. Return the top 5 years with the highest average content release.**  
    Analyze year-wise trends in Indian Netflix content.

11. **List all movies that are documentaries**  
    Retrieve all documentary-type movies.

12. **In how many movies has Salman Khan appeared in the last 10 years?**  
    Count Salman Khan’s appearances in the last decade.

13. **Top 10 actors who have appeared in the highest number of movies produced in India**  
    Identify prolific actors in Indian Netflix content.

14. **Categorize content based on keywords 'kill' and 'violence' in the description field. Label content containing these keywords as 'bad' and all other content as 'good'. Count how many content items fall into each category.**  
    Perform sentiment-based categorization using content descriptions.

15. **Count the number of content items released each year**  
    Analyze year-on-year content additions on Netflix.

## Tools and Techniques Used
- **SQL Functions**: `COUNT`, `AVG`, `MAX`, `EXTRACT`, `CASE`, and more.
- **Filtering and Sorting**: `WHERE`, `LIKE`, `ORDER BY`.
- **Grouping**: `GROUP BY` for category-wise or year-wise data aggregation.
- **Subqueries**: To calculate nested metrics like averages and percentages.
- **String Matching**: For keyword-based sentiment categorization.

## How to Use
1. Clone the repository:
   ```bash
   git clone https://github.com/shujaat009/netflix-data-analysis.git
