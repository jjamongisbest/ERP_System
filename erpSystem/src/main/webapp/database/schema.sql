


CREATE TABLE customer_grade(
customer_grade_id INT(6) PRIMARY KEY,
customer_grade CHAR(6) NOT NULL
);



CREATE TABLE customer(
customer_id INT(6) PRIMARY KEY,
customer_grade_id INT(6),
customer_name VARCHAR(50) NOT NULL,
customer_address VARCHAR(100) NOT NULL,
customer_phone VARCHAR(50) NOT NULL,
customer_gender VARCHAR(50) NOT NULL,
FOREIGN KEY (customer_grade_id) REFERENCES customer_grade(customer_grade_id)
);



CREATE TABLE board_category(
board_category_id INT(2) PRIMARY KEY,
board_category_name VARCHAR(10) NOT NULL
);



CREATE TABLE board(
board_id INT(6) PRIMARY KEY,
board_title VARCHAR(100) NOT NULL,
board_main VARCHAR(4000) NOT NULL,
board_modified_date DATE NOT NULL,
board_registered_date DATE NOT NULL,
board_writer_id INT(6),
board_category_id INT(2) NOT NULL,
FOREIGN KEY (board_writer_id) REFERENCES customer(customer_id),
FOREIGN KEY (board_category_id) REFERENCES board_category(board_category_id)
);



CREATE TABLE product_category(
Product_category_id INT(6) PRIMARY KEY,
Product_category_name VARCHAR(50)
);



CREATE TABLE product(
product_id INT(6) PRIMARY KEY,
product_name VARCHAR(50) NOT NULL,
product_memo VARCHAR(4000),
product_handle_date DATE,
Product_stock VARCHAR(50) NOT NULL,
product_pipe_line VARCHAR(50) NOT NULL,
product_price VARCHAR(50) NOT NULL,
product_category_id INT(6),
FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id)
);



CREATE TABLE sales_order(
order_id INT(6) PRIMARY KEY,
customer_id INT(6),
order_date DATE NOT NULL,
order_total_price VARCHAR(50) NOT NULL,
order_status CHAR(2) NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);



CREATE TABLE order_product(
order_details_id INT(6) PRIMARY KEY,
product_id INT(6),
order_id INT(6),
order_product VARCHAR(50) NOT NULL,
order_quantity VARCHAR(10) NOT NULL,
FOREIGN KEY (product_id) REFERENCES product(product_id),
FOREIGN KEY (order_id) REFERENCES sales_order(order_id)
);



CREATE TABLE customer_log(
change_date DATE NOT NULL,
change_log_id INT(6),
customer_id INT(6),
pre_grade_id INT(6),
post_grade_id INT(6) NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
FOREIGN KEY (pre_grade_id) REFERENCES customer_grade(customer_grade_id),
FOREIGN KEY (post_grade_id) REFERENCES customer_grade(customer_grade_id),
PRIMARY KEY (change_date, change_log_id)
);