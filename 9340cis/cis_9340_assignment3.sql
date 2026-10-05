CREATE TABLE membership (
	mem_num int NOT NULL,
    mem_fname varchar(20),
    mem_lname varchar(20),
    mem_street varchar(50),
    mem_city varchar(20),
    mem_state varchar(2),
    mem_zip int,
    mem_balance int,
    primary key (mem_num)
);

CREATE TABLE rental (
	rent_num int NOT NULL,
    rent_date varchar(10),
    mem_num int NOT NULL,
    primary key (rent_num),
    foreign key (mem_num) references membership(mem_num)
);

CREATE TABLE price (
	price_code int NOT NULL,
    price_description varchar(50),
    price_rentfee decimal(3, 1),
    price_dailylatefee decimal(3, 1),
    primary key (price_code)
);

CREATE TABLE movie (
	movie_num int NOT NULL,
    movie_title varchar(20),
    movie_year int,
    movie_cost decimal(4, 2),
    movie_genre varchar(10),
    price_code int NOT NULL,
    primary key (movie_num),
    foreign key (price_code) references price(price_code)
);
ALTER TABLE movie MODIFY movie_title varchar(50);

CREATE TABLE video (
	vid_num int NOT NULL,
    vid_indate varchar(10),
    movie_num int NOT NULL,
    primary key (vid_num),
    foreign key (movie_num) references movie(movie_num)
);

CREATE TABLE digitalrental (
	rent_num int NOT NULL,
    vid_num int NOT NULL,
    detail_fee decimal(3, 1),
    detail_duedate varchar(10),
    detail_returndate varchar(10),
    detail_dailylatefee int,
    primary key (rent_num, vid_num),
    foreign key (rent_num) references rental(rent_num),
    foreign key (vid_num) references video(vid_num)
);

INSERT INTO membership VALUES 
(102, 'Tami', 'Dawson', '2632 Takli Circle', 'Norene', 'TN', 37136, 11),
(103, 'Curt', 'Knight', '4025 Cornell Court', 'Flatgap', 'KY', 41219, 6),
(104, 'Jamal', 'Melendez', '788 East 145th Avenue', 'Quebeck', 'TN', 38579, 0),
(105, 'Iva', 'Mcclain', '6045 Musket Ball Circle', 'Summit', 'KY', 42783, 15),
(106, 'Miranda', 'Parks', '4469 Maxwell Place', 'Germantown', 'TN', 381183, 0),
(107, 'Rosario', 'Elliot', '7578 Danner Avenue', 'Columbia', 'TN', 38402, 5),
(108, 'Mattie', 'Guy', '4390 Evergreen Street', 'Lily', 'KY', 40740, 0),
(109, 'Clint', 'Ochoa', '1711 Elm Street', 'Greenville', 'TN', 37745, 10),
(110, 'Lewis', 'Rosales', '4524 Southwind Circle', 'Counce', 'TN', 38326, 0),
(111, 'Stacy', 'Mann', '2789 East Cook Avenue', 'Murfreesboro', 'TN', 37132, 8),
(112, 'Luis', 'Trujillo', '7267 Melvin Avenue', 'Heiskell', 'TN', 37754, 3),
(113, 'Minnie', 'Gonzales', '6430 Vasili Drive', 'Williston', 'TN', 38076, 0);

INSERT INTO rental VALUES
(1001, '01-MAR-09', 103),
(1002, '01-MAR-09', 105),
(1003, '02-MAR-09', 102),
(1004, '02-MAR-09', 110),
(1005, '02-MAR-09', 111),
(1006, '02-MAR-09', 107),
(1007, '02-MAR-09', 104),
(1008, '03-MAR-09', 105),
(1009, '03-MAR-09', 111);

INSERT INTO price VALUES
(1, 'Standard', 2, 1),
(2, 'New Release', 3.5, 3),
(3, 'Discount', 1.5, 1),
(4, 'Weekly Special', 1, .5);

INSERT INTO movie VALUES
(1234, 'The Cesar Family Christmas', 2007, 39.95, 'FAMILY', 2),
(1235, 'Smokey Mountain Wildlife', 2004, 59.95, 'ACTION', 1),
(1236, 'Richard Goodhope', 2008, 59.95, 'DRAMA', 2),
(1237, 'Beatnik Fever', 2007, 29.95, 'COMEDY', 2),
(1238, 'Constant Companion', 2008, 89.95, 'DRAMA', 2),
(1239, 'Where Hope Dies', 1998, 25.49, 'DRAMA', 3),
(1245, 'Time To Burn', 2005, 45.49, 'ACTION', 1),
(1246, "What He Doesn't Know", 2006, 58.29, 'COMEDY', 1);

INSERT INTO video VALUES
(54321, '18-JUN-08', 1234),
(54324, '18-JUN-08', 1234),
(54325, '18-JUN-08', 1234),
(34341, '22-JAN-07', 1235),
(34342, '22-JAN-07', 1235),
(34366, '02-MAR-09', 1236),
(34367, '02-MAR-09', 1236),
(34368, '02-MAR-09', 1236),
(34369, '02-MAR-09', 1236),
(44392, '21-OCT-08', 1237),
(44397, '21-OCT-08', 1237),
(59237, '14-FEB-09', 1237),
(61388, '25-JAN-07', 1239),
(61353, '28-JAN-06', 1245),
(61354, '28-JAN-06', 1245),
(61367, '30-JUL-08', 1246),
(61369, '30-JUL-08', 1246);

INSERT INTO digitalrental VALUES
(1001, 34342, 2, '04-MAR-09', '02-MAR-09', 1),
(1001, 61353, 2, '04-MAR-09', '03-MAR-09', 1),
(1002, 59237, 3.5, '04-MAR-09', '04-MAR-09', 3),
(1003, 54325, 3.5, '04-MAR-09', '09-MAR-09', 3),
(1003, 61369, 2, '06-MAR-09', '09-MAR-09', 1),
(1003, 61388, 0, '06-MAR-09', '09-MAR-09', 1),
(1004, 44392, 3.5, '05-MAR-09', '07-MAR-09', 3),
(1004, 34367, 3.5, '05-MAR-09', '07-MAR-09', 3),
(1004, 34341, 2, '07-MAR-09', '07-MAR-09', 1),
(1005, 34342, 2, '07-MAR-09', '05-MAR-09', 1),
(1005, 44397, 3.5, '05-MAR-09', '05-MAR-09', 3),
(1006, 34366, 3.5, '05-MAR-09', '04-MAR-09', 3),
(1006, 61367, 2, '07-MAR-09', null, 1),
(1007, 34368, 3.5, '05-MAR-09', null, 3),
(1008, 34369, 3.5, '05-MAR-09', '05-MAR-09', 3),
(1009, 54324, 3.5, '05-MAR-09', null, 3),
(1001, 34366, 3.5, '04-MAR-09', '02-MAR-09', 3);

-- 3
update movie
set movie_year = 2006
where movie_num = 1245;

-- 4
update movie
set price_code = 3
where movie_genre = 'ACTION';

set SQL_SAFE_UPDATES = 1;

-- 5
update price
set price_rentfee = price_rentfee + 0.5;

-- 6
select movie_title, movie_year, movie_genre
from movie;
