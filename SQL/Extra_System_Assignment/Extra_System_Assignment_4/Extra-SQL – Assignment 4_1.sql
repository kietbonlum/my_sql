USE ExtraingManagement;


-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java    
SELECT	*
FROM	 Employee_Table a
JOIN     Employee_Skill_Table b ON a.Employee_Number=b.Employee_Number
WHERE Skill_Code ='Java';

-- Hướng dẫn: sử dụng UNION 
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên 
SELECT a.Department_Number,
	   a.Department_Name,
	   COUNT(Employee_Number) AS Total
FROM
	 Department a
JOIN Employee_Table b ON a.Department_Number=b.Department_Number
GROUP BY
	Department_Name
HAVING Total=(SELECT COUNT(Employee_Number)
    FROM Employee_Table
    GROUP BY Department_Number
    ORDER BY COUNT(Employee_Number) DESC limit 1);
-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.  
    SELECT a.Department_Name,
			COUNT(Employee_Number),
            GROUP_CONCAT(Employee_Number),
            GROUP_CONCAT(Employee_Name)
    FROM
		Department a
        JOIN Employee_Table b ON a.Department_Number=b.Department_Number
        GROUP BY a.Department_Name;
-- Hướng dẫn: sử dụng GROUP BY 
-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.  
SELECT a.Employee_Name,
		COUNT(Skill_Code)
FROM
	Employee_Table a
JOIN	Employee_Skill_Table  b ON a.Employee_Number=b.Employee_Number
	GROUP BY a.Employee_Name
	HAVING COUNT(Skill_Code)>1
-- Hướng dẫn: sử dụng DISTINCT 
--  