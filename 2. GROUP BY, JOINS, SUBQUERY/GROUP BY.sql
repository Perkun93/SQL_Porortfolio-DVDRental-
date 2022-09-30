/*
 * nauczymy sie dzis nowej funkcji grupopania 
 * jak wiesz z poprzednich wierszow do filtrowaia uzywany WHARE 
 * lecz mozemy pogrupowac nasze wyniki wzgledem czegos np imienia nazwiska kraju pochodzenia czy nawet ilosci zamowien ....
 *  wiec co zrob my to sprawdzmy jak to dziala
 * uzywajac i uczac sie group by  
 */

SELECT *
FROM customer c 

/*
 * mamy juz wszuuystki customerow uzywajac aliasow tzn podpisania kolumn 
 * zobaczmy ile klientow w danym sklepie
 * pogrupujemy klientow po customer id kazdy klient ma unikalne customer id 
 */


SELECT store_id, count(customer_id) AS ALL_transaction 
FROM customer c 
GROUP BY 1

/*
 * brawo mamy to jak widzisz w store id 1 bylo najwiecej tranzakcji 
 */

/*
 * sprawdmy ktroy sklep dal najwiecej tranzakcji
 */

SELECT staff_id , count(*)
FROM payment p 
GROUP BY 1 
ORDER BY count(*) DESC  

/*
 * a teraz zobaczmy jaka byla ich suma 
 */


SELECT staff_id , count(*) AS transctions ,  sum(amount) AS sum_of_amount 
FROM payment p 
GROUP BY 1 
ORDER BY sum(amount) DESC 

/*
 * sql wciaga. juz wiez ktory sklep jest najbardzeiej dochodowu
 * ale pamietaj uzywajac group by i order by musisz sortowac zawsze po pelnej nazwie 
 * uzytej w select. sql nie lubi aliasow w order by 
 */

/*
 * check stock inventory group by film id 
 */

SELECT *
FROM inventory i 

SELECT store_id , count( store_id), film_id 
FROM inventory i
GROUP BY  1,3
ORDER BY count(store_id) DESC

SELECT store_id , count( store_id), film_id 
FROM inventory i
GROUP BY  1,3
HAVING  store_id = 1
ORDER BY count(store_id) DESC


SELECT store_id , count( store_id), film_id 
FROM inventory i
WHERE film_id = 120
GROUP BY  1,3
HAVING  store_id = 1


/*
 * SQL lubi kolejnosc 
 * 1. SELECT
 * 2. FROM
 * 3. JOIN (later)
 * 4. WHERE
 * 5. GROUP BY
 * 6. HAVING
 * 7. ORDER BY 
 * 8. LIMIT
 */

/*
 * pratcise with group by and where 
 * 
 */

SELECT customer_id, sum(amount)
FROM payment p 
GROUP BY 1 

SELECT customer_id, sum(amount)
FROM payment p 
WHERE customer_id != (184)
GROUP BY 1 
/*
 * as you se != return us all with out customer id =1
 * i show you chow select more 
 */

SELECT customer_id, sum(amount)
FROM payment p 
WHERE customer_id NOT IN  (87,477,273,51)
GROUP BY 1 
HAVING sum(amount) > 100

SELECT customer_id, sum(amount), count(customer_id) AS transactions  
FROM payment p 
WHERE customer_id NOT IN  (87,477,273,51)
GROUP BY 1 
HAVING sum(amount) > 100
ORDER BY count(customer_id) DESC 

SELECT count(*)
FROM payment p 
WHERE customer_id = 148

/*
 * we will relationsship beetwen mpaa rating and a replemace cost 
 */

SELECT *
FROM film f


SELECT rating , avg(replacement_cost)
FROM film f 
GROUP BY 1

/*
 * great job but looks on numbers its not looking good 
 * lets use ROUND 
 */

SELECT rating , ROUND(AVG(replacement_cost), 2) AS avg_replacement_cost
FROM film f 
GROUP BY 1
ORDER BY AVG(replacement_cost) DESC 

/*
 * now we chceck top 5 customer id 
 */

SELECT customer_id, sum(amount) 
FROM payment p 
GROUP BY 1
ORDER BY sum(amount) DESC 
LIMIT 5



SELECT film_id 
FROM inventory i 
WHERE film_id = 172 AND store_id = 1

select  * from payment p 

SELECT customer_id ,first_name,last_name, email, count(payment_id), sum(amount) 
FROM payment p
INNER JOIN customer c 
USING (customer_id)
GROUP BY 1 
ORDER BY count(payment_id) DESC
LIMIT 5



/*
*ile filmow w danym jezyku]
*srednia dlugosc filmu w oparciu o sklep
*stock sklepu 
*procent zarobku sklepu
 *procent zarabku sklepu w oparciu o date 
*/




SELECT *
FROM address a 

SELECT *
FROM city c 

SELECT *
FROM country c 

/*
 * top order city sale
 */
	
 

SELECT district AS City,count(DISTINCT city_id) AS sum_city  
FROM address a 
GROUP BY 1
ORDER BY count(DISTINCT city_id) DESC 
