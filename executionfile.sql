select * from movie;
select * from tvshow;
select * from studio;
select * from user;
select * from list;
select * from crew;
select * from casttab;

call getCast('Jake Gyllenhaal');
call getCrew('Ingmar Bergman');
call getList(70001);
call getMovie('Come and See');
call getShow('Game of Thrones');
call getStudio('A24');
call getUser('James Johnson');

SELECT * FROM movie.cast_details;
SELECT * FROM movie.crew_details;
SELECT * FROM movie.list_of_movies_shows;
SELECT * FROM movie.movie_details;
SELECT * FROM movie.show_details;
SELECT * FROM movie.studio_details;
SELECT * FROM movie.user_list;