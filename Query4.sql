SELECT Order_Header.order_header_id, product_name, order_qty, customer_name, order_date, total_price
   FROM Order_Header
   INNER JOIN Customer ON Order_Header.customer_id=Customer.customer_id
   INNER JOIN Order_Detail ON Order_Header.order_header_id=Order_Detail.order_header_id
   INNER JOIN Product ON Order_detail.product_id=Product.product_id
   WHERE order_date BETWEEN '2022-01-01' AND '2022-01-07'
   ORDER BY order_date;