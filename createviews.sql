CREATE VIEW user_list AS
SELECT user.username AS User, 
list.listId AS List_ID, 
list.title AS List_Name
FROM user
INNER JOIN list ON user.listId1 = list.listId OR user.listId2 = list.listId
-- WHERE __
ORDER BY list.listId;

CREATE VIEW list_of_movies_shows AS
SELECT list.listId AS List_ID, 
movie.title AS Movie_Name, 
tvshow.title AS Show_Name
FROM ((list
INNER JOIN movie ON list.movieId = movie.movieId)
INNER JOIN tvshow ON list.showId = tvshow.showId)
-- WHERE __
ORDER BY list.listId;

CREATE VIEW show_details AS
SELECT tvshow.title AS Show_Name, 
genre.genre1 AS Genre_1,
genre.genre2 AS Genre_2,
genre.genre3 AS Genre_3, 
tvshow.duration AS Duration, 
tvshow.country1 AS Country_1, 
tvshow.country2 AS Country_2,
tvshow.lang AS Language, 
tvshow.descript AS Description, 
tvshow.releaseYear AS Released, 
tvshow.numEpisodes AS Episodes, 
tvshow.numSeasons AS Seasons, 
studio.stName AS Studio, 
casttab.caName as Cast, 
crew.crName AS Crew
FROM tvshow
LEFT JOIN studio ON tvshow.showId = studio.showID
LEFT JOIN crew ON tvshow.showId = crew.showId
LEFT JOIN casttab ON tvshow.showId = casttab.showId
LEFT JOIN genre ON tvshow.showId = genre.showId
ORDER BY tvshow.title;

CREATE VIEW movie_details AS
SELECT movie.title AS Movie_Name, 
genre.genre1 AS Genre_1, 
genre.genre2 AS Genre_2,
genre.genre3 AS Genre_3,
movie.duration AS Duration, 
movie.country1 AS Country_1,
movie.country2 AS Country_2, 
movie.lang1 AS Language_1, 
movie.lang2 AS Language_2,
movie.descript AS Description, 
movie.releaseYear AS Released, 
studio.stName AS Studio, 
casttab.caName AS Cast, 
crew.crName AS Crew
FROM movie
LEFT JOIN studio ON movie.movieId = studio.movieId1 OR movie.movieId = studio.movieId2
LEFT JOIN crew ON movie.movieId = crew.movieId
LEFT JOIN casttab ON movie.movieId = casttab.movieId
LEFT JOIN genre ON movie.movieId = genre.MovieId
ORDER BY movie.title;

CREATE VIEW cast_details AS
SELECT casttab.caName AS Name, 
casttab.birthday AS Birthday, 
DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),casttab.birthday)), '%Y')+0 AS Age, 
casttab.biography AS Bio, 
tvshow.title AS Show_Name, 
movie.title AS Movie_Name
FROM casttab
LEFT JOIN tvshow ON casttab.showId = tvshow.showId
LEFT JOIN movie ON casttab.movieId = movie.movieId
-- WHERE __
ORDER BY casttab.caName;

CREATE VIEW crew_details AS
SELECT crew.crName AS Name, 
crew.birthday AS Birthday, 
DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),crew.birthday)), '%Y')+0 AS Age, 
crew.biography AS Bio, 
tvshow.title AS Show_Name, 
movie.title AS Movie_Name
FROM crew
LEFT JOIN tvshow ON crew.showId = tvshow.showId
LEFT JOIN movie ON crew.movieId = movie.movieId
-- WHERE __
ORDER BY crew.crName;

CREATE VIEW studio_details AS
SELECT studio.stName AS Studio, 
studio.country AS Country, 
studio.foundDate AS Founded, 
tvshow.title AS Show_Name, 
movie.title AS Movie_Name
FROM studio
LEFT JOIN tvshow ON studio.showId = tvshow.showId
LEFT JOIN movie ON studio.movieId1 = movie.movieId OR studio.movieId2 = movie.movieId
-- WHERE __
ORDER BY studio.stName;