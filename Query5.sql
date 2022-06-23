SELECT SUM(order_qty) AS `Number of Guitars Sold`
   FROM Order_Detail
   INNER JOIN Product ON Order_Detail.product_id=Product.product_id
   WHERE product_description LIKE '%guitar%';