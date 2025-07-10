

/* CREATE DATBASE DMDDP4 */
CREATE DATABASE [DMDDP4]
--------------------------------------------------------------------------


/* CREATE table category */
CREATE TABLE [dbo].[category] (
  [categoryID] int NOT NULL,
  [categoryName] varchar(30) NOT NULL,
  [categoryDescription] varchar(200) NOT NULL,
  [categoryPicture] varbinary(max),
  CONSTRAINT prim_Key PRIMARY KEY CLUSTERED ([categoryID] ASC),
  )
ON [PRIMARY]

--Add a CHECK FOR Category Table --
ALTER TABLE [dbo].[category] ADD CONSTRAINT CHK_CategoryID CHECK (categoryID > 0 );  
GO


--------------------------------------------------------------------------


/* CREATE table creditcard */
CREATE TABLE [dbo].[creditcard] (
  [creditCardNo] varchar(45) NOT NULL,
  [customerID] int NOT NULL,
  [SetAsPrimary] varchar(20) NOT NULL,
  [creditCardType] varchar(20),
  [cardExpiry] varchar(20),
  CONSTRAINT prim_key_creditcard PRIMARY KEY NONCLUSTERED ([creditCardNo]),
  )
ON [PRIMARY]

-- Add and CHECK Constraint FOREIGN KEY for CreditCard Table --
ALTER TABLE [dbo].[creditcard] WITH CHECK ADD CONSTRAINT foreign_CustomerID_CreditCard
FOREIGN KEY ([customerID]) REFERENCES [dbo].[customer] ([customerID])


--------------------------------------------------------------------------


/* CREATE table customer */
CREATE TABLE [dbo].[customer] (
  [customerID] int NOT NULL,
  [customerFirstName] varchar(45) NOT NULL,
  [customerLastName] varchar(45) NOT NULL,
  [customerPhoneNo] varchar(45),
  [customerEmail] varchar(45) NOT NULL

  CONSTRAINT prim_Key_customer PRIMARY KEY CLUSTERED ([customerID] ASC),
  )
ON [PRIMARY]

--Add a CHECK for CustomerPhoneNo in customer Table --
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT CHK_PhoneNo 
CHECK (customerPhoneNo NOT LIKE '%[^0-9]%')


--------------------------------------------------------------------------


/* CREATE table customerAddress */
CREATE TABLE [dbo].[customerAddress] (
  [customerAddressID] int NOT NULL,
  [customerID] int NOT NULL,
  [street] varchar(20) NOT NULL,
  [city] varchar(20) NOT NULL,
  [PostalCode] varchar(20) NOT NULL,
  [useAsBillingAddress] varchar(20) NOT NULL

  CONSTRAINT prim_Key_customerAddress PRIMARY KEY CLUSTERED ([customerAddressID] ASC),
  )
ON [PRIMARY]

-- Add a CHECK CONSTRAINT FOREIGN KEYS for CustomerAddress Table --
ALTER TABLE [dbo].[customerAddress]  WITH CHECK ADD CONSTRAINT foreign_customerAddress 
FOREIGN KEY ([customerID]) REFERENCES [dbo].[customer] ([customerID])

-- Add CHECK CONSTRAINT for PHONE No in CustomerFeedbackTable --
ALTER TABLE [dbo].[customerAddress]  WITH CHECK ADD CONSTRAINT CHK_PostalCode_customerAddress 
CHECK (PostalCode NOT LIKE '%[^0-9]%')


--------------------------------------------------------------------------


/* CREATE table customerFeedback */
CREATE TABLE [dbo].[customerFeedback] (
  [FeedbackID] int NOT NULL,
  [customerID] int NOT NULL,
  [orderID] int NOT NULL,
  [productRating] decimal(2,1),
  [shippingRating]  decimal(2,1),
  [experienceRating] decimal(2,1)

  CONSTRAINT prim_Key_customerFeedback PRIMARY KEY NONCLUSTERED ([FeedbackID] ASC),
  )
