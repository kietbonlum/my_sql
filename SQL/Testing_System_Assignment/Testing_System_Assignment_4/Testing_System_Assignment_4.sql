DROP DATABASE IF EXISTS TestingManagement;
CREATE DATABASE TestingManagement;
USE TestingManagement;
-- Bảng 1: Phòng ban
CREATE TABLE Department(
	DepartmentID	TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,  
    DepartmentName	VARCHAR(50) NOT NULL UNIQUE KEY
);
-- Bảng 2: Chức vụ
CREATE TABLE  `Position`(
	PositionID		TINYINT UNSIGNED PRIMARY KEY   AUTO_INCREMENT,
    PositionName	ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL UNIQUE KEY
);
-- Bảng 3: Tài khoản
DROP TABLE IF EXISTS `Account`;
CREATE TABLE  `Account`(
	AccountID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Email			VARCHAR(50) NOT NULL UNIQUE KEY,
    Username		VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName		VARCHAR(50) NOT NULL,
    DepartmentID	TINYINT	UNSIGNED NOT NULL,
    PositionID		TINYINT	UNSIGNED NOT NULL,
    CreateDate		DATETIME DEFAULT NOW(), -- DEFAULT GÁN 1 GIÁ TRỊ MẶC ĐỊNH
	FOREIGN KEY(DepartmentID)	REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID)		REFERENCES `Position`(PositionID)
);

-- Bảng 4: NHóm
DROP TABLE IF EXISTS `Group`;
CREATE TABLE  `Group`(
	GroupID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    GroupName		VARCHAR(50) NOT NULL,
    CreatorID		TINYINT UNSIGNED NOT NULL ,
    CreateDate		DATETIME DEFAULT NOW(),
    FOREIGN KEY (CreatorID)	REFERENCES `Account`(AccountID) -- tai sao cai nay creatorID hay groupID deu dc
);
-- Bảng 5: NHóm Tài khoản
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE   GroupAccount(
	 GroupID		TINYINT UNSIGNED NOT NULL,
     AccountID		TINYINT UNSIGNED NOT NULL,
     JoinDate		 DATETIME DEFAULT NOW(),
     PRIMARY KEY (GroupID,AccountID),
	 FOREIGN KEY(GroupID) 		REFERENCES `Group`(GroupID), 
	 FOREIGN KEY(AccountID) 	REFERENCES `Account`(AccountID) 
);
-- Bảng 6: Loại câu hỏi
CREATE TABLE   TypeQuestion(
	TypeID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    TypeName		ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);
