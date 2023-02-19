-- EXERCISE 1 

--  Classés par prix du plus bas au plus élevé.
SELECT * FROM items ORDER BY price ASC;

-- Classés par prix du plus élevé au     plus bas.
SELECT * FROM items ORDER BY price DESC;

-- Classés les 3 premiers clients par ordre alphabétique du prénom (AZ).
SELECT * FROM customers LIMIT 3;

-- Classés les noms de famille dans l'ordre alphabétique inverse (ZA).
SELECT last_name FROM customers ORDER BY last_name DESC;


-- EXERCISE 2

--Ecrire une requête pour sélectionner toutes les colonnes de la table « customers »
SELECT * FROM customer;

-- Écrire une requête pour afficher les noms ( first_name , last_name ) en utilisant un alias nommé « full_name ».
 SELECT customer_id, CONCAT(first_name,' ', last_name) AS full_name FROM customer;

-- Sélectionner tous les create_date de la table « customer » (il ne doit pas y avoir de doublons).
SELECT DISTINCT create_date FROM customer;

-- Écrire une requête pour obtenir tous les détails du client à partir de la table des clients, elle doit être affichée dans l'ordre décroissant de leur prénom.
SELECT * FROM customer ORDER BY first_name DESC;

-- Rédigez une requête pour obtenir l'ID du film, le titre, la description, l'année de sortie et le tarif de location par ordre croissant en fonction de leur tarif de location.
SELECT film_id, title, description, release_year, rental_rate FROM film ORDER BY rental_rate ASC;

-- Écrivez une requête pour obtenir l'adresse et le numéro de téléphone de tous les clients vivant dans le district du Texas, ces détails peuvent être trouvés dans le tableau "adresse".
SELECT address, phone FROM address WHERE district IN ('Texas');

-- Écrivez une requête pour récupérer tous les détails du film où l'identifiant du film est 15 ou 150.)
SELECT DISTINCT * FROM film WHERE (film_id = 15) OR (film_id = 150);

-- Écrivez une requête qui devrait vérifier si votre film préféré existe dans la base de données. Demandez à votre requête d'obtenir l'ID du film, le titre, la description, la durée et le tarif de location, ces détails peuvent être trouvés dans le tableau "film".
SELECT DISTINCT film_id, title, description, rental_duration, rental_rate FROM film WHERE title IN ('Tarzan');

--  Écrivez une requête pour obtenir l'ID du film, le titre, la description, la durée et le tarif de location de tous les films commençant par les deux premières lettres de votre film préféré.
SELECT film_id, title, description, rental_duration, rental_rate FROM film WHERE title LIKE 'Ta%';

-- Écrivez une requête qui trouvera les 10 films les moins chers.
SELECT * FROM film ORDER BY rental_rate ASC LIMIT 10;

--  Écrivez une requête qui trouvera les 10 prochains films les moins chers.(Essayez de ne pas utiliser LIMIT)
 

--  Écrivez une requête qui joindra les données de la table des clients et de la table des paiements.
SELECT customer.first_name, customer.last_name, payment.payment_date, payment.amount FROM customer INNER JOIN payment ON customer.customer_id = payment.customer_id ORDER BY payment.customer_id ASC;

-- Écrivez une requête pour obtenir tous les films qui ne sont pas dans l'inventaire.
SELECT * FROM film LEFT JOIN inventory ON film.film_id = inventory.film_id WHERE inventory.inventory_id IS NULL;

-- Rédigez une requête pour trouver quelle ville se trouve dans quel pays.
SELECT city.city, country.country FROM city JOIN country ON city.country_id = country.country_id

-- Écrivez une requête pour obtenir l'identifiant du client, ses noms (prénom et nom), le montant et la date de paiement commandé par l'identifiant du membre du personnel qui lui a vendu le dvd.
SELECT customer.customer_id, customer.first_name, customer.last_name, payment.amount , payment.payment_date FROM payment INNER JOIN customer ON payment.customer_id = customer.customer_id INNER JOIN staff ON payment.staff_id = staff.staff_id;