ON [PRIMARY]

-- Add CHECK CONSTRAINT FOREIGN KEYS for CustomerFeedback Table--
ALTER TABLE [dbo].[customerFeedback]  WITH CHECK ADD CONSTRAINT foreign_key_customer_customerFeedback 
FOREIGN KEY ([customerID]) REFERENCES [dbo].[customer] ([customerID])

ALTER TABLE [dbo].[customerFeedback]  WITH CHECK ADD CONSTRAINT foreign_key_order_customerFeedback 
FOREIGN KEY ([orderID]) REFERENCES [dbo].[order] ([orderID])

-- Add CHECK CONSTRAINT for COLUMN VALUES in CustomerFeedbackTable --
ALTER TABLE [dbo].[customerFeedback] WITH CHECK ADD  CONSTRAINT CHK_productRating 
CHECK ([productRating] > 0 AND [productRating] <= 5);

ALTER TABLE [dbo].[customerFeedback] WITH CHECK ADD  CONSTRAINT CHK_shippingRating 
CHECK ([shippingRating] > 0 AND [shippingRating] <= 5);

ALTER TABLE [dbo].[customerFeedback] WITH CHECK ADD  CONSTRAINT CHK_experienceRating 
CHECK ([experienceRating] > 0 AND [experienceRating] <= 5);


--------------------------------------------------------------------------


/* CREATE table order */
CREATE TABLE [dbo].[order] (
  [orderID] int NOT NULL,
  [orderDate] date NOT NULL,
  [customerID] int NOT NULL,
  [orderTotal] varchar(20) NOT NULL,
  [shipmentID] int NOT NULL,
  [orderTime] time

  CONSTRAINT prim_Key_order PRIMARY KEY CLUSTERED ([orderID] ASC),
  )
ON [PRIMARY]

-- Add CHECK CONSTRAINT FOREIGN KEYS for order Table--
ALTER TABLE [dbo].[order] WITH CHECK ADD CONSTRAINT foreign_key_customer_order 
FOREIGN KEY ([customerID]) REFERENCES [dbo].[customer] ([customerID])

ALTER TABLE [dbo].[order] WITH CHECK ADD CONSTRAINT foreign_key_shipment_order 
FOREIGN KEY ([shipmentID]) REFERENCES [dbo].[shipment] ([shipmentID])

--Add a CHECK for OrderID in order Table --
ALTER TABLE [dbo].[order] WITH CHECK ADD CONSTRAINT CHK_orderID CHECK (orderID > 0);


--------------------------------------------------------------------------


/* CREATE table orderDetails */
CREATE TABLE [dbo].[orderDetails] (
  [orderDetailsID] int NOT NULL,
  [orderID] int NOT NULL,
  [productID] int NOT NULL,
  [orderQuantity] varchar(20),
  [fulfillmentStatus] varchar(20)

  CONSTRAINT prim_Key_orderDetails PRIMARY KEY CLUSTERED ([orderDetailsID] ASC),
  )
ON [PRIMARY]

-- Add CHECK CONSTRAINT FOREIGN KEYS for orderDetails Table--
ALTER TABLE [dbo].[orderDetails] WITH CHECK ADD  CONSTRAINT foreign_key_orderID_orderDetails 
FOREIGN KEY ([orderID]) REFERENCES [dbo].[order] ([orderID])

ALTER TABLE [dbo].[orderDetails] WITH CHECK ADD  CONSTRAINT foreign_key_productID_orderDetails 
FOREIGN KEY ([productID]) REFERENCES [dbo].[product] ([productID])

--Add a CHECK for orderDetailsID in orderDetails Table --
ALTER TABLE [dbo].[orderDetails] WITH CHECK ADD CONSTRAINT CHK_orderDetailsID CHECK (orderDetailsID > 0 );


--------------------------------------------------------------------------


