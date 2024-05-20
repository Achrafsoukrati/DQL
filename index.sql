-- Afficher toutes les données des clients
SELECT * FROM Customer;

-- Afficher le nom du produit et la catégorie pour les produits dont le prix est compris entre 5000 et 10000
SELECT product_name, category 
FROM Product 
WHERE Price BETWEEN 5000 AND 10000;

-- Afficher toutes les données des produits triés par ordre décroissant de prix
SELECT * 
FROM Product 
ORDER BY Price DESC;

-- Afficher le nombre total de commandes, le montant moyen, le montant total le plus élevé et le montant total le plus bas
SELECT COUNT(*) AS total_orders, 
       AVG(total_amount) AS average_amount, 
       MAX(total_amount) AS highest_total_amount, 
       MIN(total_amount) AS lowest_total_amount 
FROM Orders;

-- Pour chaque product_id, afficher le nombre de commandes
SELECT Product_id, COUNT(*) AS number_of_orders 
FROM Orders 
GROUP BY Product_id;

-- Afficher les customer_id qui ont plus de 2 commandes
SELECT Customer_id 
FROM Orders 
GROUP BY Customer_id 
HAVING COUNT(*) > 2;

-- Pour chaque mois de l'année 2020, afficher le nombre de commandes
SELECT MONTH(OrderDate) AS month, COUNT(*) AS number_of_orders 
FROM Orders 
WHERE YEAR(OrderDate) = 2020 
GROUP BY MONTH(OrderDate);

-- Pour chaque commande, afficher le nom du produit, le nom du client et la date de la commande
SELECT o.OrderDate, p.product_name, c.customer_Name 
FROM Orders o
JOIN Product p ON o.Product_id = p.Product_id
JOIN Customer c ON o.Customer_id = c.Customer_id;

-- Afficher toutes les commandes effectuées il y a trois mois
SELECT * 
FROM Orders 
WHERE OrderDate >= DATEADD(MONTH, -3, GETDATE()) 
  AND OrderDate < DATEADD(MONTH, -2, GETDATE());

-- Afficher les clients (customer_id) qui n'ont jamais commandé de produit
SELECT c.Customer_id 
FROM Customer c 
LEFT JOIN Orders o ON c.Customer_id = o.Customer_id 
WHERE o.Customer_id IS NULL;
