DELIMITER $$
CREATE PROCEDURE `getUser` (IN usename VARCHAR(45))
BEGIN
SELECT * FROM user_list
WHERE usename = User;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `getList` (IN listt int)
BEGIN
SELECT * FROM list_of_movies_shows
WHERE listt = List_ID;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `getShow` (IN showw VARCHAR(45))
BEGIN
SELECT * FROM show_details
WHERE showw = Show_Name;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `getMovie` (IN mov VARCHAR(45))
BEGIN
SELECT * FROM movie_details
WHERE mov = Movie_Name;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `getCast`(IN castt VARCHAR(45))
BEGIN
SELECT * FROM cast_details
WHERE castt = Name;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `getCrew` (IN creww VARCHAR(45))
BEGIN
SELECT * FROM crew_details
WHERE creww = Name;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `getStudio` (IN stud VARCHAR(45))
BEGIN
SELECT * FROM studio_details
WHERE stud = Studio;
END$$
DELIMITER ;