/* CREATE table payment */
CREATE TABLE [dbo].[payment] (
  [paymentID] int NOT NULL,
  [orderID] int NOT NULL,
  [paymentMethod] varchar(30) NOT NULL,
  [paymentStatus] varchar(20),
  [paymentDate] date,
  [paymentTime] time,
  [paymentError] varchar(20),
  [creditCardNo] varchar(45) NOT NULL

  CONSTRAINT prim_Key_payment PRIMARY KEY NONCLUSTERED ([paymentID] ASC),
  )
ON [PRIMARY]

-- Add CHECK CONSTRAINT FOREIGN KEY for payment Table--
ALTER TABLE [dbo].[payment] WITH CHECK ADD  CONSTRAINT foreign_key_orderID_payment 
FOREIGN KEY ([orderID]) REFERENCES [dbo].[order] ([orderID])

ALTER TABLE [dbo].[payment] WITH CHECK ADD CONSTRAINT foreign_key_creditCardNo_payment 
FOREIGN KEY (creditCard) REFERENCES [dbo].[creditCard] ([creditCardNo])

--Add a CHECK for paymentID in payment Table --
ALTER TABLE [dbo].[payment] WITH CHECK ADD CONSTRAINT CHK_paymentID CHECK (paymentID > 0)



--------------------------------------------------------------------------


/* CREATE table product */
CREATE TABLE [dbo].[product] (
  [productID] int NOT NULL,
  [categoryID] int NOT NULL,
  [productName] varchar(45) NOT NULL,
  [productPrice] int,
  [productColor] varchar(20),
  [productSize] varchar(20),
  [discount] varchar(20),
  [productWeight] varchar(20),
  [productPicture] varbinary(max),
  [productDescription] varchar(200)

  CONSTRAINT prim_Key_product PRIMARY KEY CLUSTERED ([productID] ASC),
  )
ON [PRIMARY]

-- Add CHECK CONSTRAINT FOREIGN KEY for product Table--
ALTER TABLE [dbo].[product] WITH CHECK ADD  CONSTRAINT foreign_key_categoryID  
FOREIGN KEY ([categoryID]) REFERENCES [dbo].[category] ([categoryID])

--Add a CHECK for productID in product Table --
ALTER TABLE [dbo].[product] WITH CHECK ADD CONSTRAINT CHK_productID CHECK (productID > 0 );


--------------------------------------------------------------------------


/* CREATE table productStock */
CREATE TABLE [dbo].[productStock] (
  [productStockID] int NOT NULL,
  [productID] int NOT NULL,
  [unitsInStock] varchar(20),
  [unitsInOrder] varchar(20)

  CONSTRAINT prim_Key_productStockID PRIMARY KEY NONCLUSTERED ([productStockID]),
  )
ON [PRIMARY]

-- Add CHECK CONSTRAINT FOREIGN KEY for productStock Table--
ALTER TABLE [dbo].[productStock]  WITH CHECK ADD CONSTRAINT foreign_key_productID_productStock 
FOREIGN KEY ([productID]) REFERENCES [dbo].[product] ([productID])

--Add a CHECK for productStockID in productStock Table --
ALTER TABLE [dbo].[productStock] WITH CHECK ADD CONSTRAINT CHK_productStock CHECK (productStockID > 0)


--------------------------------------------------------------------------


/* CREATE table shipment */
CREATE TABLE [dbo].[shipment] (
  [shipmentID] int NOT NULL,
  [customerAddressID] int NOT NULL,
  [shippingDate] date NOT NULL,
  [shippingMethod] varchar(20) NOT NULL

  CONSTRAINT prim_Key_shipment PRIMARY KEY CLUSTERED ([shipmentID] ASC),
  )
ON [PRIMARY]

-- Add CHECK CONSTRAINT FOREIGN KEY for shipment Table--
ALTER TABLE [dbo].[shipment] WITH CHECK ADD CONSTRAINT foreign_shipment 
FOREIGN KEY ([customerAddressID]) REFERENCES [dbo].[customerAddress] ([customerAddressID])

