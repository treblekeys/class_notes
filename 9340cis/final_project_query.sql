CREATE TABLE customer (
    customerID varchar(50) NOT NULL,
    customerName varchar(100),
    customerInfo varchar(200),
    customerEmail varchar(30)
);

CREATE TABLE payment (
    paymentType varchar(50) NOT NULL,
    serialNum int,
    invoiceNum int
);

CREATE TABLE department (
    departmentID varchar(50) NOT NULL,
    departmentName varchar(100),
    departmentType varchar(50)
);

CREATE TABLE supplier (
    supplierID varchar(50) NOT NULL,
    supplierName varchar(100),
    phoneNum varchar(10),
    location varchar(50)
);

CREATE TABLE inventory (
    inventoryNum int NOT NULL
);

CREATE TABLE inventory_check (
    inventoryNum int NOT NULL,
    employeeID varchar(50),
    checkDate varchar(10)
);

CREATE TABLE employee (
    employeeID varchar(50) NOT NULL,
    firstName varchar(20),
    lastName varchar(20),
    dateOfBirth varchar(10),
    ssn varchar(9),
    departmentID varchar(50),
    managerID varchar(50)
);

CREATE TABLE manager (
    managerID varchar(50) NOT NULL,
    employeeID varchar(50)
);

CREATE TABLE purchase_order (
    orderID varchar(50) NOT NULL,
    customerID varchar(50)
);

CREATE TABLE invoice (
    invoiceNum int NOT NULL,
    orderID varchar(50)
);

CREATE TABLE orderline_item (
    itemID varchar(50) NOT NULL,
    orderID varchar(50),
    productID varchar(50)
);

CREATE TABLE package (
    packageNum varchar(50) NOT NULL,
    orderID varchar(50)
);

CREATE TABLE product (
    productID varchar(50) NOT NULL,
    productName varchar(50),
    price varchar(20),
    stockLevel varchar(50),
    productType varchar(20),
    supplierID varchar(50)
);

CREATE TABLE package_product (
    packageNum int NOT NULL,
    productID varchar(50)
);

CREATE TABLE product_categories (
    productType varchar(20) NOT NULL,
    productID varchar(50)
);

CREATE TABLE product_processing (
    productID varchar(50) NOT NULL,
    employeeID varchar(50),
    processedDate varchar(10)
);

-- Adding primary keys to the tables using ALTER TABLE
ALTER TABLE customer ADD PRIMARY KEY (customerID);
ALTER TABLE payment ADD PRIMARY KEY (paymentType);
ALTER TABLE department ADD PRIMARY KEY (departmentID);
ALTER TABLE supplier ADD PRIMARY KEY (supplierID);
ALTER TABLE inventory ADD PRIMARY KEY (inventoryNum);
ALTER TABLE inventory_check ADD PRIMARY KEY (inventoryNum, employeeID);
ALTER TABLE employee ADD PRIMARY KEY (employeeID);
ALTER TABLE manager ADD PRIMARY KEY (managerID);
ALTER TABLE purchase_order ADD PRIMARY KEY (orderID);
ALTER TABLE invoice ADD PRIMARY KEY (invoiceNum);
ALTER TABLE orderline_item ADD PRIMARY KEY (itemID);
ALTER TABLE package ADD PRIMARY KEY (packageNum);
ALTER TABLE product ADD PRIMARY KEY (productID);
ALTER TABLE package_product ADD PRIMARY KEY (packageNum, productID);
ALTER TABLE product_categories ADD PRIMARY KEY (productType);
ALTER TABLE product_processing ADD PRIMARY KEY (productID, employeeID);

-- Adding foreign keys to table using ALTER TABLE
ALTER TABLE payment ADD CONSTRAINT invoice_for_payment FOREIGN KEY (invoiceNum) REFERENCES invoice (invoiceNum);
ALTER TABLE employee ADD CONSTRAINT employee_in_department FOREIGN KEY (departmentID) REFERENCES department (departmentID);
ALTER TABLE employee ADD CONSTRAINT employee_manager FOREIGN KEY (managerID) REFERENCES manager (managerID);
ALTER TABLE manager ADD CONSTRAINT manager_employee FOREIGN KEY (employeeID) REFERENCES employee (employeeID);
ALTER TABLE purchase_order ADD CONSTRAINT customer_purchase_orders FOREIGN KEY (customerID) REFERENCES customer (customerID);
ALTER TABLE invoice ADD CONSTRAINT invoice_order FOREIGN KEY (orderID) REFERENCES purchase_order (orderID);
ALTER TABLE orderline_item ADD CONSTRAINT orderline_purchase_order FOREIGN KEY (orderID) REFERENCES purchase_order (orderID);
ALTER TABLE orderline_item ADD CONSTRAINT orderline_product FOREIGN KEY (productID) REFERENCES product (productID);
ALTER TABLE package ADD CONSTRAINT package_order FOREIGN KEY (orderID) REFERENCES purchase_order (orderID);
ALTER TABLE product ADD CONSTRAINT product_producttype FOREIGN KEY (productType) REFERENCES product_categories (productType);
ALTER TABLE product ADD CONSTRAINT product_supplier FOREIGN KEY (supplierID) REFERENCES supplier (supplierID);
