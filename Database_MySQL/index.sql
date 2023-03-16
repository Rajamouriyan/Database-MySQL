-- SQL Lesson 1: SELECT queries 101
1) SELECT Title FROM movies;
2) SELECT Director FROM movies;
3) SELECT Director FROM movies;
4) SELECT Title, Year FROM movies;
5) SELECT * FROM movies;


-- SQL Lesson 2: Queries with constraints (Pt. 1)
1) SELECT * FROM movies
    WHERE Id = 6;
2) SELECT * FROM movies
    WHERE Year BETWEEN 2000 AND 2010;
3) SELECT * FROM movies
    WHERE Year NOT BETWEEN 2000 AND 2010;
4) SELECT * FROM movies
    WHERE Id BETWEEN 1 AND 5;


-- SQL Lesson 3: Queries with constraints (Pt. 2)
1) SELECT * FROM movies
    WHERE Title LIKE "%Toy Story%";
2) SELECT * FROM movies
    WHERE Director LIKE "John Lasseter";
3) SELECT * FROM movies
    WHERE Director NOT LIKE "John Lasseter";
4) SELECT * FROM movies
    WHERE Title LIKE "%WALL-%";


-- SQL Lesson 4: Filtering and sorting Query results
1) SELECT DISTINCT Director FROM movies
    ORDER BY Director ;
2) SELECT * FROM movies
    ORDER BY Year DESC 
    LIMIT 4;
3) SELECT *
    FROM Movies
    ORDER BY Title ASC
    LIMIT 5;
4) SELECT *
    FROM Movies
    ORDER BY Title ASC
    LIMIT 5 OFFSET 5;


-- SQL Review: Simple SELECT Queries
1) SELECT * FROM north_american_cities
    WHERE Country LIKE "Canada";
2) SELECT * FROM north_american_cities
    WHERE Country LIKE "United States"
    ORDER BY Latitude DESC;
3) SELECT * FROM north_american_cities
    WHERE Longitude < -87.69
    ORDER BY Longitude ASC;
4) SELECT * FROM north_american_cities
    WHERE Country = "Mexico"
    ORDER BY Population DESC
    LIMIT 2;
5) SELECT * FROM north_american_cities
    WHERE Country = "United States"
    ORDER BY Population DESC
    LIMIT 2 OFFSET 2;

-- SQL Lesson 6: Multi-table queries with JOINs
1) SELECT title, domestic_sales, international_sales 
    FROM movies
    JOIN boxoffice
        ON movies.id = boxoffice.movie_id;
2) SELECT title, domestic_sales, international_sales
    FROM movies
    JOIN boxoffice
        ON movies.id = boxoffice.movie_id
    WHERE international_sales > domestic_sales;
3) SELECT title, rating
    FROM movies
    JOIN boxoffice
        ON movies.id = boxoffice.movie_id
    ORDER BY rating DESC;

-- SQL Lesson 7: OUTER JOINs
1) SELECT DISTINCT building FROM employees;
2) SELECT * FROM buildings;
3) SELECT DISTINCT building_name, role 
    FROM buildings 
    LEFT JOIN employees
        ON building_name = building;

-- SQL Lesson 8: A short note on NULLs
1) SELECT name, role FROM employees
    WHERE building IS NULL;
2) SELECT DISTINCT building_name
    FROM buildings 
    LEFT JOIN employees
        ON building_name = building
    WHERE role IS NULL;

-- SQL Lesson 9: Queries with expressions
1) SELECT title, (domestic_sales + international_sales) / 1000000 AS gross_sales_millions
    FROM movies
    JOIN boxoffice
        ON movies.id = boxoffice.movie_id;
2) SELECT title, rating * 10 AS rating_percent
    FROM movies
    JOIN boxoffice
        ON movies.id = boxoffice.movie_id;
3) SELECT title, year
    FROM movies
    WHERE year % 2 = 0;

-- SQL Lesson 10: Queries with aggregates (Pt. 1)
1) SELECT MAX(years_employed) as Max_years_employed
    FROM employees;
2) SELECT role, AVG(years_employed) as Average_years_employed
    FROM employees
    GROUP BY role;
3) SELECT building, SUM(years_employed) as Total_years_employed
    FROM employees
    GROUP BY building;

-- SQL Lesson 11: Queries with aggregates (Pt. 2)
1) SELECT role, COUNT(*) as Number_of_artists
    FROM employees
    WHERE role = "Artist";
2) SELECT role, COUNT(*)
    FROM employees
    GROUP BY role;
3) SELECT role, SUM(years_employed)
    FROM employees
    GROUP BY role
    HAVING role = "Engineer";

-- SQL Lesson 12: Order of execution of a Query
1) SELECT director, COUNT(id) as Num_movies_directed
    FROM movies
    GROUP BY director;
2) SELECT Director, sum(Domestic_sales + International_Sales) as Total_Sales
    FROM Movies
    LEFT JOIN Boxoffice ON Id = Movie_ID
    GROUP BY Director;

-- SQL Lesson 13: Inserting rows
1) INSERT INTO Movies,
    VALUES (4, "Toy Story 4", "John Lasseter", 2017, 123);
2) INSERT INTO boxoffice 
    VALUES (4, 8.7, 340000000, 270000000);

-- SQL Lesson 14: Updating rows
1) UPDATE movies
    SET director = "John Lasseter"
    WHERE id = 2;
2) UPDATE movies
    SET year = 1999
    WHERE id = 3;
3) UPDATE movies
    SET title = "Toy Story 3", director = "Lee Unkrich"
    WHERE id = 11;

-- SQL Lesson 15: Deleting rows
1) DELETE FROM movies
    where year < 2005;
2) DELETE FROM movies
    where director = "Andrew Stanton";

-- SQL Lesson 16: Creating tables
1) CREATE TABLE Database (
    Name TEXT,
    Version FLOAT,
    Download_Count INTEGER);

-- SQL Lesson 17: Altering tables
1) ALTER TABLE Movies
  ADD COLUMN Aspect_ratio FLOAT DEFAULT 3;
2) ALTER TABLE Movies
  ADD COLUMN Language TEXT DEFAULT "English";

-- SQL Lesson 18: Dropping tables
1) DROP TABLE Movies;
2) DROP TABLE BoxOffice;