--Add a CHECK for shipmentID in shipment Table --
ALTER TABLE [dbo].[shipment] WITH CHECK ADD  CONSTRAINT CHK_shipmentID CHECK (shipmentID > 0 );


--------------------------------------------------------------------------


/* CREATE table shipper */
CREATE TABLE [dbo].[shipper] (
  [shipperID] int NOT NULL,
  [shipmentID] int NOT NULL,
  [shipperName] varchar(45),
  [shipperPhoneNo] varchar(20)

  CONSTRAINT prim_Key_shipperID PRIMARY KEY NONCLUSTERED ([shipperID]),
  )
ON [PRIMARY]

-- Add CHECK CONSTRAINT FOREIGN KEY for shipper Table--
ALTER TABLE [dbo].[shipper] WITH CHECK ADD CONSTRAINT foreign_key_shipmentID_shipper 
FOREIGN KEY ([shipmentID]) REFERENCES [dbo].[shipment] ([shipmentID])

--Add a CHECK for shipperID in shipper Table --
ALTER TABLE [dbo].[shipper]  WITH CHECK ADD CONSTRAINT CHK_shipperID CHECK (shipperID > 0)

   
--------------------------------------------------------------------------


/* CREATE table supplier */
CREATE TABLE [dbo].[supplier] (
  [supplierID] int NOT NULL,
  [supplierFirstName] varchar(20) NOT NULL,
  [supplierLastName] varchar(20),
  [supplierPhoneNo] varchar(20),
  [supplierEmail] varchar(45),
  [supplierURL] varchar(45),
  [supplierDescription] varchar(200),

  CONSTRAINT prim_Key_supplierID PRIMARY KEY CLUSTERED ([supplierID] ASC),
  )
ON [PRIMARY]

--Add a CHECK for supplierID in supplier Table --
ALTER TABLE [dbo].[supplier]  WITH CHECK ADD CONSTRAINT CHK_supplierID CHECK (supplierID > 0)


--------------------------------------------------------------------------


/* CREATE table supplierAddress */
CREATE TABLE [dbo].[supplierAddress] (
  [supplierAddressID] int NOT NULL,
  [supplierID] int NOT NULL,
  [street] varchar(20) NOT NULL,
  [city] varchar(20),
  [postalCode] varchar(20),
  
  CONSTRAINT prim_Key_supplierAddressID PRIMARY KEY NONCLUSTERED ([supplierAddressID]),
  )
ON [PRIMARY]

-- Add CHECK CONSTRAINT FOREIGN KEY for supplierAddress Table--
ALTER TABLE [dbo].[supplierAddress] WITH CHECK ADD CONSTRAINT foreign_key_supplierID_supplierAddress 
FOREIGN KEY ([supplierID]) REFERENCES [dbo].[supplier] ([supplierID])

--Add a CHECK for supplieraddressID in supplierAddress Table --
ALTER TABLE [dbo].[supplierAddress] WITH CHECK ADD CONSTRAINT CHK_supplierAddressID CHECK (supplierAddressID > 0)


--------------------------------------------------------------------------


/* CREATE table supplies */
CREATE TABLE [dbo].[supplies] (
  [supplierID] int NOT NULL,
  [productID] int NOT NULL

  CONSTRAINT prim_Key_supplies PRIMARY KEY CLUSTERED ([supplierID],[productID]),
  )
ON [PRIMARY]

-- Add CHECK CONSTRAINT FOREIGN KEY for supplies Table--
ALTER TABLE [dbo].[supplies]  WITH CHECK ADD CONSTRAINT foreign_key_supplierID_supplies 
FOREIGN KEY ([supplierID]) REFERENCES [dbo].[supplier] ([supplierID])

ALTER TABLE [dbo].[supplies]  WITH CHECK ADD CONSTRAINT foreign_key_productID_supplies 
FOREIGN KEY ([productID]) REFERENCES [dbo].[product] ([productID])


--------------------------------------------------------------------------
