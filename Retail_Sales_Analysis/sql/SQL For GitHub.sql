-- CREATE TABLE HR_Employees (
--     Employee_ID INT PRIMARY KEY,
--     First_Name VARCHAR(50),
--     Last_Name VARCHAR(50),
--     Gender VARCHAR(10),
--     Age INT,
--     Department VARCHAR(50),
--     Job_role VARCHAR(50),
--     Education VARCHAR(50),
--     Marital_status VARCHAR(20),
--     Salary DECIMAL(10,2),
--     Years_At_Company INT,
--     Performance_Rating INT,
--     Overtime VARCHAR(5),
--     Attrition VARCHAR(5)
-- );

-- INSERT INTO hr_employees VALUES
-- (1001,'Rahul','Sharma','Male',29,'Sales','Sales Executive','Bachelor','Single',45000,3,4,'Yes','No'),
-- (1002,'Priya','Singh','Female',34,'HR','HR Manager','Master','Married',72000,8,5,'No','No'),
-- (1003,'Amit','Kumar','Male',27,'IT','Data Analyst','Bachelor','Single',55000,2,4,'Yes','No'),
-- (1004,'Neha','Gupta','Female',31,'Finance','Accountant','Bachelor','Married',60000,5,3,'No','No'),
-- (1005,'Rohit','Verma','Male',25,'IT','Developer','Bachelor','Single',50000,1,3,'Yes','Yes'),
-- (1006,'Sneha','Jain','Female',38,'Sales','Sales Manager','MBA','Married',85000,10,5,'No','No'),
-- (1007,'Vikas','Patel','Male',41,'Operations','Supervisor','Diploma','Married',67000,12,4,'Yes','No'),
-- (1008,'Anjali','Mehta','Female',26,'HR','Recruiter','Bachelor','Single',42000,2,4,'No','Yes'),
-- (1009,'Karan','Malhotra','Male',35,'Finance','Financial Analyst','Master','Married',78000,7,5,'No','No'),
-- (1010,'Pooja','Arora','Female',30,'IT','Developer','Bachelor','Married',62000,4,4,'Yes','No'),
-- (1011,'Rakesh','Yadav','Male',28,'Sales','Sales Executive','Bachelor','Single',47000,3,3,'Yes','Yes'),
-- (1012,'Nisha','Kapoor','Female',33,'HR','HR Executive','Master','Married',58000,6,4,'No','No'),
-- (1013,'Manish','Agarwal','Male',37,'Finance','Manager','MBA','Married',95000,11,5,'No','No'),
-- (1014,'Komal','Bansal','Female',24,'IT','Support Engineer','Bachelor','Single',39000,1,3,'Yes','Yes'),
-- (1015,'Deepak','Saxena','Male',45,'Operations','Manager','MBA','Married',110000,15,5,'No','No'),
-- (1016,'Ritu','Chopra','Female',29,'Sales','Sales Executive','Bachelor','Single',48000,2,4,'Yes','No'),
-- (1017,'Sandeep','Joshi','Male',32,'IT','Developer','Master','Married',70000,6,4,'No','No'),
-- (1018,'Megha','Shah','Female',27,'Finance','Accountant','Bachelor','Single',51000,3,3,'Yes','Yes'),
-- (1019,'Arjun','Nair','Male',36,'Operations','Supervisor','Bachelor','Married',72000,8,4,'No','No'),
-- (1020,'Kavita','Rao','Female',40,'HR','HR Manager','MBA','Married',90000,12,5,'No','No'),
-- (1021,'Aditya','Mishra','Male',26,'IT','Data Analyst','Bachelor','Single',52000,2,4,'Yes','No'),
-- (1022,'Shweta','Roy','Female',31,'Sales','Sales Manager','MBA','Married',81000,7,5,'No','No'),
-- (1023,'Nitin','Gupta','Male',39,'Finance','Financial Analyst','Master','Married',87000,10,4,'No','No'),
-- (1024,'Aisha','Khan','Female',25,'HR','Recruiter','Bachelor','Single',41000,1,3,'Yes','Yes'),
-- (1025,'Harsh','Malik','Male',34,'Operations','Supervisor','Bachelor','Married',68000,7,4,'No','No'),
-- (1026,'Simran','Kaur','Female',28,'IT','Developer','Bachelor','Single',56000,3,4,'Yes','No'),
-- (1027,'Varun','Bhatia','Male',42,'Sales','Sales Director','MBA','Married',125000,14,5,'No','No'),
-- (1028,'Payal','Sethi','Female',30,'Finance','Accountant','Bachelor','Married',59000,5,4,'No','No'),
-- (1029,'Akash','Pandey','Male',27,'IT','Support Engineer','Bachelor','Single',43000,2,3,'Yes','Yes'),
-- (1030,'Divya','Sharma','Female',35,'Operations','Manager','MBA','Married',98000,9,5,'No','No');


Select * from HR_Employees;

					# Basic Analysis
# Employees first name and departments
Select First_Name, Last_Name from HR_Employees;

# All Employees in the IT department
Select * from HR_Employees 
Where Department = 'IT';

# All Employees Greater then Age 30
Select * from HR_Employees 
Where Age >30;

# All Employees Salary Greater then 60,000
Select * From Hr_Employees
Where Salary > 60000
Order By Salary Desc;

# All Married Employees
Select * From Hr_Employees
Where Marital_Status = 'Married';

# All Employees With A Initials
Select * From Hr_Employees
Where First_Name like 'A%';

# Total Numbers Of Employees
Select Count(Employee_ID)As Total_Employees From Hr_Employees;

# Youngest Employee
Select * From Hr_Employees
Order By Age Asc
Limit 1;

# Oldest Employee
Select * From Hr_Employees
Order By Age Desc
Limit 1;

				# Intermediate Analysis
# Average Salary
Select Round(Avg(Salary),2) From Hr_Employees;     

# Average Salary By Department
Select Department, Round(Avg(Salary),2) From Hr_Employees
Group By Department;     

# Employees In Each Department
Select Department, Count(Employee_ID) As Total_Employees From Hr_Employees
Group By Department;    

# Highest Paid Employee
Select First_Name,Salary from HR_Employees
Order By Salary Desc
Limit 1;

# Second Highest Paid Employee
Select First_Name, Salary From (
Select First_Name, Salary, Dense_Rank() Over (Order By Salary Desc) As Rnk From Hr_Employees
 ) t
Where Rnk = 2;

# Counting Male & Female Employees
Select Gender, Count(Employee_ID) as Total_Emp From Hr_Employees
Group By Gender;

# Find Employees Who Work Overtime
Select * From Hr_Employees
Where Overtime = 'Yes';

# Count Employees Who Left The Company (Attrition = 'Yes')
Select * From Hr_Employees
Where Attrition = 'Yes';

# Average Age By Dpeartment
Select Department, Round(Avg(Age),0) From Hr_Employees
Group By Department;

# Showing Employees More then 5 years in the Company
Select * from Hr_Employees
Where Years_At_Company >=  '5';

# Ranking Employees By Salary Within Department
Select First_Name, Last_Name, Gender, Department, Salary,
Rank () Over (Partition BY Department Order By Salary Desc) as Salary_Rnk
From hr_Employees;






  

