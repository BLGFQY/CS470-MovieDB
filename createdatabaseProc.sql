DROP DATABASE IF EXISTS movie;
CREATE DATABASE movie; 
USE movie;

-- Create a procedure to create and insert some records to movie table
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `movie_table`()
BEGIN
-- Create Table Movie
CREATE TABLE movie (
	movieId int NOT NULL,
	title varchar(45) NOT NULL,
	duration int NOT NULL CHECK (duration>5),
    CHECK (duration<540),
	country1 varchar(45),
    country2 varchar(45),
	lang1 varchar(45) NOT NULL,
    lang2 varchar(45),
	descript varchar(1000) CHECK (length(descript)>=20),
	releaseYear int CHECK (releaseYear>=1800),
	PRIMARY KEY (movieId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 

-- Insert Movie Queries
INSERT INTO movie (movieId, title, duration, country1, lang1, releaseYear, descript)
VALUES (10000, "Ghost in the Shell", 83, "Japan", "Japanese", 1995,
			"It found a voice. Now it needs a body. In the year 2029; the barriers of our world have been broken down by the net and by cybernetics; but this brings new vulnerability to humans in the form of brain-hacking. When a highly-wanted hacker known as â€˜The Puppetmasterâ€™ begins involving them in politics; Section 9; a group of cybernetically enhanced cops; are called in to investigate and stop the Puppetmaster."),
		(10001, "Videodrome", 88, "Canada", "English", 1983,
		"First it controls your mind. Then it destroys your body. As the president of a trashy TV channel; Max Renn is desperate for new programming to attract viewers. When he happens upon â€œVideodromeâ€ a TV show dedicated to gratuitous torture and punishment; Max sees a potential hit and broadcasts the show on his channel. However; after his girlfriend auditions for the show and never returns; Max investigates the truth behind Videodrome and discovers that the graphic violence may not be as fake as he thought."),   
		(10002, "Nightcrawler", 118, "USA", "English", 2014,
		"The city shines brightest at night. When Lou Bloom; desperate for work; muscles into the world of L.A. crime journalism; he blurs the line between observer and participant to become the star of his own story. Aiding him in his effort is Nina; a TV-news veteran."),
		(10004, "Perfect Blue", 81, "Japan", "Japanese", 1997,
		 "The color of illusion is Perfect Blue. A retired pop singer turned actressâ€™ sense of reality is shaken when she is stalked by an obsessed fan and seemingly a ghost of her past."),
		(10005, "I'm Thinking of Ending Things", 135, " USA", "English", 2020,
		 "Nothing is as it seems when a woman experiencing misgivings about her new boyfriend joins him on a road trip to meet his parents at their remote farm."),
		(10006, "Eternal Sushine of the Spotless Mind", 108, "USA", "English", 2004,+
		 "You can erase someone from your mind. Getting them out of your heart is another story. Joel Barish; heartbroken that his girlfriend underwent a procedure to erase him from her memory; decides to do the same. However; as he watches his memories of her fade away; he realises that he still loves her; and may be too late to correct his mistake."),
		(10007, "Persona", 83, "Sweden", "Swedish", 1966,
		 "A young nurse; Alma; is put in charge of Elisabeth Vogler: an actress who is seemingly healthy in all respects; but will not talk. As they spend time together; Alma speaks to Elisabeth constantly; never receiving any answer. Alma eventually confesses her secrets to a seemingly sympathetic Elisabeth and finds that her own personality is being submerged into Elisabethâ€™s persona."),
		(10010, "Little Children", 136, "USA", "English", 2006,
		 "The lives of two lovelorn spouses from separate marriages; a registered sex offender; and a disgraced ex-police officer intersect as they struggle to resist their vulnerabilities and temptations."),
		(10011, "Uncut Gems", 136, "USA", "English", 2019,
		 "This is how I win. A charismatic New York City jeweler always on the lookout for the next big score makes a series of high-stakes bets that could lead to the windfall of a lifetime. Howard must perform a precarious high-wire act; balancing business; family; and encroaching adversaries on all sides in his relentless pursuit of the ultimate win."),
		(10013, "Where is the Friend's House?", 83, "Iran", "Persian", 1987,
		 "An 8 year old boy must return his friendâ€™s notebook he took by mistake; lest his friend be punished by expulsion from school.");

INSERT INTO movie (movieId, title, duration, country1, country2, lang1, lang2, releaseYear, descript)
VALUES (10008, "The Lighthouse", 109, "Canada", "USA", "English", NULL, 2019,
		  "There is enchantment in the light. Two lighthouse keepers try to maintain their sanity while living on a remote and mysterious New England island in the 1890s."),
		(10009, "2001: A Space Odyssey", 149, "UK", "USA", "English", "Russian", 1968,
		 "The Ultimate Trip. Humanity finds a mysterious object buried beneath the lunar surface and sets off to find its origins with the help of HAL 9000; the world's most advanced super computer."),
		(10012, "Parasite", 133, "South Korea", NULL, "Korean", "English", 2019,
		 "Act like you own the place. All unemployed; Ki-taekâ€™s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident."),
		(10003, "Come and See", 142, "USSR", NULL, "Russian", "German", 1985,
		"The invasion of a village in Byelorussia by German forces sends young Florya into the forest to join the weary Resistance fighters; against his familyâ€™s wishes. There he meets a girl; Glasha; who accompanies him back to his village. On returning home; Florya finds his family and fellow peasants massacred. His continued survival amidst the brutal debris of war becomes increasingly nightmarish; a battle between despair and hope.");
END$$
DELIMITER ;

-- 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `genre_table`()
BEGIN
CREATE TABLE genre (
	movieId int,
    showId int,
    genre1 varchar(45),
    genre2 varchar(45),
    genre3 varchar(45),
    
    FOREIGN KEY (movieId) REFERENCES movie(movieId),
    FOREIGN KEY (showId) REFERENCES tvshow(showId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 

INSERT INTO genre (movieId, genre1, genre2, genre3)
VALUES (10000, 'Science Fiction', 'Animation', 'Action'),
		(10001, 'Science Fiction', 'Horror', 'Mystery'),
        (10002, 'Crime', 'Thriller', 'Drama'),
		(10003, 'Drama', 'War', 'History'),
		(10004, 'Animation', 'Thriller', NULL),
		(10005, 'Mystery', 'Drama', 'Thriller'),
		(10006, 'Drama', 'Romance', 'Science Fiction'),
		(10007, 'Drama', NULL, NULL),
		(10008, 'Thriller', 'Fantasy', 'Drama'),
		(10009, 'Science Fiction', 'Adventure', 'Mystery'),
		(10010, 'Romance', 'Comedy', 'Drama'),
		(10011, 'Drama', 'Crime', 'Thriller'),
		(10012, 'Comedy', 'Drama', 'Thriller'),
		(10013, 'Drama', 'Family', NULL);

INSERT INTO genre (showId, genre1, genre2, genre3)
VALUES (20000, 'Crime', 'Drama', 'Thriller'),
		(20001, 'Animation', 'Adventure', 'Comedy'),
		(20002, 'Comedy', 'Romance', NULL),
		(20003, 'Crime', 'Drama', 'Thriller'),
		(20004, 'Crime', 'Drama', 'Mystery'),
		(20005, 'Action', 'Adventure', 'Drama'),
		(20006, 'Crime', 'Drama', NULL),
		(20007, 'Biography', 'Crime', 'Drama'),
		(20008, 'Action', 'Crime', 'Drama'),
		(20009, 'Drama', 'Fantasy', 'Horror'),
		(20010, 'Action', 'Adventure', 'Drama');

END$$
DELIMITER ;

-- Create a procedure to create and insert some records to tvshow table
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tvshow_table`()
BEGIN
-- Create Table Tvshow
CREATE TABLE tvshow (
	showId int NOT NULL,
	title varchar(45) NOT NULL,
	duration int NOT NULL CHECK (length(duration)<60),
	country1 varchar(45),
    country2 varchar(45),
	lang varchar(45) NOT NULL,
	descript varchar(1000) CHECK (length(descript)>=20),
	releaseYear int CHECK (releaseYear>=1800),
	numEpisodes int,
	numSeasons int,
	PRIMARY KEY (showId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 

-- Insert Tvshow Queries
INSERT INTO tvshow ( showId, title, duration, country1, lang, releaseYear, numEpisodes, numSeasons, descript)
VALUES (20000, "Breaking Bad", 49, "USA", "English", 2008, 62, 5, 
		"A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future."),
		(20001, "Rick and Morty", 23, "USA", "English", 2013, 52, 6, 
		"An animated series that follows the exploits of a super scientist and his not-so-bright grandson."),
		(20002, "Friends", 22, "USA", "English", 1994, 235, 10, 
		"Follows the personal and professional lives of six twenty to thirty-something-year-old friends living in Manhattan."),
		(20003, "Mr. Robot", 49, "USA", "English", 2015, 45, 4, 
		"Elliot, a brilliant but highly unstable young cyber-security engineer and vigilante hacker, becomes a key figure in a complex game of global dominance when he and his shadowy allies try to take down the corrupt corporation he works for."),
		(20005, "Game of Thrones", 57, "USA", "English", 2011, 73, 8, 
		"Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia."),
		(20006, "Better Call Saul", 46, "USA", "English", 2015, 63, 6, 
		"The trials and tribulations of criminal lawyer Jimmy McGill in the time before he established his strip-mall law office in Albuquerque, New Mexico."),		
		(20008, "Money Heist", 70, "Spain", "English", 2017, 41, 5, 
		"An unusual group of robbers attempt to carry out the most perfect robbery in Spanish history - stealing 2.4 billion euros from the Royal Mint of Spain."),
		(20009, "Stranger Things", 51, "USA", "English", 2016, 35, 4, 
		"When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back."),
		(20010, "The Witcher", 55, "USA", "English", 2019, 17, 2, 
		"Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts.");

INSERT INTO tvshow ( showId, title, duration, country1, country2, lang, releaseYear, numEpisodes, numSeasons, descript)
VALUES (20004, "Sherlock", 88, "UK", "USA", "English", 2010, 15, 4, 
		"A modern update finds the famous sleuth and his doctor partner solving crime in 21st century London."),
        (20007, "Narcos", 49, "USA", "Colombia", "English", 2015, 30, 3, 
		"A chronicled look at the criminal exploits of Colombian drug lord Pablo Escobar, as well as the many other drug kingpins who plagued the country through the years.");
END$$
DELIMITER ;


-- Create a procedure to create and insert some records to cast table
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cast_table`()
BEGIN
-- Create Table Cast
CREATE TABLE castTab (
	castId int NOT NULL,
	caName varchar(45) NOT NULL,
	birthday date CHECK (birthday>'1800-1-1'),
	biography varchar(1000),
    movieId int,
    showId int,
	PRIMARY KEY (castId),
    FOREIGN KEY (movieId) REFERENCES movie(movieId),
	FOREIGN KEY (showId) REFERENCES tvshow(showId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert Cast Queries
INSERT INTO castTab (castId, caName, birthday, movieId, biography)
VALUES (30001, "Atsuko Tanaka", '1962-11-14', 10000,
		"Atsuko Tanaka is a Japanese voice actress and narrator associated with Mausu Promotion. She is best known for her portrayal of Motoko Kusanagi in the Ghost in the Shell film and franchise."),
		(30002, "Akio Otsuka", '1959-11-24', 10000,
        "Akio Ōtsuka is a Japanese actor, voice actor and narrator from the Tokyo Metropolitan area. He is attached to Mausu Promotion. The astringent and calm quality of his deep voice has landed him many roles in films, dubbing, animation, and video games. He is most known for the roles of second generation Jigen Daisuke, Black Jack, Solid Snake, Naked Snake, Solidus Snake and Venom Snake, Gamigami Devil, Ryoma Hoshi, Shunsui Kyouraku, Lieutenant Garuru, Gwendel von Voltaire, Batou, Blackbeard/Marshall D"),
		(30003, "Iemasa Kayumi", '1932-10-31', 10000,
        "Iemasa Kayumi was a Japanese actor, voice actor and narrator from the Tokyo Metropolitan area. He was the official voice-over actor for Frank Sinatra and Donald Sutherland"),
		(30004, "James Woods", '1947-04-18', 10001,
        "James Howard Woods is an American actor and producer. He is known for his work in various film, stage, and television productions. He started his career in minor roles on and off-Broadway. In 1972, he appeared in The Trial of the Catonsville Nine alongside Sam Waterston and Michael Moriarty on Broadway"),
		(30005, "Sonja Smits", '1958-09-09', 10001,
        "Sonja Smits is a Canadian actress. She was nominated for two Genie Awards: for Videodrome and That's My Baby!. On television, she starred in Street Legal and Traders"),
		(30006, "Debbie Harry", '1945-07-01', 10001,
        "Deborah 'Debbie' Ann Harry is an American singer; songwriter and actress; known as the lead vocalist of the band Blondie. Her recordings with the band reached No. 1 in the US and UK charts on many occasions from 1979 to 2017. Born in Miami; Florida; Harry was adopted as an infant and raised in Hawthorne; New Jersey"),
		(30007, "Jake Gyllenhaal", '1980-12-19', 10002,
        "Jacob Benjamin Gyllenhaal is an American actor. Born into the Gyllenhaal family, he is the son of director Stephen Gyllenhaal and screenwriter Naomi Foner; his older sister is actress Maggie Gyllenhaal. He began acting as a child, making his acting debut in City Slickers, followed by roles in his father's films A Dangerous Woman and Homegrown"),
		(30008, "Rene Russo", '1954-02-17', 10002,
        "Rene Marie Russo is an American actress and model. She began her career as a fashion model in the 1970s, appearing on magazine covers such as Vogue and Cosmopolitan"),
		(30009, "Riz Ahmed", '1982-12-01', 10002,
        "Rizwan Ahmed is a British Pakistani actor and rapper. He is the recipient of various accolades, including an Academy Award, Primetime Emmy Award, National Board of Review Award, Independent Spirit Award, London Film Critics' Circle Award, and two British Independent Film Awards; he has also received nominations for two Golden Globe Awards, two Bafta Awards and two Screen Actors Guild Awards"),
		(30010, "Bill Paxton", '1955-05-17', 10002,
        "William Paxton was an American actor, filmmaker, and musician. He appeared in films such as Weird Science, Near Dark, Aliens, Tombstone, True Lies, Apollo 13, Twister, and Titanic. Paxton starred in the HBO drama series Big Love, for which he earned three Golden Globe Award nominations during the show's run"),
		(30011, "Aleksei Kravchenko", '1969-10-10', 10003,
        "Aleksey Kravchenko was born on October 10, 1969 in Moskovskaya oblast, RSFSR, USSR [now Russia]. He is an actor, known for Come and See (1985), 9th Company (2005) and Velvet Revolution (2005). He is married to Nadezhda Borisova"),
		(30012, "Olga Mironova", NULL, 10003,
        "Olga Mironova is an actress, known for Come and See"),
		(30013, "Liubomiras Laucevicius", '1950-06-15', 10003,
        "Liubomiras Laucevičius is a Lithuanian actor. He has appeared in more than fifty films since 1979"),
		(30014, "Junko Iwao", '1970-02-18', 10004,
        "Junko Iwao is a Japanese voice actress and singer. Her most notable role is in Cardcaptor Sakura, providing the voice to Sakura's best friend and cousin, Tomoyo Daidōji. She also voiced lead character Mima Kirigoe in Perfect Blue, Ceres in Ceres, Celestial Legend, and Kikyo in Hunter x Hunter. In video games, she voiced Pai Chan in Virtua Fighter, Carole Pepper in Honkai Impact 3rd, Mint in Tales of Phantasia and Serika in To Heart."),
		(30015, "Rica Matsumoto", '1968-11-30', 10004,
        "Rica Matsumoto is a Japanese actress, voice actress and singer who was born in Yokohama, Japan. Her name is also sometimes romanized as Rika Matsumoto. She was one of the founders of the Anison band JAM Project.");

INSERT INTO castTab (castId, caName, birthday, showId, biography)
VALUES (30016, "Bryan Cranston", '1956-03-07', 20000,
        "Bryan Lee Cranston is an American actor, director, producer, and screenwriter. He is known for portraying Walter White in the AMC crime drama series Breaking Bad and Hal in the Fox sitcom Malcolm in the Middle. Cranston's performance on Breaking Bad earned him the Primetime Emmy Award for Outstanding Lead Actor in a Drama Series four times"),
		(30017, "Justin Roiland", '1980-02-21', 20001,
        "Mark Justin Roiland is an American voice actor, animator, writer, producer, and director. He is best known as the co-creator of Adult Swim's Rick and Morty and its subsequent franchise. He voices the show's title characters Rick Sanchez and Morty Smith"),
		(30018, "Jennifer Aniston", '1969-02-11', 20002,
        "Jennifer Joanna Aniston is an American actress and producer. The daughter of actors John Aniston and Nancy Dow, she began working as an actress at an early age with an uncredited role in the 1988 film Mac and Me; her first major film role came in the 1993 horror comedy Leprechaun"),
		(30019, "Rami Malek", '1981-05-12', 20003,
        "Rami Said Malek is an American actor. He is known for portraying computer hacker Elliot Alderson in the USA Network television series Mr.Robot"),
		(30020, "Benedict Cumberbatch", '1976-07-19', 20004,
        "Benedict Timothy Carlton Cumberbatch is an English actor. Known for his roles on the screen and stage, he has received various accolades throughout his career, including a British Academy Television Award, a Primetime Emmy Award and a Laurence Olivier Award"),
		(30021, "Emilia Clarke", '1986-10-23', 20005,
        "Emilia Isobel Euphemia Rose Clarke is an English actress. She studied at the Drama Centre London, appearing in a number of stage productions. Her television debut was a guest appearance in the BBC One medical soap opera Doctors in 2009"),
		(30022, "Bob Odenkirk", '1962-10-22', 20006,
        "Robert John Odenkirk is an American actor, comedian, writer, director, and producer. He is best known for his role as the unscrupulous lawyer Saul Goodman on the AMC crime drama series Breaking Bad and its spin-off Better Call Saul, for which he received four nominations for Primetime Emmy Award for Outstanding Lead Actor in a Drama Series"),
		(30023, "Pedro Pascal", '1975-04-02', 20007,
        "Jose Pedro Balmaceda Pascal is a Chilean and American actor. He began his career guest starring on various television shows before rising to prominence for portraying Oberyn Martell on the fourth season of the HBO fantasy series Game of Thrones and Javier Pe�a on the Netflix biographic crime series Narcos."),
		(30024, "Ursula Corbero", '1989-08-11', 20008,
        "Ursula Corbero Delgado is a Spanish actress and model. She is best known for her roles as Ruth Gomez in F�sica o quomica, Margarita de Austria in the television series Isabel and Marta in the comedy film C�mo Sobrevivir a una Despedida"),
		(30025, "Millie Bobby Brown", '2004-02-19', 20009,
        "Millie Bobby Brown is a British actress best known for playing the character Eleven in the Netflix sci-fi drama series Stranger Things. The role earned her two Emmy Award nominations for Outstanding Supporting Actress in a Drama Series, and two Screen Actors Guild Award nominations for Outstanding Performance by a Female Actor in a Drama Series"),
		(30026, "Henry Cavill", '1983-05-05', 20010,
        "Henry William Dalgliesh Cavill is a British actor. He is known for his portrayal of Charles Brandon in Showtime's The Tudors, DC Comics character Superman in the DC Extended Universe, Geralt of Rivia in the Netflix fantasy series The Witcher, as well as Sherlock Holmes in the Netflix film Enola Holmes");
END$$
DELIMITER ;


-- Create a procedure to create and insert some records to crew table
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `crew_table`()
BEGIN
-- Creat Table Crew
CREATE TABLE crew (
	crewId int NOT NULL,
	crName varchar(45) NOT NULL,
	birthday date CHECK (birthday>'1800-1-1'),
	biography varchar(1000),
    movieId int,
    showId int,
	PRIMARY KEY (crewId),
    FOREIGN KEY (movieId) REFERENCES movie(movieId),
	FOREIGN KEY (showId) REFERENCES tvshow(showId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert Crew Queries
INSERT INTO crew ( crewId, crName, birthday, showId, biography)
VALUES (40001, "Michelle MacLaren", '1965-1-1', 20000,
		"Michelle Maxwell MacLaren is a Canadian television director and producer. She has directed episodes of The X-Files, Breaking Bad, The Walking Dead, Game of Thrones, and Westworld. MacLaren won two back-to-back Primetime Emmy Awards for producing Breaking Bad in 2013 and 2014"),
		(40002, "Wesley Archer", '1961-11-26', 20001,
        "Wesley Meyer Archer is an American television animation director and storyboard artist"),
		(40003, "Sam Esmail", '1977-9-17', 20003,
        "Sam Esmail is an American film and television producer, director, and screenwriter who runs the production company Esmail Corp. He is best known as the creator, writer and director of the television series Mr. Robot, starring Rami Malek"),
		(40004, "Paul McGuigan", '1963-9-19', 20004,
        "Paul McGuigan was born on September 19, 1963 in Bellshill, Scotland. He is a director and producer, known for Lucky Number Slevin (2006), Wicker Park (2004) and Victor Frankenstein (2015). He is married to Natasha Noramly. They have one child. He was previously married to Elisabeth McGuigan"),
		(40005, "David Nutter", '1960-1-1', 20005,
        "David Nutter is an American television and film director and television producer. He is best known for directing pilot episodes for television. In 2015, he received a Primetime Emmy Award for Outstanding Directing for a Drama Series, for his work on the HBO series Game of Thrones"),
		(40006, "Vince Gilligan", '1967-2-10', 20006,
        "George Vincent Gilligan Jr. is an American writer, producer, and director. He is known for his television work, specifically as creator, head writer, executive producer, and director of AMC's Breaking Bad and its spin-off Better Call Saul"),
		(40007, "Andres Baiz", '1975-1-1', 20007,
        "AndrÃ©s Baiz Ochoa, also known as Andi Baiz, is a Colombian film director and screenwriter. As a film director, his first feature was SatanÃ¡s, based on the book of the same name. He is known also for directing the film The Hidden Face and for the TV series MetÃ¡stasis and Narcos"),
		(40008, "Matt Duffer", '1984-2-15', 20009,
        "Matt Duffer and Ross Duffer, known professionally as The Duffer Brothers, are American film and television writers, directors and producers. They are best known for creating the science fiction-horror series Stranger Things. They also wrote and directed the 2015 horror film Hidden, and have written episodes for Wayward Pines"),
		(40009, "Russ Duffer", '1984-2-15', 20009,
        "Matt Duffer and Ross Duffer, known professionally as The Duffer Brothers, are American film and television writers, directors and producers. They are best known for creating the science fiction-horror series Stranger Things. They also wrote and directed the 2015 horror film Hidden, and have written episodes for Wayward Pines"),
		(40010, "Alik Sakharov", '1959-5-17', 20010,
        "Alik Sakharov is a Soviet-born American film and television director. A former Director of Photography, he is an active member of the American Society of Cinematographers");

INSERT INTO crew ( crewId, crName, birthday, movieId, biography)
VALUES (40011, "Mamoru Oshii", '1951-8-8', 10000,
        "Mamoru Oshii is a Japanese filmmaker, television director and writer. Famous for his philosophy-oriented storytelling, Oshii has directed a number of acclaimed anime films, including Urusei Yatsura 2: Beautiful Dreamer, Angel's Egg, Patlabor 2: The Movie, and Ghost in the Shell"),
		(40012, "David Cronenberg", '1943-3-15', 10001,
        "David Paul Cronenberg is a Canadian film director, screenwriter, and actor. He is one of the principal originators of what is commonly known as the body horror genre, with his films exploring visceral bodily transformation, infection, technology, and the intertwining of the psychological with the physical"),
		(40013, "Dan Gilroy", '1959-6-24', 10002,
        "Daniel Christopher Gilroy is an American screenwriter and film director. He is best known for writing and directing Nightcrawler, for which he won Best Screenplay at the 30th Independent Spirit Awards, and was nominated for Best Original Screenplay at the 87th Academy Awards"),
		(40014, "Elem Klimov", '1933-7-9', 10003,
        "Elem Germanovich Klimov was a Soviet and Russian filmmaker. He studied at the Gerasimov Institute of Cinematography, and was married to film director Larisa Shepitko. Klimov is best known in the West for his final film, 1985's Come and See, which follows a teenage boy in German-occupied Byelorussia during the Great Patriotic War and is often considered one of the greatest war films ever made. He also directed dark comedies, children's movies, and historical pictures"),
		(40015, "Satoshi Kon", '1963-10-12', 10004,
        "Satoshi Kon was a Japanese film director, animator, screenwriter and manga artist from Sapporo, Hokkaido and a member of the Japanese Animation Creators Association. Tsuyoshi Kon, a guitarist, is his brother. He was a graduate of the Graphic Design department of the Musashino Art University"),
		(40016, "Charlie Kaufman", '1958-11-19', 10005,
        "Charles Stuart Kaufman is an American screenwriter, producer, director, and novelist. He wrote the films Being John Malkovich, Adaptation, and Eternal Sunshine of the Spotless Mind. He made his directorial debut with Synecdoche, New York, which film critic Roger Ebert called the best movie of the decade in 2009."),
		(40017, "Michel Gondry",'1963-5-9', 10006,
        "Michel Gondry is a French film director, screenwriter, and producer noted for his inventive visual style and distinctive manipulation of mise en scÃ¨ne. Along with Charlie Kaufman, he won an Academy Award for Best Original Screenplay as one of the writers of the 2004 film Eternal Sunshine of the Spotless Mind, a film he also directed"),
		(40018, "Ingmar Bergman", '1918-7-14', 10007,
        "Ernst Ingmar Bergman was a Swedish film director, screenwriter, producer and playwright. Widely considered one of the most accomplished and influential filmmakers of all time; Bergman's films are known as profoundly personal meditations into the myriad struggles facing the psyche and the soul. Bergman directed more than 60 films and documentaries for cinematic release and for television screenings; most of which he also wrote"),
		(40019, "Robert Edgars", '1983-7-7', 10008,
        "Robert Houston Eggers is an American film director, screenwriter, and production designer. He is best known for his acclaimed horror films The Witch and The Lighthouse. Eggers began his career as a designer and director of theatre productions in New York before transitioning to working in film"),
		(40020, "Stanley Kubrick", '1928-7-26', 10009,
        "Stanley Kubrick was an American film director, producer, screenwriter, and photographer. He is frequently cited as one of the greatest filmmakers in cinematic history. His films, almost all of which are adaptations of novels or short stories, cover a wide range of genres and are noted for their realism, dark humor, unique cinematography, extensive set designs, and evocative use of music"),
		(40021, "Todd Field", '1964-2-24', 10010,
        "William Todd Field is an American actor and filmmaker. He directed In the Bedroom and Little Children, which received a combined eight Academy Award nominations"),
		(40022, "Josh Safdie", '1984-4-3', 10011,
        "Brothers Joshua Safdie and Ben Safdie are independent filmmakers based in New York City, who frequently collaborate"),
		(40023, "Benny Safdie", '1986-2-24', 10012,
        "Brothers Joshua Safdie and Ben Safdie are independent filmmakers based in New York City, who frequently collaborate");

END$$
DELIMITER ;


-- Create a procedure to create and insert some records to studio table
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `studio_table`()
BEGIN
-- Creat Table Studio
CREATE TABLE studio (
	studioId int NOT NULL,
	stName varchar(45) NOT NULL,
	descript varchar(1000) CHECK (length(descript)>=20),
    country varchar(45),
    foundDate Date CHECK (foundDate>'1800-1-1'),
    movieId1 int,
    movieId2 int,
    showId int,
    PRIMARY KEY (stName),
    FOREIGN KEY (movieId1) REFERENCES movie(movieId),
    FOREIGN KEY (movieId2) REFERENCES movie(movieId),
	FOREIGN KEY (showId) REFERENCES tvshow(showId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 
-- Insert Studio Queries
INSERT INTO studio (studioID, stName, country, foundDate, movieId1, movieId2)
VALUES (01, "A24", "USA", '2012-08-20', 10008, 10011);
		-- (01, "A24", "USA", '2012-08-20', 10011),
        
INSERT INTO studio (studioID, stName, country, foundDate, movieId1)
VALUES (02, "AB Svensk Filmindustri", "Sweden", '1919-12-27', 10007),
		(03, "Belarusfilm", "Belarus", '1924-01-01', 10003),
		(04, "Bold Films", "USA", '2004-01-01', 10002),
		(05, "CJ Entertainment", "South Korea", '2000-01-01', 10012),
		(06, "Filmplan International", "Canada", '1976-09-30', 10001),
		(07, "Focus Features", "USA", '2002-01-01', 10006),
		(08, "Kanun parvaresh fekri", "Iran", '1965-01-08', 10013),
		(09, "Kodansha", "Japan", '1938-12-01', 10000),
		(010, "Likely Story", "USA", '2006-06-01', 10005),
		(011, "Metro-Goldwyn-Mayer (MGM)", "USA", '1924-04-17', 10009),
		(012, "New Line Cinema", "USA", '1967-06-18', 10010),
		(013, "Rex Entertainment", "Japan", '1972-10-17', 10004);
END$$
DELIMITER ;


-- Create a procedure to create and insert some records to user and list table
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_table`()
BEGIN
-- create table list
CREATE TABLE list (
	listId int NOT NULL,
	movieId int,
    showId int,
    title varchar(45) NOT NULL CHECK (length(title) > 3), 
    PRIMARY KEY (listId),
    FOREIGN KEY (movieId) REFERENCES movie(movieId),
    FOREIGN KEY (showId) REFERENCES tvshow(showId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 

-- create table user
CREATE TABLE user (
	userId int NOT NULL,
	username varchar(50) NOT NULL,
	country varchar(45) NOT NULL,
    birthday date CHECK (birthday>'1800-1-1'),
	email varchar(200) NOT NULL,
    listId1 int,
    listId2 int,
	PRIMARY KEY (userId),
    FOREIGN KEY (listId1) REFERENCES list(listId),
    FOREIGN KEY (listId2) REFERENCES list(listId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 

-- insert data into list
INSERT INTO list (title, listId, movieId, showID) 
VALUES  ("Things to watch at night", 70001, 10007, 20008),
		("Things to watch when bored", 70002, 10010, 20005),
		("Things to watch with your SO", 70003, 10005, 20007),
		("Family Friendly", 70004, 10006, 20006),
		("NOT Family Friendly", 70005, 10002, 20003),
		("Fun to watch with friends", 70006, 10000, 20002),
		("All time best", 70007, 10003, 20001),
		("All time worst", 70008, 10006, 20000),
		("Should watch again", 70009, 10008, 20001),
		("Wasn't worth watching", 70010, 10011, 20010),
		("Off-brand disney", 70011, 10013, 20009),
		("pretentious media", 70012, 10009, 20008),
		("watch for the cast", 70013, 10004, 20004),
		("wonderful directors", 70014, 10002, 20007);
        
        
-- insert data into user
INSERT INTO user (userID, userName, country, birthday, email, listId1, listId2)
VALUES (60001, "James Johnson", "USA", '1972-10-17', 'james72@gmail.com', 70001, 70002),
		(60012, "Thomas Harris", "Argentina", '1986-12-31','harrtho@gmail.com', 70013, 70014);
        -- (60012, "Thomas Harris", "Argentina", '1986-12-31','harrtho@gmail.com', 70014);
		-- (60001, "James Johnson", "USA", '1972-10-17', 'james72@gmail.com', 70002),

INSERT INTO user (userID, userName, country, birthday, email, listId1)
VALUES 
		(60002, "David Jones", "UK", '1999-05-27', 'jones0527@gmail.com', 70003),
		(60003, "Thomas Hall", "Canada", '1987-04-07','hall8707@gmail.com', 70004),
		(60004, "Charles Wright", "Germany", '1994-06-09', 'charwright10@gmail.com', 70005),
		(60005, "Anthony Brown", "Belarus", '1982-07-13','brownbe@gmail.com', 70006),
		(60006, "James Johnson", "Mexico", '1988-08-19','jamesusa@gmail.com', 70007),
		(60007, "Linda Hughes", "France", '1989-09-04','francehughes@gmail.com', 70008),
		(60008, "Susan Brown", "Russia", '1997-11-05','susan0511@gmail.com', 70009),
		(60009, "Mary White", "Japan", '1991-01-01','white0991@gmail.com', 70010),
		(60010, "Linda Wood", "Venezula", '1979-02-10','linda19@gmail.com', 70011),
		(60011, "Elizabeth Green", "Brazil", '2001-03-17','greenzil@gmail.com', 70012);
		
END$$
DELIMITER ;

-- Call all procedures
call movie_table;
call tvshow_table;
call cast_table;
call crew_table;
call studio_table;
call user_table;
call genre_table;
