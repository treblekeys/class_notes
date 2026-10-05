# Assignment 3 Part 2 Self Grading

### 1 
```sql
SELECT movie_year, movie_title, movie_cost
FROM movie
ORDER BY movie_year desc;
```
Correct

### 2
```sql
SELECT movie_title, move_year, movie_genre
FROM movie
ORDER BY movie_genre ASC, movie_year desc;
```
Missing ASC for movie_genre, -0.5

### 3
```sql
SELECT movie_title, movie_year, movie_genre
FROM movie
WHERE movie_genre = 'ACTION';
```
Correct

### 4
```sql
SELECT movie_num, movie_title, movie_cost
FROM movie
WHERE movie_cost > 40;
```
Correct

### 5
```sql
SELECT movie_num, movie_title, price_code
FROM movie
WHERE movie_title LIKE 'R%';
```
Correct

### 6
```sql 
SELECT movie_title, movie_year, movie_cost
FROM movie
WHERE UPPER(movie_title) LIKE '%hope'
ORDER BY movie_title asc;
```
Do not have the keyword UPPER, do not know what that means or if I lose points for it.

### 7
```sql
SELECT movie_num, movie_title, movie_cost, movie_genre
FROM movie
WHERE movie_genre IN ('ACTION', 'COMEDY') OR movie_cost < 50
ORDER BY movie_genre ASC;
```
Did not group the movie_genre together with parenthesis, but it still produce the same results.

### 8
```sql
SELECT movie_genre, count(movie_genre) AS Number_of_Movie
FROM movie
GROUP BY movie_genre;
```
I did not count just the movie genre, I did count all. I also did not name it differently. Still produce the same results, but I don't know if it counts as losing points

### 9
```sql
SELECT avg(movie_cost) AS average_movie_cost
FROM movie;
```
Also forgot to rename, but not part of the questions once again and still produce the same results.

### 10
```sql 
SELECT movie_genre, round(avg(movie_cost), 2) AS average_cost
FROM movie
GROUP BY movie_genre;
```
Did not rename nor round, but results still the same and they were not part of the questions anyways.

### 11
```sql
SELECT movie_title, movie_genre, price_description, price_rentfee
FROM movie, price
WHERE movie.price_code = price.price_code;
```
Here, I used inner join instead of regular join. Because of that, I had not WHERE clause but did everything in the inner join clause.

### 12
```sql
SELECT movie_genre, round(avg(price_rentfee),2) AS average_rental_fee
FROM movie, price
WHERE movie.price_code = price.price_code
GROUP BY movie_genre;
```
Did not round nor rename, did not use WHERE because I used inner join.

### 13
```sql
SELECT movie_title, movie_year, round(movie_cost/price_rentfee,2) AS breakeven_rentals
FROM movie, price
WHERE movie.price_code = price.price_code;
```
Did not round, used inner join

### 14
```sql
SELECT movie_title, movie_year
FROM movie, price
WHERE movie.price_code = price.price_code;
```
I added an extra clause where price_code is not null, but I do not think it was needed.

### 15
```sql
SELECT movie_title, movie_year, movie_cost
FROM movie
WHERE movie_cost BETWEEN 44.99 AND 49.99;
```
Correct

### 16
```sql
SELECT movie_title, movie_year, price_description, price_rentfee, movie_genre
FROM movie, price
WHERE movie.price_code = price.price_code AND UPPER(movie_genre) IN ('FAMILY', 'COMEDY', 'DRAMA');
```
Did not group them in parenthesis and used inner join

### 17
```sql
SELECT movie_num, movie_title, movie_year
FROM movie
WHERE movie.movie_num NOT IN ( 
    SELECT movie_num 
    FROM video
);
```
I used WHERE NOT EXIST instead of NOT IN, and I have an extra WHERE clause inside the subquery. 

### 18
```sql
SELECT distinct membership.mem_num, mem_fname, mem_fname, mem_balance
FROM membership, rental
WHERE membership.mem_num = rental.mem_num
ORDER BY mem_num;
```
I added a while subquery when I could have just used the keyword DISTINCT. 
-0.5
Also forgot ORDER BY
-0.5

### 19
```sql
SELECT MIN(membership.mem_balance) AS minimum_balance, MAX(membership.mem_balance) AS max_balance, AVG(membership.mem_balance) AS average_balance
FROM membership, (SELECT distinct mem_num FROM rental) rental
WHERE membership.mem_num = rental.mem_num;
```
Both mine and the professor's will produce the same result and do the same thing, but the syntax is different. 

### 20
```sql
SELECT rental.rent_num, rent_date, video.vid_num, movie_title, detail_duedate, detail_returndate
FROM rental, video, movie, detailrental
WHERE rental.rent_num = detailrental.rent_num AND movie.movie_num = video.movie_num AND video.vid_num = detailrental.vid_num AND detail_returndate > detail_duedate
ORDER BY rent_num, movie_title;
```
Correct, I just used inner join instead of regular join

### 21
```sql
SELECT rental.rent_num, rent_date, video.vid_num, movie_title, detail_duedate, detail_returndate, detail_fee, detail_returndate - detail_duedate AS days_past_due
FROM rental, video, movie, detailrental
WHERE rental.rent_num = detailrental.rent_num AND movie.movie_num = video.movie_num AND video.vid_num = detailrental.vid_num AND detail_returndate > detail_duedate
ORDER BY rent_num, movie_title;
```
I used `datediff` instead of subtracting the dates. Result is still the same. 

### 22
```sql
SELECT rental.rent_num, rent_date, movie_title, detail_fee
FROM rental, video, movie, detailrental
WHERE rental.rent_num = detailrental.rent_num AND movie.movie_num = video.movie_num AND video.vid_num = detailrental.vid_num AND detail_returndate <= detail_duedate
ORDER BY rental.rent_num, movie_title;
```
Forgot to add ORDER BY
-0.5

### 23
```sql 
SELECT q.mem_num, q.mem_lname, q.mem_fname, sum(t.detail_fee) AS rental_fee_revenue
FROM (
    SELECT membership.mem_num, membership.mem_lname, membership.mem_fname, rental.rental_num
    FROM membership, rental
    WHERE membership.mem_num = rental.mem_num
    ) q,
    (
    SELECT rental.rent_num, detailrental.detail_fee
    FROM rental,detailrental
    WHERE rental.rent_num = detailrental.rent_num
    ) t
WHERE q.rent_num = t.rent_num
GROUP BY mem_num, mem_lname, mem.fname
ORDER BY mem_num;
```
I did not use the subqueries that the professor created, results are the same, but I do not know if I lose points for that.

### 24
```sql
SELECT q.movie_num, q.movie_genre, round(t.average_cost, 2), q.movie_cost, format((q.movie_cost - t.average_cost) / t.average_cost * 100, '0.00') AS percent_difference
FROM (
    SELECT movie_num, movie_genre, movie_cost
    FROM movie
    ) q,
    (
    SELECT movie_genre, avg(movie_cost) as averae_cost
    FROM movie
    GROUP BY movie_genre
    ) t
WHERE q.movie_genre = t.movie_genre
ORDER BY movie_num;
```
