SELECT customer_name AS Customer, SUM(total_price) AS `Amount of Purchase`
   FROM Customer
   INNER JOIN order_header ON customer.customer_id=order_header.customer_id
   GROUP BY Customer.customer_id
   ORDER BY SUM(total_price) DESC, customer_name;