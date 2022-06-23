SELECT customer_name AS Customer, COUNT(order_header_id) AS `Number of Purchases`
   FROM Customer
   INNER JOIN order_header ON customer.customer_id=order_header.customer_id
   GROUP BY Customer.customer_id
   ORDER BY COUNT(order_header_id) DESC, customer_name;
