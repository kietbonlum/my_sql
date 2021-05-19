USE `adventureworks`;

-- Exercise 1: Subquery  Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name của ProductSubcategory là 'Saddles'. 
SELECT 
    a.ProductID, a.`Name`, b.ProductSubcategoryID, b.`Name`
FROM
    product a
        JOIN
    ProductSubcategory b ON a.ProductSubcategoryID = b.ProductSubcategoryID
WHERE
    a.ProductSubcategoryID = 	(SELECT 
									ProductSubcategoryID
								FROM
									ProductSubcategory
								WHERE
									`Name` LIKE 'Saddles');
-- Question 2: Thay đổi câu Query 1 để lấy được kết quả sau. 
SELECT 
    a.ProductID, a.`Name`, b.ProductSubcategoryID, b.`Name`
FROM
    product a
        JOIN
    ProductSubcategory b ON a.ProductSubcategoryID = b.ProductSubcategoryID
WHERE
    a.ProductSubcategoryID IN	(SELECT 
									ProductSubcategoryID
								FROM
									ProductSubcategory
								WHERE
									`Name` LIKE 'Bo%');

-- Question 3: Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và Touring Bike (nghĩa là ProductSubcategoryID = 3) 
 
-- Hướng dẫn: sử dụng hàm MIN() trong subquery để trả về ListPrice thấp nhất 
 
 SELECT MIN(ListPrice)
 FROM product 
 WHERE ProductSubcategoryID = 3;
 
 SELECT `Name`
 FROM product 
 WHERE ListPrice = ( SELECT MIN(ListPrice)
 FROM product 
 WHERE ProductSubcategoryID = 3);
 -- Exercise 2: JOIN nhiều bảng  
--  Question 1: Viết query lấy danh sách tên country và province được lưu trong AdventureWorks2008sample database.  

SELECT a.Name,b.Name,COUNT(a.Name)
FROM	countryregion a
JOIN 	stateprovince b ON a.CountryRegionCode=b.CountryRegionCode;
--  Question 2: Tiếp tục với câu query trước và thêm điều kiện là chỉ lấy country Germany và Canada 
--  
-- Chú ý: sủ dụng sort order và column headings 

SELECT a.Name,b.Name
FROM	countryregion a
JOIN 	stateprovince b ON a.CountryRegionCode=b.CountryRegionCode
WHERE a.`Name` = 'Canada' OR a.`Name` = 'Germany'ORDER BY a.Name;
-- Question 3: Từ bảng SalesPerson, chúng ta lấy cột BusinessEntityID (là định danh của người sales), Bonus and the SalesYTD (là đã sale được bao nhiêu người trong năm nay) 
--  
-- Từ bảng SalesOrderHeader, chúng ta lấy cột SalesOrderID OrderDate 
--  
-- Hướng dẫn: Join SalesOrderHeader và SalesPerson để chỉ lấy ra kết quả non-Internet orders (order được xử lý trên Internet có OnlineOrderFlag = 1 và cột SalesPersonID = null

SELECT  b.SalesOrderID,b.OrderDate,
		a.SalesPersonID,a.SalesPersonID as BusinessEntityID,a.Bonus , a.SalesYTD
FROM	SalesPerson a
JOIN	salesorderheader b ON a.SalesPersonID=b.SalesPersonID;

--  Question 4:  Sử dụng câu query ở question 3, thêm cột JobTitle and xóa cột SalesPersonID và BusinessEntityID. 
--  Hướng dẫn: Join với bảng HumanResources.Employee 

ALTER TABLE SalesPerson ADD COLUMN JobTitle VARCHAR(50);

UPDATE SalesPerson
SET  JobTitle = 'Sales Representative'
WHERE JobTitle is NULL;

SELECT  b.SalesOrderID,b.OrderDate,a.JobTitle,
		a.Bonus , a.SalesYTD
FROM	SalesPerson a
LEFT JOIN	salesorderheader b ON a.SalesPersonID=b.SalesPersonID
LEFT JOIN	employee c			ON a.SalesPersonID=c.EmployeeID;

