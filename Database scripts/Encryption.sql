--CHECK IF ANY KEY EXISTS--
SELECT *
FROM sys.symmetric_keys
WHERE name = '##MS_ServiceMasterKey##';
GO

-- Create database Key
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'DMDDP4Encrypt';
GO

-- Create self signed certificate
CREATE CERTIFICATE Certificate1
WITH SUBJECT = 'EncryptCreditCardData';
GO

-- Create symmetric Key
CREATE SYMMETRIC KEY SymmetricKey1 
 WITH ALGORITHM = AES_128 
 ENCRYPTION BY CERTIFICATE Certificate1;
GO


ALTER TABLE creditCard 
ADD credit_card_no_encrypt varbinary(MAX) NULL
GO


-- Opens the symmetric key for use
OPEN SYMMETRIC KEY SymmetricKey1
DECRYPTION BY CERTIFICATE Certificate1;
GO

-- Populating encrypted credit card no into new column
UPDATE creditCard
SET Credit_card_number_encrypt = EncryptByKey (Key_GUID('SymmetricKey1'),creditCardNo)
FROM creditCard;
GO

-- Closes the symmetric key
CLOSE SYMMETRIC KEY SymmetricKey1;
GO

----CHECK THE NEW ENCRYPTED DATA-------
SELECT * FROM Payment

