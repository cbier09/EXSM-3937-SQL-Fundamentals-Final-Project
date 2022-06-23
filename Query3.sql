SELECT SUM(order_qty) AS `Number of Products Sold`, product_name AS `Product Name`
   FROM Order_Detail
   INNER JOIN Product ON Order_Detail.product_id=Product.product_id
   GROUP BY Product.product_id
   ORDER BY SUM(order_qty) DESC, product_description DESC;