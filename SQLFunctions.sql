/*                                  [Functions in SQL SERVER]
1.) SCALAR VALUED FUNCTIONS:                                                                                   */
------------------------------------------------
CREATE FUNCTION HELLO()
RETURNS VARCHAR(30)
AS
BEGIN
RETURN 'THIS IS MY FIRST SQL FUNCTION!'
END

SELECT dbo.HELLO(); -->FUNCTION CALLING
------------------------------------------------
CREATE FUNCTION ADDITION(@N1 INT,@N2 INT)
RETURNS INT
AS
BEGIN
RETURN (@N1+@N2);
END
------------------------------------------------
SELECT dbo.ADDITION(25,95);  -->FUNCTION CALLING
------------------------------------------------

DROP FUNCTION dbo.HELLO;    -->DELETE FUCTION

DROP FUNCTION dbo.ADDITION; -->DELETE FUCTION

----------------------------------------------------
CREATE FUNCTION ISVOTTER(@AGE INT)
RETURNS VARCHAR(10)
AS
BEGIN
DECLARE @RESULT VARCHAR(10)
IF(@AGE>=18)
BEGIN
SET @RESULT ='eligible'
END
ELSE
BEGIN
SET @RESULT = 'not!eligible'
END
RETURN @RESULT;
END
-------------------------------------------------------------
SELECT dbo.ISVOTTER(18); -->FUNCTION CALLING
-------------------------------------------------------------
--> 2.)INLINE TABLE VALUED FUNCTION
-------------------------------------------------------------
ALTER FUNCTION GETBYID(@ID INT)
RETURNS TABLE
RETURN SELECT NAME,PARTY FROM Employee WHERE ID=@ID;
-------------------------------------------------------------------
SELECT *FROM GETBYID(2);-->FUNCTION CALLING INLINE SELECT STATEMENT
-------------------------------------------------------------------
-->MULTI-STATEMENT TABLE VALUED FUNCTIONS
-------------------------------------------------------------------
CREATE FUNCTION VOTTER(@ID INT)
RETURNS @TABLE TABLE (ID INT, NAME VARCHAR(10))
AS
BEGIN
INSERT INTO @TABLE
SELECT ID,NAME FROM Employee WHERE ID=@ID;
RETURN
END

SELECT *FROM VOTTER(1);