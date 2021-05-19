DROP DATABASE IF EXISTS TestingManagement;
CREATE DATABASE TestingManagement;
USE TestingManagement;

CREATE TABLE Department(
	DepartmentID	TINYINT	UNSIGNED,
    DepartmentName	VARCHAR(50)
);
CREATE TABLE  `Position`(
	PositionID		TINYINT	UNSIGNED,
    PositionName	ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);
CREATE TABLE  `Account`(
	AccountID		TINYINT	UNSIGNED,
    Email			VARCHAR(50),
    Username		VARCHAR(50),
    FullName		VARCHAR(50),
    DepartmentID	TINYINT	UNSIGNED,
    PositionID		TINYINT	UNSIGNED,
    CreateDate		DATE
);
CREATE TABLE  `Group`(
	GroupID			TINYINT,
    GroupName		VARCHAR(50),
    CreatorID		TINYINT,
    CreateDate		DATE
);
CREATE TABLE   GroupAccount(
	 GroupID		INT,
     AccountID		INT,
     JoinDate		DATE
);
CREATE TABLE   TypeQuestion(
	TypeID			INT,
    TypeName		VARCHAR(50)
);
CREATE TABLE   CategoryQuestion(
	CategoryID		INT,
    CategoryName	VARCHAR(50)
);
CREATE TABLE   Question(
	 QuestionID		TINYINT,
     Content		VARCHAR(50),
     CategoryID		TINYINT,
     TypeID			TINYINT,
     CreatorID		TINYINT,
     CreateDate		DATE
);
CREATE TABLE  Answer  (
	AnswerID		TINYINT,
    Content			VARCHAR(50),
    QuestionID		TINYINT,
    isCorrect		ENUM('TRUE','FALSE')
);1
CREATE TABLE   Exam  (
	ExamID 			TINYINT,
    `Code`			VARCHAR(50),
    Title			VARCHAR(50),
    CategoryID		TINYINT,	
    Duration		TIME,
    CreatorID		TINYINT,
    CreateDate		DATE
);
CREATE TABLE    ExamQuestion    (
	ExamID			TINYINT,
    QuestionID		TINYINT
);