-- Bảng 7: Câu hỏi chuyên mục
CREATE TABLE   CategoryQuestion(
	CategoryID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CategoryName	NVARCHAR(50) NOT NULL UNIQUE KEY
);
-- Bảng 8: Câu hỏi
DROP TABLE IF EXISTS Question;
CREATE TABLE   Question(
	 QuestionID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     Content		VARCHAR(50) NOT NULL UNIQUE KEY,
     CategoryID		TINYINT NOT NULL ,
     TypeID			TINYINT NOT NULL ,
     CreatorID		TINYINT NOT NULL ,
     CreateDate		DATETIME DEFAULT NOW()
);
-- Bảng 9: Câu trả lời
CREATE TABLE  Answer(
	AnswerID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content			VARCHAR(50) NOT NULL UNIQUE KEY,
    QuestionID		TINYINT NOT NULL ,
    isCorrect		BIT (1) 
);
-- Bảng 10: Đề thi
CREATE TABLE   Exam  (
	ExamID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Code`			VARCHAR(50)  NOT NULL,
    Title			VARCHAR(50)   NOT NULL,			-- tiêu đề
    CategoryID		TINYINT UNSIGNED NOT NULL,	
    Duration		TINYINT UNSIGNED NOT NULL,		-- thời gian
    CreatorID		TINYINT UNSIGNED NOT NULL,
    CreateDate		DATETIME DEFAULT NOW()
);
-- Bảng 11: câu hỏi đề thi
CREATE TABLE    ExamQuestion    (
	ExamID			TINYINT,
    QuestionID		TINYINT
);
INSERT INTO Department(DepartmentName) 
VALUES
						(N'Marketing'	),
						(N'Manager'		),
						(N'Thư kí'		),
						(N'person'		),
						(N'Bán hàng'	),
						(N'Sale'		),
                        (N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc');
-- Add data position
-- SELECT * FROM Department;
INSERT INTO Position	(PositionName	) 
VALUES 					('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			); 
-- SELECT * FROM Position;
INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID	, CreateDate)
VALUES 				('Email1@gmail.com'				, 'Username1'			,'Fullname1'				,   '5'			,   '1'		,'2020-03-05'),
					('Email2@gmail.com'				, 'Username2'			,'Fullname2'				,   '1'			,   '2'		,'2020-03-05'),
                    ('Email3@gmail.com'				, 'Username3'			,'Fullname31'				,   '2'			,   '2'		,'2020-03-07'),
                    ('Email4@gmail.com'				, 'Username4'			,'Fullname4'				,   '3'			,   '4'		,'2020-03-08'),
                    ('Email5@gmail.com'				, 'Username5'			,'Fullname5'				,   '4'			,   '4'		,'2020-03-10'),
                    ('Email6@gmail.com'				, 'Username6'			,'Fullname6'				,   '6'			,   '3'		,'2020-04-05'),
                    ('Email7@gmail.com'				, 'Username7'			,'Fullname7'				,   '2'			,   '2'		, NULL		),
                    ('Email8@gmail.com'				, 'Username8'			,'Nguyễn anh'				,   '8'			,   '1'		,'2020-04-07'),
                    ('Email9@gmail.com'				, 'Username9'			,'bi Nguyễn'				,   '2'			,   '2'		,'2020-04-07'),
                    ('Email10@gmail.com'			, 'Username10'			,'Fullname10'				,   '10'		,   '1'		,'2020-04-09'),
                    ('Email11@gmail.com'			, 'Username11'			,'Fullname11'				,   '10'		,   '1'		, DEFAULT),
					('Email12@gmail.com'			, 'Username12'			,'Fullname12'				,   '10'		,   '1'		, DEFAULT);
                    
                    

 SELECT * FROM `Account`;
INSERT INTO `Group`	(  GroupName			, CreatorID		, CreateDate)
VALUES 				(N'Testing System'		,   5			,'2018-03-07'),
					(N'Development'			,   1			,'2020-03-05'),
                    (N'VTI Sale 01'			,   2			,'2010-03-09'),
                    (N'Testing System'		,   2			,'2018-03-07'),
                    (N'VTI Sale 02'			,   3			,'2020-03-10'),
                    (N'VTI Sale 03'			,   4			,'2010-03-28'),
                    (N'VTI Creator'			,   6			,'2020-04-06'),
                    (N'Testing System'		,   1			,'2018-03-07'),
                    (N'VTI Marketing 01'	,   7			,'2020-04-07'),
                    (N'Management'			,   8			,'2020-04-08'),
                    (N'Chat with love'		,   9			,'2020-04-09'),
                    (N'Vi Ti Ai'			,   10			,'2020-04-10');
                    
-- SELECT * FROM `Group`;
INSERT INTO `GroupAccount`	(  GroupID	, AccountID	, JoinDate	 )
VALUES 						(	1		,    1		,'2020-03-05'),
							(	2		,    2		,'2020-03-07'),
							(	3		,    3		,'2020-03-09'),
							(	3		,    4		,'2020-03-10'),
							(	5		,    5 		,'2020-04-28'),
							(	1		,    3		,'2020-04-06'),
							(	1		,    7		,'2020-04-17'),
							(	6		,    3		,'2020-04-08'),
							(	1		,    9		,'2020-04-09'),
							(	10		,    10		,'2020-04-10'),
                            (	1		,    5		,'2020-03-05'),
							(	1		,    4		,'2020-03-07'),
                            (	2		,    9		,'2020-03-05'),
							(	2		,    8		,'2020-03-07'),
							(	2		,    7		,'2020-03-09'),
                            (	2		,    6		,'2020-03-09'),
                            (	2		,    5		,'2020-03-09');
		
 SELECT * FROM `GroupAccount`;
INSERT INTO TypeQuestion	(TypeName	) 
VALUES 						('Essay'			),  
							('Multiple-Choice'	); 

-- SELECT * FROM  TypeQuestion;
-- Add data CategoryQuestion
INSERT INTO CategoryQuestion		(CategoryName	)
VALUES 								('SQL'			),
									('JAVA'			),
									('ADO.NET'		),
									('SQL1'			),
									('Postman'		),
									('Ruby'			),
									('Python'		),
									('C++'			),
									('C Sharp'		),
									('PHP'			);
-- SELECT * FROM CategoryQuestion;
-- Add data Question
INSERT INTO Question	(Content			, CategoryID, TypeID		, CreatorID	, CreateDate )
VALUES 					(N'Câu hỏi về Java'	,	1		,   '1'			,   '1'		,'2020-04-05'),
						(N'Câu Hỏi về PHP'	,	1		,   '2'			,   '2'		,'2020-04-05'),
						(N'Hỏi về C#'		,	9		,   '2'			,   '3'		,'2020-04-06'),
						(N'Hỏi về Ruby'		,	6		,   '1'			,   '4'		,'2020-04-06'),
						(N'Hỏi về Postman'	,	1		,   '1'			,   '5'		,'2020-04-06'),
						(N'Hỏi về ADO.NET'	,	3		,   '2'			,   '6'		,'2020-04-06'),
						(N'Hỏi về ASP.NET'	,	2		,   '1'			,   '7'		,'2020-04-06'),
						(N'Hỏi về C++'		,	1		,   '1'			,   '8'		,'2020-04-07'),
						(N'Hỏi về SQL'		,	4		,   '2'			,   '9'		,'2020-04-07'),
						(N'Hỏi về Python'	,	7		,   '1'			,   '10'	,'2020-04-07');
-- Add data Answers
SELECT * FROM Question;
INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'reply1'		,   1			,	0		),
					(N'reply2'		,   1			,	1		),
                    (N'reply3'		,   3			,	0		),
                    (N'reply4'		,   1			,	1		),
                    (N'reply5'		,   4			,	1		),
                    (N'reply6'		,   3			,	1		),
                    (N'reply7'		,   4			,	0		),
                    (N'reply8'		,   1			,	0		),
                    (N'reply9'		,   9			,	1		),
                    (N'reply10'		,   1			,	1		);
                    
 SELECT * FROM  Answer;	
-- Add data Exam
INSERT INTO Exam	(`Code`				, Title					, CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES 				('2019600722'		, N'Đề thi C#'			,	1			,	1		,   '5'			,'2019-04-05'),
					('2019600722'		, N'Đề thi PHP'			,	1			,	2		,   '2'			,'2019-04-05'),
                    ('2019600722'		, N'Đề thi C++'			,	9			,	3		,   '2'			,'2019-04-07'),
                    ('20196007224'		, N'Đề thi Java'		,	6			,	67		,   '3'			,'2011-04-08'),
                    ('2019600722'		, N'Đề thi Ruby'		,	5			,	47		,   '4'			,'2011-04-10'),
                    ('20196007226'		, N'Đề thi Postman'		,	3			,	69		,   '6'			,'2020-04-05'),
                    ('201960072207'		, N'Đề thi SQL'			,	2			,	60		,   '7'			,'2012-04-05'),
                    ('20196007228'		, N'Đề thi Python'		,	8			,	69		,   '8'			,'2020-04-07'),
                    ('201960072209'		, N'Đề thi ADO.NET'		,	4			,	3		,   '9'			,'2020-04-07'),
                    ('201960072210'		, N'Đề thi ASP.NET'		,	7			,	99		,   '10'		,'2020-04-08');
 -- SELECT * FROM  Exam;                   
                    
-- Add data ExamQuestion
INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	1	,		2		),
						(	2	,		1		), 
						(	3	,		1		), 
						(	4	,		3		), 
						(	5	,		7		), 
						(	6	,		1		), 
						(	7	,		2		), 
						(	8	,		1		), 
						(	9	,		9		), 
						(	10	,		1		); 
 SELECT * FROM  ExamQuestion;
 -- Question 1: Thêm ít nhất 10 record vào mỗi table
 
 -- Question 2: lấy ra tất cả các phòng ban 
 SELECT DepartmentName FROM Department;
 
 -- Question 3: lấy ra id của phòng ban "Sale"
 SELECT DepartmentID FROM Department WHERE DepartmentName = 'Sale';
 
 -- Question 4: lấy ra thông tin account có full name dài nhất
SELECT MAX(char_length(Fullname))FROM `Account`;
SELECT * FROM `Account`WHERE (char_length(Fullname))=10;

 -- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3 
 SELECT * FROM `Account`WHERE  DepartmentID=3 AND (char_length(Fullname))=10;
-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019 
SELECT GroupName FROM `group` WHERE CreateDate < '2019-12-20';
 -- Câu 7: Lấy ra ID của question có >= 4 câu trả lời 
 SELECT 
	QuestionID
 FROM
	answer
GROUP BY
	QuestionID
HAVING count(*)>=4;
-- Câu 8:  Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT
	ExamID
FROM
	Exam
WHERE	CreateDate <'2019/12/20 '
AND		Duration >='60';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất	

SELECT * FROM `Group` ORDER BY CreateDate DESC limit 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2

SELECT 
	COUNT(`AccountID`)
 FROM
	`Account`
WHERE 
	DepartmentID=2;
-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT * FROM `Account` WHERE FUllname LIKE 'F%' AND Fullname LIKE '%1';
-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019

DELETE FROM Exam WHERE CreateDate < '2019/12/20';
SELECT *FROM Exam;
-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `Account` 
SET 
    Fullname = 'Nguyễn Bá Lộc',
	Email	 = 'loc.nguyenba@vti.com.vn'
WHERE
    AccountID = 5	;
SELECT *FROM `Account`;
-- Question 15: update account có id = 5 sẽ thuộc group có id = 4 
UPDATE GroupAccount
SET		
		GroupID= 4
WHERE AccountID = 5;
SELECT * FROM GroupAccount;