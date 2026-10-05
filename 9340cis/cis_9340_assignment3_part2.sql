-- 1
SELECT movie_year, movie_title, movie_cost
FROM movie
ORDER BY movie_year DESC;

-- 2
SELECT movie_title, movie_year, movie_genre
FROM movie
ORDER BY movie_genre, movie_year DESC;

-- 3
SELECT movie_title, movie_year, movie_genre
FROM movie
WHERE movie_genre = "ACTION";

-- 4
SELECT movie_num, movie_title, movie_cost
FROM movie
WHERE movie_cost > 40;

-- 5
SELECT movie_num, movie_title, price_code
FROM movie
WHERE movie_title LIKE 'R%';

-- 6
SELECT movie_title, movie_year, movie_cost
FROM movie
WHERE movie_title LIKE '%hope%'
ORDER BY movie_title;

-- 7
SELECT movie_num, movie_title, movie_cost, movie_genre
FROM movie
WHERE movie_genre = 'ACTION' OR movie_genre = 'COMEDY' OR movie_cost < 50
ORDER BY movie_genre;

-- 8
SELECT movie_genre, COUNT(*)
FROM movie
GROUP BY movie_genre;

-- 9
SELECT AVG(movie_cost)
FROM movie;

-- 10
SELECT movie_genre, AVG(movie_cost)
FROM movie
GROUP BY movie_genre;

-- 11
SELECT movie_title, movie_genre, price_description, price_rentfee
FROM movie
INNER JOIN price ON movie.price_code = price.price_code;

-- 12 
SELECT movie_genre, AVG(price_rentfee)
FROM movie
INNER JOIN price ON movie.price_code = price.price_code
GROUP BY movie_genre;

-- 13
SELECT movie_title, movie_year, movie_cost/price_rentfee
FROM movie
INNER JOIN price ON movie.price_code = price.price_code;

-- 14
SELECT movie_title, movie_year
FROM movie
INNER JOIN price ON movie.price_code = price.price_code
WHERE movie.price_code IS NOT NULL;

-- 15
SELECT movie_title, movie_year, movie_cost
FROM movie
WHERE movie_cost BETWEEN 44.99 AND 49.99;

-- 16
SELECT movie_title, movie_year, price_description, price_rentfee, movie_genre
FROM movie
INNER JOIN price ON movie.price_code = price.price_code
WHERE movie_genre = 'FAMILY' OR movie_genre = 'COMEDY' OR movie_genre = 'DRAMA';

-- 17
SELECT movie_num, movie_title, movie_year
FROM movie
WHERE NOT EXISTS (
	SELECT movie_num
    FROM video
    WHERE movie.movie_num = video.movie_num
);

-- 18
SELECT mem_num, mem_fname, mem_lname, mem_balance
FROM membership
WHERE EXISTS (
	SELECT mem_num
    FROM rental
    WHERE membership.mem_num = rental.mem_num
);

-- 19
SELECT MIN(mem_balance), MAX(mem_balance), AVG(mem_balance)
FROM membership
WHERE EXISTS (
	SELECT mem_num
    FROM rental
    WHERE membership.mem_num = rental.mem_num
);

-- 20
SELECT rental.rent_num, rent_date, video.vid_num, movie_title, detail_duedate, detail_returndate
FROM rental
INNER JOIN digitalrental ON rental.rent_num = digitalrental.rent_num
INNER JOIN video ON video.vid_num = digitalrental.vid_num
INNER JOIN movie ON movie.movie_num	= video.movie_num
WHERE digitalrental.detail_returndate > digitalrental.detail_duedate
ORDER BY rental.rent_num, movie.movie_title;

-- 21
SELECT rental.rent_num, rent_date, video.vid_num, movie_title, detail_duedate, detail_returndate, datediff(detail_returndate, detail_duedate)
FROM rental
INNER JOIN digitalrental ON rental.rent_num = digitalrental.rent_num
INNER JOIN video ON video.vid_num = digitalrental.vid_num
INNER JOIN movie ON movie.movie_num	= video.movie_num
WHERE digitalrental.detail_returndate > digitalrental.detail_duedate
ORDER BY rental.rent_num, movie.movie_title;