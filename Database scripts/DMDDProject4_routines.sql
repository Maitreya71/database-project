-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: DMDDProject4
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `showsupplierinfoandtheiraddress`
--

DROP TABLE IF EXISTS `showsupplierinfoandtheiraddress`;
/*!50001 DROP VIEW IF EXISTS `showsupplierinfoandtheiraddress`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `showsupplierinfoandtheiraddress` AS SELECT 
 1 AS `supplierFirstName`,
 1 AS `supplierLastName`,
 1 AS `supplierPhoneNo`,
 1 AS `supplierEmail`,
 1 AS `supplierUrl`,
 1 AS `street`,
 1 AS `city`,
 1 AS `postalCode`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `viewproductinfowithunits`
--

DROP TABLE IF EXISTS `viewproductinfowithunits`;
/*!50001 DROP VIEW IF EXISTS `viewproductinfowithunits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewproductinfowithunits` AS SELECT 
 1 AS `productName`,
 1 AS `categoryID`,
 1 AS `productPrice`,
 1 AS `productSize`,
 1 AS `discount`,
 1 AS `productWeight`,
 1 AS `productPicture`,
 1 AS `productDescription`,
 1 AS `unitsInStock`,
 1 AS `unitsInOrder`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customersandtheircreditcards`
--

DROP TABLE IF EXISTS `customersandtheircreditcards`;
/*!50001 DROP VIEW IF EXISTS `customersandtheircreditcards`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customersandtheircreditcards` AS SELECT 
 1 AS `CustomerFirstName`,
 1 AS `CustomerLastName`,
 1 AS `CustomerPhoneNo`,
 1 AS `CustomerEmail`,
 1 AS `creditCardNo`,
 1 AS `creditCardType`,
 1 AS `setAsPrimary`,
 1 AS `cardExpiry`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `showsupplierinfoandtheiraddress`
--

/*!50001 DROP VIEW IF EXISTS `showsupplierinfoandtheiraddress`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `showsupplierinfoandtheiraddress` AS select `supplier`.`supplierFirstName` AS `supplierFirstName`,`supplier`.`supplierLastName` AS `supplierLastName`,`supplier`.`supplierPhoneNo` AS `supplierPhoneNo`,`supplier`.`supplierEmail` AS `supplierEmail`,`supplier`.`supplierURL` AS `supplierUrl`,`supplieraddress`.`street` AS `street`,`supplieraddress`.`city` AS `city`,`supplieraddress`.`postalCode` AS `postalCode` from (`supplier` join `supplieraddress`) where (`supplier`.`supplierID` = `supplieraddress`.`supplierID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewproductinfowithunits`
--

/*!50001 DROP VIEW IF EXISTS `viewproductinfowithunits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewproductinfowithunits` AS select `product`.`productName` AS `productName`,`product`.`categoryID` AS `categoryID`,`product`.`productPrice` AS `productPrice`,`product`.`productSize` AS `productSize`,`product`.`discount` AS `discount`,`product`.`productWeight` AS `productWeight`,`product`.`productPicture` AS `productPicture`,`product`.`productDescription` AS `productDescription`,`productstock`.`unitsInStock` AS `unitsInStock`,`productstock`.`unitsInOrder` AS `unitsInOrder` from (`product` join `productstock`) where (`product`.`productID` = `productstock`.`productID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customersandtheircreditcards`
--

/*!50001 DROP VIEW IF EXISTS `customersandtheircreditcards`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customersandtheircreditcards` AS select `customer`.`CustomerFirstName` AS `CustomerFirstName`,`customer`.`CustomerLastName` AS `CustomerLastName`,`customer`.`CustomerPhoneNo` AS `CustomerPhoneNo`,`customer`.`CustomerEmail` AS `CustomerEmail`,`creditcard`.`creditCardNo` AS `creditCardNo`,`creditcard`.`creditCardType` AS `creditCardType`,`creditcard`.`setAsPrimary` AS `setAsPrimary`,`creditcard`.`cardExpiry` AS `cardExpiry` from (`customer` join `creditcard`) where (`customer`.`customerID` = `creditcard`.`customerID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'DMDDProject4'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetCustomerFeedbackWith` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomerFeedbackWith`(IN customer_ID INT)
BEGIN
	SELECT CustomerFirstName, CustomerLastName, CustomerPhoneNo, 
    CustomerEmail, orderID, productRating, shippingRating, ExperienceRating
    FROM DMDDProject4.Customer, DMDDProject4.customerFeedback 
    WHERE Customer.customerID = customer_ID and customerFeedback.customerID = customer_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCustomerIDandOrderIDWithExpirenceRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomerIDandOrderIDWithExpirenceRating`(In Exp_Rating varchar(10))
BEGIN
	SELECT customerID, orderID, ExperienceRating FROM DMDDProject4.customerFeedback 
	WHERE customerFeedback.ExperienceRating = Exp_Rating;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCustomerInformation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCustomerInformation`(IN customer_ID INT)
BEGIN
	Select CustomerFirstName, CustomerLastName, CustomerPhoneNO, CustomerEmail, street, city, postalCode
    FROM DMDDProject4.Customer, DMDDProject4.customerAddress
    WHERE Customer.customerID = customer_ID and customerAddress.customerID = customer_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPaymentStatusWith` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPaymentStatusWith`(In order_ID INT)
BEGIN
	SELECT paymentStatus, paymentMethod, paymentDate, paymentTime, paymentError, orderTime, fulfilmentStatus
    FROM DMDDProject4.orderDetails, DMDDProject4.payment, DMDDProject4.Order
    WHERE orderDetails.orderID = order_ID and payment.orderID = order_ID and DMDDProject4.Order.orderID = order_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateProductPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateProductPrice`(IN product_ID INT, IN product_Price VARCHAR(10))
BEGIN
	DECLARE currProductPrice VARCHAR(10);
    SET currProductPrice = (SELECT productPrice from product where productID = product_ID);
    Update product SET productPrice = product_Price where productID = product_ID;
	SELECT productName, productPrice, productDescription, unitsInStock, unitsInORder FROM DMDDProject4.product,
	DMDDProject4.productStock WHERE productStock.productID = product_ID  and product.productID = product_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-23 15:48:54
