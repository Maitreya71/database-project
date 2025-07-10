
/********************************** STORED PROCUEDURES *****************************************************/

------ GETS CustomerID as parameter and displays CUSTOMER INFORMATION and FEEDBACK ON ORDER ID BASED ON THE @customer_ID inpur parameter.-----------------------
CREATE PROCEDURE GetCustomerFeedbackWith @customer_ID INT AS
BEGIN
SELECT customerFirstName, customerLastName, customerPhoneNo, customerEmail, orderID, productRating, shippingRating, experienceRating 
FROM customer, customerFeedback
WHERE [customerFeedback].[customerID] = @customer_ID
AND [customer].[customerID]= @customer_ID;
END


------ GETS CustomerID as parameter and displays CUSTOMER INFORMATION and ADDRESS BASED ON THE @customer_ID inpur parameter.-----------------------
CREATE PROCEDURE GetCustomerInformation @customer_ID INT AS
BEGIN
Select customerFirstName, customerLastName, customerPhoneNO, customerEmail, street, city, postalCode
FROM Customer, customerAddress
WHERE [Customer].[customerID] = @customer_ID and [customerAddress].[customerID] = @customer_ID;
END


------ GETS orderID as parameter and displays PAYMENT STATUS INFORMATION BASED ON THE @order_ID inpur parameter.-----------------------
CREATE PROCEDURE GetPaymentStatusWith @order_ID INT AS
BEGIN
SELECT paymentStatus, paymentMethod, paymentDate, paymentTime, paymentError,creditCardNo, orderTime, fulfillmentStatus
FROM orderDetails, payment, [order]
WHERE [orderDetails].[orderID] = @order_ID and [payment].[orderID] = @order_ID and [order].orderID = @order_ID;
END


------ GETS productID and new product_Price as parameters and UPDATES PRODUCT PRICE.-----------------------
CREATE PROCEDURE updateProductPrice @product_ID INT, @product_Price VARCHAR(10) AS
BEGIN
DECLARE @currProductPrice VARCHAR(10);
SET @currProductPrice = (SELECT productPrice from product where productID = @product_ID);
Update product SET productPrice = @product_Price where productID = @product_ID;
SELECT productName, productPrice, productDescription, unitsInStock, unitsInORder FROM product,
productStock WHERE [productStock].[productID] = @product_ID and [product].[productID] = @product_ID;
END


------ GETS Exp_Rating as parameter and displays the CustomerID and the OrderID based on that Experience Rating. -----------------------
CREATE PROCEDURE GetCustomerIDandOrderIDWithExpirenceRating @Exp_Rating decimal(2,1) AS
BEGIN
SELECT customerID, orderID, ExperienceRating FROM customerFeedback
WHERE [customerFeedback].[ExperienceRating] = @Exp_Rating;
END



/*************************************** TRIGGER ****************************************************/
-----THIS TRIGGER IS CALLED ON UPDATE OF THE PRODUCT PRICE. CHECK IF THE PRODUCT PRICE IS NOT LESS THAN 0 NAD NOT GREATER THAT SPECIDIED LIMIT. --------------------------
CREATE TRIGGER CheckProductPriceChanges
ON product
AFTER UPDATE
AS
    DECLARE @productPrice INT
    SET @productPrice=(select productPrice from inserted) 
    IF( @productPrice < 0)
    	BEGIN
      		UPDATE product SET productPrice = 0
    	END  
    IF(@productPrice > 10000)
    	BEGIN
        	UPDATE product SET productPrice=10000 
    	END
	 



/**************************************** VIEWS **************************************/
-----THIS VIEW DISPLAYS ALL CUSTOMER INFORMATION WITH THEIR CREDIT CARD INFORMATION. --------------------------
CREATE VIEW CustomersAndTheirCreditCards AS
Select customerFirstName, customerLastName, customerPhoneNo, customerEmail, creditCardNo, creditCardType, setAsPrimary, cardExpiry
FROM Customer, creditCard
WHERE [Customer].[customerID] = [creditCard].[customerID];

-----THIS VIEW DISPLAYS ALL SUPPLIER INFORMATION WITH THEIR ADDRESS INFORMATION. --------------------------
CREATE VIEW ShowSupplierInfoAndTheirAddress AS
SELECT supplierFirstName, supplierLastName, supplierPhoneNo, supplierEmail, supplierUrl, street, city, postalCode
FROM supplier, supplierAddress
WHERE [supplier].[supplierID] = [supplierAddress].[supplierID];

-----THIS VIEW DISPLAYS ALL PRODUCT INFORMATION. --------------------------
CREATE VIEW ViewProductInfoWithUnits AS
SELECT productName, categoryID, productPrice, productSize, discount, productWeight, productPicture, productDescription, unitsInStock, unitsInOrder
FROM product, productStock
WHERE [product].[productID] = [productStock].[productID];




