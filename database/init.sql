-- Arquivo: ./database/init.sql

-- ----------------------------
-- CRIAÇÃO DAS TABELAS
-- ----------------------------

-- Tabela para Category
CREATE TABLE IF NOT EXISTS Category (
    "categoryId" INT PRIMARY KEY,
    "categoryName" VARCHAR(255) NOT NULL,
    "parentCategoryId" INT,
    "userId" INT
);

-- Tabela para Customer
CREATE TABLE IF NOT EXISTS Customer (
    "custId" INT PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "mobileNo" VARCHAR(20) NOT NULL,
    "password" VARCHAR(255) NOT NULL
);

-- Tabela para Products
CREATE TABLE IF NOT EXISTS Products (
    "productId" INT PRIMARY KEY,
    "productSku" VARCHAR(255),
    "productName" VARCHAR(255) NOT NULL,
    "productPrice" DECIMAL(10, 2) NOT NULL,
    "productShortName" VARCHAR(255),
    "productDescription" TEXT,
    "createdDate" TIMESTAMP,
    "deliveryTimeSpan" VARCHAR(255),
    "categoryId" INT,
    "productImageUrl" TEXT,
    "categoryName" VARCHAR(255),
    FOREIGN KEY ("categoryId") REFERENCES Category("categoryId")
);

-- Tabela para Cart
CREATE TABLE IF NOT EXISTS Cart (
    "cartId" INT PRIMARY KEY,
    "custId" INT,
    "productId" INT,
    "quantity" INT,
    "productShortName" VARCHAR(255),
    "addedDate" TIMESTAMP,
    "productName" VARCHAR(255),
    "categoryName" VARCHAR(255),
    "productImageUrl" TEXT,
    "productPrice" DECIMAL(10, 2),
    FOREIGN KEY ("custId") REFERENCES Customer("custId"),
    FOREIGN KEY ("productId") REFERENCES Products("productId")
);

-- Tabela para Login
-- Note: A tabela de Login parece estar diretamente relacionada à Customer,
-- mas vamos criar uma tabela separada baseada nos dados fornecidos.
CREATE TABLE IF NOT EXISTS Login (
    "UserName" VARCHAR(255) PRIMARY KEY,
    "UserPassword" VARCHAR(255) NOT NULL
);

-- ----------------------------
-- INSERÇÃO DE DADOS
-- ----------------------------

-- Dados para a tabela Category
INSERT INTO Category ("categoryId", "categoryName", "parentCategoryId", "userId") VALUES
(55, 'Fruits & Vegetables', 0, NULL),
(56, 'Foodgrains', 0, NULL),
(57, 'Bakery', 0, NULL),
(58, 'Beverages', 0, NULL),
(59, 'Snacks', 0, NULL),
(61, 'Cuts & Sprouts', 55, NULL),
(63, 'Exotic Fruits ', 55, NULL),
(64, 'Flower Bouquets', 55, NULL),
(65, 'Flours & Sooji', 56, NULL),
(66, 'Dry Fruits', 56, NULL),
(67, 'Edible Oils', 56, NULL),
(68, 'Bakery Snacks', 57, NULL),
(69, 'Cakes & Pastries', 57, NULL),
(75, 'Snacks', 0, NULL),
(76, 'soft drinks', 0, NULL),
(83, 'Fragrances', 0, NULL),
(89, 'T-shirts', 0, NULL),
(131, 'Technology', 0, 0),
(142, 'Drinks', 0, NULL),
(143, 'Toy', 0, NULL),
(168, 'Cars & Busses', 0, NULL),
(170, 'Clothes', 0, NULL),
(171, 'string', 0, 0),
(172, 'BabyProducts', 1, 10),
(173, 'Electronics', 2, 10),
(174, 'Clothings', 3, 10),
(175, 'Fruits', 0, 0),
(176, 'Vegetables', 0, 0),
(186, 'Bricolage', 0, NULL),
(189, 'Dumbshalllords', 20, 2),
(190, 'baniayan', 54, 2);

-- Dados para a tabela Products
-- INSERT INTO Products ("productId", "productSku", "productName", "productPrice", "productShortName", "productDescription", "createdDate", "deliveryTimeSpan", "categoryId", "productImageUrl", "categoryName") VALUES
-- (3969, 'jkl', 'Watch21', 66.00, 'wt', 'Beautiful watch', '2025-09-16 12:43:55.973', '1-2 days', 173, 'https://images.pexels.com/photos/2373730/pexels-photo-2373730.jpeg?auto=compress&cs=tinysrgb&w=600', 'Electronics');

-- Dados para a tabela Cart
-- INSERT INTO Cart ("cartId", "custId", "productId", "quantity", "productShortName", "addedDate", "productName", "categoryName", "productImageUrl", "productPrice") VALUES
-- (9522, 2576, 687, 1, 'Watch', '2025-09-17 11:11:26.487', 'Alphanso Watch1', 'Exotic Fruits ', 'https://images.unsplash.com/photo-1610689057803-1b1fe41f2dde?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nzl8fHdhdGNoc3xlbnwwfHwwfHx8MA%3D%3D', 60.00);

-- Dados para a tabela Customer
-- INSERT INTO Customer ("custId", "name", "mobileNo", "password") VALUES
-- (381, 'meeee', '111111112', '1119');

-- Dados para a tabela Login
-- INSERT INTO Login ("UserName", "UserPassword") VALUES
-- ('string', 'string');

-- Exemplo: você pode adicionar mais dados aqui