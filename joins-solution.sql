--1. Get all customers and their addresses.

SELECT *
FROM customers
INNER JOIN addresses
ON customers.id=addresses.customer_id;

--2. Get all orders and their line items.

SELECT *
FROM orders
INNER JOIN line_items
ON orders.id=line_items.order_id;

--3. Which warehouses have cheetos?

SELECT warehouse.warehouse, products.description, warehouse_product.on_hand
FROM warehouse
INNER JOIN warehouse_product
ON warehouse.id=warehouse_product.warehouse_id
INNER JOIN products
ON warehouse_product.product_id=products.id
WHERE products.description='cheetos';

--4. Which warehouses have diet pepsi?

SELECT warehouse.warehouse, products.description, warehouse_product.on_hand
FROM warehouse
INNER JOIN warehouse_product
ON warehouse.id=warehouse_product.warehouse_id
INNER JOIN products
ON warehouse_product.product_id=products.id
WHERE products.description='diet pepsi';

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT customers.first_name, customers.last_name, orders.order_date, orders.total
FROM customers
INNER JOIN addresses
ON customers.id=addresses.customer_id
INNER JOIN orders
ON addresses.id=orders.address_id;

--6. How many customers do we have?

SELECT count(*)
FROM customers;

--7. How many products do we carry?

SELECT count(*)
FROM products;

--8. What is the total available on-hand quantity of diet pepsi?

SELECT sum(warehouse_product.on_hand)
FROM warehouse
INNER JOIN warehouse_product
ON warehouse.id=warehouse_product.warehouse_id
INNER JOIN products
ON warehouse_product.product_id=products.id
WHERE products.description='diet pepsi';
