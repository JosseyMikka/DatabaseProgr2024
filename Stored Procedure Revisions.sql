--header
ALTER PROCEDURE AddHr

@emp_id int, @fname varchar(25), @age int, 
@gender varchar(20)
AS
--Body
---add a person into HR 
BEGIN
INSERT INTO Hr_test VALUES
(@emp_id, @fname, @age, @gender)
END 
---testing the procedure
EXECUTE AddHr '8','Lopez Jennifer', 52, 'Female'
SELECT * FROM hr_test

CREATE PROCEDURE Sp_taxCalculation
@age INT,
@Taxvalue INT
AS
BEGIN
DECLARE @Salarytax INT
IF @age <25 
	BEGIN 
	SET @Salarytax =@Taxvalue * 0.25
	PRINT @Salarytax
	END
IF @age >25
	BEGIN 
	SET @Salarytax =@Taxvalue * 0.5
	PRINT @Salarytax
	END
END

EXECUTE Sp_taxCalculation 19, 1000


SELECT first_name,
CASE 
WHEN age <25 THEN  'TAX VALUE is 25%'
WHEN age >25 THEN 'TAX VALUE is 50%'
ELSE 'NO TAX'
END AS 'SALARY TAX'
FROM hr_test


SELECT first_name,
CASE Gender
WHEN 'Female' THEN  'BONUS =5000'
WHEN 'Male' THEN 'BONUS =2000'
--ELSE 'NO BONUS'
END AS 'BONUS DECISION'
FROM hr_test
 

CREATE TRIGGER tr_HRTAX
ON Hr_test
AFTER INSERT
AS
BEGIN 
PRINT 'A person has been inserted succefully'
END
