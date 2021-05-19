USE TestingManagement;
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ 
SELECT *
      
FROM 
	Account a
    LEFT JOIN Department b ON a.DepartmentID=b.DepartmentID;
-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010 
--  Question 3: Viết lệnh để lấy ra tất cả các developer  
SELECT 
	    d.PositionName,
       COUNT(a.AccountID),
       GROUP_CONCAT(a.Fullname)
 FROM Position d
 LEFT JOIN
	`Account` a ON d.PositionID =a.PositionID
GROUP BY
	PositionName;
    
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có > 3 nhân viên 
SELECT a.DepartmentName,
	   count(b.AccountID) as Songuoilam
FROM Department a
	LEFT JOIN `Account` b ON a.DepartmentID = b.DepartmentID
GROUP BY 
		a.DepartmentName
HAVING count(b.AccountID) > 5;
	
-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất 
SELECT
	a.QuestionID,
   -- a.Content,
    COUNT(b.ExamID) Total_Exam
FROM
	Question a
JOIN Examquestion b ON a.QuestionID=b.QuestionID
GROUP BY 
	a.QuestionID
HAVING	Total_Exam=(SELECT COUNT(*) FROM Examquestion GROUP BY QuestionID ORDER BY COUNT(*) DESC limit 1);
    
-- 	   Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT  
		a.CategoryID,
		COUNT(b.QuestionID)
FROM 
	CategoryQuestion a
LEFT JOIN
	Question b ON a.CategoryID=b.CategoryID
GROUP BY 
	a.CategoryID
	ORDER BY COUNT(b.QuestionID) DESC;
--     Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam 
SELECT  
		QuestionID,
		COUNT(ExamID)
FROM 
	Examquestion
GROUP BY 
	QuestionID
	ORDER BY COUNT(ExamID) DESC;
--     Question 8: Lấy ra Question có nhiều câu trả lời nhất 
SELECT	
		a.QuestionID,
       COUNT(b.AnswerID) as Total_anwser,
       GROUP_CONCAT(b.AnswerID)
FROM
	Question a
JOIN Answer b ON a.QuestionID=b.QuestionID
GROUP BY 
		a.QuestionID
HAVING Total_anwser=(SELECT COUNT(*) FROM Answer GROUP BY QuestionID ORDER BY COUNT(*) DESC limit 1);
--     Question 9: Thống kê số lượng account trong mỗi group  

SELECT	COUNT(AccountID),
		GroupID
FROM
		GroupAccount 
GROUP BY
	GroupID;
--     Question 10: Tìm chức vụ có ít người nhất  
SELECT a.PositionID,
	   a.PositionName,
       COUNT(b.AccountID),
       GROUP_CONCAT(b.FullName)
FROM
	Position a
    JOIN Account b ON a.PositionID=b.PositionID
GROUP BY
	a.PositionID
HAVING COUNT(b.AccountID)=(SELECT COUNT(*) FROM Account GROUP BY PositionID	ORDER BY COUNT(AccountID) DESC limit 1);
--     Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM 	

SELECT a.DepartmentName,
       c.PositionName,
       COUNT(c.PositionID)
FROM	Department a
 JOIN Account b ON a.DepartmentID=b.DepartmentID
 JOIN Position c ON b.PositionID=c.PositionID
GROUP BY c.PositionName,a.DepartmentName;
SELECT
 /* a.FullName,
  b.DepartmentID, */
 b.DepartmentName,
 /* c.PositionID, */
 c.PositionName,
 count(*) AS total
FROM
 account a 
 LEFT JOIN department b ON a.DepartmentID = b.DepartmentID
 LEFT JOIN position c ON a.PositionID = c.PositionID
GROUP BY
 b.DepartmentName, c.PositionName
ORDER BY
 b.DepartmentName, c.PositionName;
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, 
SELECT 	a.QuestionID,
		a.Content,
        a.CategoryID,
        a.TypeID,
        a.CreatorID,
        a.CreateDate,
        b.CategoryName,
        c.Content
FROM Question a
 JOIN CategoryQuestion b ON a.CategoryID=b.CategoryID
 JOIN Answer c ON a.QuestionID=c.QuestionID;
-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm 
SELECT COUNT(a.QuestionID),
	    b.TypeName
FROM
	Question a
    JOIN TypeQuestion b ON a.TypeID=b.TypeID
	GROUP BY b.TypeID;
-- Question 14:Lấy ra group không có account nào 
SELECT *
FROM
		`Group` a
LEFT JOIN GroupAccount b ON a.GroupID=b.GroupID
WHERE b.GroupID is NULL;
-- Question 15: Lấy ra group không có account nào 
-- Question 16: Lấy ra question không có answer nào 
SELECT a.Content
FROM
	Question a
LEFT JOIN Answer b ON a.QuestionID=b.QuestionID
WHERE b.AnswerID is NULL;
-- Exercise 2: Union 
-- Question 17: 
--  a) Lấy các account thuộc nhóm thứ 1 
SELECT GroupID,
	COUNT(AccountID) 
FROM
	GroupAccount
WHERE GroupID=1
GROUP BY GroupID;
--  b) Lấy các account thuộc nhóm thứ 2
SELECT GroupID,
	COUNT(AccountID) 
FROM
	GroupAccount
WHERE GroupID=2
GROUP BY GroupID;
--  c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau 
SELECT GroupID,
	COUNT(AccountID) 
FROM
	GroupAccount
WHERE GroupID=1
GROUP BY GroupID
UNION
SELECT GroupID,
	COUNT(AccountID) 
FROM
	GroupAccount
WHERE GroupID=2
GROUP BY GroupID;
-- Question 18:  
-- a) Lấy các group có lớn hơn 5 thành viên 
SELECT GroupID,
	COUNT(AccountID) 
FROM
	GroupAccount
GROUP BY GroupID
HAVING COUNT(AccountID)>5;
-- b) Lấy các group có nhỏ hơn 7 thành viên 
SELECT GroupID,
	COUNT(AccountID) 
FROM
	GroupAccount
GROUP BY GroupID
HAVING COUNT(AccountID)<7;
-- c) Ghép 2 kết quả từ câu a) và câu b) 
SELECT GroupID,
	COUNT(AccountID) 
FROM
	GroupAccount
GROUP BY GroupID
HAVING COUNT(AccountID)>5
UNION ALL
SELECT GroupID,
	COUNT(AccountID) 
FROM
	GroupAccount
GROUP BY GroupID
HAVING COUNT(AccountID)<7;