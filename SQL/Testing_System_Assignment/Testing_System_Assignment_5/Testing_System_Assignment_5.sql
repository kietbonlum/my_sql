USE TestingManagement;

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale 
CREATE VIEW Department_Sale as 
SELECT 
		b.AccountID,
        b.Fullname
FROM 
	Department a
    JOIN Account b ON a.DepartmentID=b.DepartmentID
WHERE DepartmentName='Sale';

SELECT * FROM  Department_Sale;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất  
DROP VIEW IF EXISTS Account_max;
CREATE VIEW Account_max as
SELECT
	b.AccountID,
    COUNT(b.GroupID) AS Total_GroupID
FROM
	`Group` a
    JOIN GroupAccount b ON a.GroupID=b.GroupID
    GROUP BY b.AccountID
 HAVING Total_GroupID = (SELECT COUNT(*) FROM GroupAccount GROUP BY AccountID  ORDER BY COUNT(*) DESC limit 1);
 
 DROP VIEW IF EXISTS Account_max;
CREATE VIEW Account_max as
SELECT
	b.AccountID,
    COUNT(b.GroupID) AS Total_GroupID
FROM
	`Group` a
    JOIN GroupAccount b ON a.GroupID=b.GroupID
    GROUP BY b.AccountID
 HAVING Total_GroupID = (SELECT MAX(number_of_groups) FROM (SELECT COUNT(GroupID) AS number_of_groups FROM GroupAccount GROUP BY AccountID) AS temp);



SELECT *FROM Account_max;
-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi 
DROP VIEW IF EXISTS Question_too_long;
CREATE VIEW Question_too_long AS
SELECT	QuestionID, Content, CHAR_LENGTH(Content) AS characters
FROM	Question 
WHERE CHAR_LENGTH(Content) > 14;

SELECT * FROM Question_too_long;

DELETE FROM question
WHERE  CHAR_LENGTH(Content) > 14;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
DROP VIEW IF EXISTS Department_Amax;
CREATE VIEW Department_Amax AS
    SELECT 
        a.DepartmentName,
        COUNT(AccountID) as Total_max
	FROM      Department a
            JOIN
        Account b ON a.DepartmentID = b.DepartmentID
    GROUP BY DepartmentName
  HAVING Total_max=(SELECT COUNT(*) FROM `Account` GROUP BY DepartmentID ORDER BY COUNT(*) DESC limit 1);
SELECT *FROM Department_Amax;
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo 
DROP VIEW IF EXISTS Department_Amax;
CREATE VIEW Department_Amax AS
SELECT 	a.Content,
		b.AccountID,
		b.Fullname
FROM Question a
LEFT JOIN `Account` b ON a.CreatorID=b.AccountID 
WHERE b.Fullname LIKE 'Nguyễn%' OR  b.Fullname LIKE '%Nguyễn';	 

SELECT * FROM Department_Amax;