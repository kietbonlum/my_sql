DROP DATABASE IF EXISTS ExtraingManagement;
CREATE DATABASE ExtraingManagement;
USE ExtraingManagement;

CREATE TABLE Department(
		Department_Number	TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
         Department_Name	NVARCHAR(50) NOT NULL UNIQUE KEY
);
CREATE TABLE Employee_Table(
		Employee_Number TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        Employee_Name   NVARCHAR(50) NOT NULL UNIQUE KEY,
        Department_Number TINYINT UNSIGNED NOT NULL,
        FOREIGN KEY(Department_Number)	REFERENCES Department(Department_Number)
);
CREATE TABLE Employee_Skill_Table(
		Skill_Code NVARCHAR(50) ,
        Employee_Number TINYINT UNSIGNED NOT NULL,
	    DateRegistered DATETIME DEFAULT NOW(),
        FOREIGN KEY( Employee_Number)	REFERENCES Employee_Table( Employee_Number)
);
INSERT INTO Department(Department_Name)
VALUES                  (N'Marketing'	),
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
SELECT *FROM Department;
INSERT INTO Employee_Table(Employee_Name,Department_Number)
VALUES                    ('Mạc Văn KHoa' 	,'1'),
						  ('Mạc Văn Anh	' 	,'2'),
                          ('Phạm Hữu Thắng' ,'1'),
                          ('Phạm Công Vinh' ,'3'),
                          ('Đinh La Thăng'  ,'4'),
                          ('Anh Văn KHoa'   ,'6'),
                          ('EM Văn KHoa' 	,'5'),
                          ('Hoang le' 		,'8'),
                          ('Mạc A KHoa' 	,'3'),
                           ('EM a KHoa' 	,'1'),
                          ('Hoang le kha' 	,'8'),
                          ('MNgo vinh' 		,'1'),
                          ('Mạc Văn ANh'	,'9');
SELECT *FROM Employee_Table;
INSERT INTO Employee_Skill_Table(Skill_Code			,Employee_Number,DateRegistered)
VALUES                   		 ('Giao Tiep'		,'1'			,'2020-01-09'),
								 ('Lãnh đạo'		,'2'			,'2020-02-09'),	
                                 ('Java'			,'3'			,'2020-03-09'),	
                                 ('COde phần cứng'	,'1'			,'2020-04-09'),	
                                 ('Sáng tạo'		,'5'			,'2020-05-09'),	
                                 ('Dev'				,'7'			,'2020-06-09'),	
                                 ('AI'				,'1'			,'2020-07-09'),	
                                 ('PM'				,'8'			,'2020-08-09'),	
                                 ('Vic'				,'9'			,'2020-09-09'),
                                 ('Ki nang sống'	,'2'			,'2020-10-09'),	
                                 ('Java'			,'7'			,'2020-04-08'),	
                                 ('Chơi'			,'3'			,'2020-05-08');	
SELECT *FROM Employee_Skill_Table;

