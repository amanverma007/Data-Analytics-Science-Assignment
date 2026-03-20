use employee_student;
drop table  if exists employees;
drop table if exists department;
drop table  if exists salary_grade;

create table department ( 
  dep_id Int,  
  dep_name varchar(14),  
  dep_location varchar(15),  
  constraint pk_department_dep_id  primary key (dep_id)  
);

create table employees(  
  emp_id Integer,  
  emp_name varchar(15),  
  job_name varchar(10),  
  manager_id Integer ,  
  hire_date date,  
  salary decimal (10,2),  
  commission decimal (7,2),  
  dep_id   Int,  
  constraint pk_employees_emp_id  primary key (emp_id),  
  constraint fk_employees_dep_id foreign key (dep_id ) references department (dep_id)  
); 


create table salary_grade(  
  grade Integer  ,  
  min_salary integer,  
  max_salary integer
);



insert into department values (1001,'FINANCE', 'SYDNEY');
insert into department values (2001,'AUDIT', 'MELBOURNE');
insert into department values (3001,'MARKETING', 'PERTH');
insert into department values (4001,'PRODUCTION', 'BRISBANE');


insert into employees values (68319, 'KAYLING', 'PRESIDENT',NULL,'1991-11-18', 6000,NULL,1001);
insert into employees values (66928, 'BLAZE', 'MANAGER',68319,'1991-05-01', 2750,NULL,3001);
insert into employees values (67832, 'CLARE', 'MANAGER',68319,'1991-06-09', 2550,NULL,1001);
insert into employees values (65646, 'JONAS', 'MANAGER',68319,'1991-04-02', 2957,NULL,2001);
insert into employees values (64989, 'ADELYN', 'SALESMAN',66928,'1991-02-20', 1700,400,3001);
insert into employees values (65271, 'WADE', 'SALESMAN',66928,'1991-02-22', 1350,600,3001);
insert into employees values (66564, 'MADDEN', 'SALESMAN',66928,'1991-09-28', 1350,1500,3001);
insert into employees values (68454, 'TUCKER', 'SALESMAN',66928,'1991-09-08', 1600,0,3001);
insert into employees values (68736, 'ADNRES', 'CLERK',67858,'1997-05-23', 1200,NULL,2001);
insert into employees values (69000, 'JULIUS', 'CLERK',66928,'1991-12-03', 1050,NULL,3001);
insert into employees values (69324, 'MARKER', 'CLERK',67832,'1992-01-23', 1400,NULL,1001);
insert into employees values (67858, 'SCARLET', 'ANALYST',65646,'1997-04-19', 3100,NULL,2001);
insert into employees values (69062, 'FRANK', 'ANALYST',65646,'1991-12-03', 3100,NULL,2001);
insert into employees values (63679, 'SANDRINE', 'CLERK',69062,'1990-12-18', 900,NULL,2001);

insert into salary_grade values (1,800,1300);
insert into salary_grade values (2,1301,1500);
insert into salary_grade values (3,1501,2100);
insert into salary_grade values (4,2101,3100);
insert into salary_grade values (5,3101,9999);

# 1. Write a query in SQL to display all the information of the employees.   

SELECT * FROM employees;

# 2.Write a query in SQL to find the salaries of all employees.

SELECT salary
FROM employees;

# 3. Write a query in SQL to display the unique designations for the employees.   

SELECT DISTINCT job_name 
FROM employees;

# 4. Write a query in SQL to list the emp_name and salary is increased by 15% and expressed as no.of Dollars.

SELECT emp_name,
       format (1.15*salary,'C') AS " Revised Salary"
FROM employees; 

# 5. Write a query in SQL to produce the output of employees name and job name as a fromat of "Employee & Job".

SELECT concat (emp_name,'   ' ,job_name) AS "Employee & Job"
FROM employees ;

# 6. Write a query in SQL to produce the output of employees as follows.

SELECT concat (emp_name,' (', lower(job_name),') ') AS "Employee"
FROM employees; 

# 7. Write a query in SQL to list the employees with Hire date in the format like February 22, 1991.   

SELECT DATE_FORMAT(hire_date, '%b %d, %Y') AS hire_date_formatted
FROM employees;

# 8. Write a query in SQL to count the no. of characters with out considering the spaces for each name. 

SELECT emp_name ,  length(trim(emp_name))
FROM employees;

# 9. Write a query in SQL to list the emp_id,salary, and commission of all the employees.  

select emp_id, salary , commission from employees;

# 10. Write a query in SQL to display the unique department with jobs. 

SELECT DISTINCT dep_id, job_name
FROM employees ;

# 11. Write a query in SQL to list the employees who does not belong to department 2001.

SELECT *FROM employees
WHERE dep_id NOT IN (2001);

# 12. Write a query in SQL to list the employees who joined before 1991 

SELECT *FROM employees
WHERE hire_date<('1991-1-1');

# 13. Write a query in SQL to display the average salaries of all the employees who works as ANALYST.   

SELECT avg(salary)
FROM employees
WHERE job_name = 'ANALYST';

# 14. Write a query in SQL to display the details of the employee BLAZE.    

SELECT *FROM employees
WHERE emp_name = 'BLAZE';

# 15. Write a query in SQL to display all the details of the employees whose commission is more than their salary. 

SELECT *FROM employees
WHERE commission>salary;

# 16. Write a query in SQL to list the employees whose salary is more than 3000 after giving 25% increment.    

SELECT *FROM employees
WHERE (1.25*salary) > 3000;

# 17. Write a query in SQL to list the name of the employees, those having six characters to their name. 

SELECT emp_name FROM employees
WHERE length(emp_name)=6 ;

# 18. Write a query in SQL to list the employees who joined in the month January.   

SELECT *FROM employees
WHERE month(hire_date)=01;

# 19. Write a query in SQL to list the name of employees and their manager separated by the string 'works for'. 

SELECT 
    CONCAT(e.emp_name, ' works for ', m.emp_name) AS relation
FROM employees e
JOIN employees m
    ON e.manager_id = m.emp_id;

#  20. Write a query in SQL to list all the employees whose designation is CLERK.    


SELECT *FROM employees
WHERE job_name = 'CLERK';

#  21. Write a query in SQL to list the employees whose experience is more than 27 years.   

SELECT *
FROM employees
WHERE TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) > 27;


# 22. Write a query in SQL to list the employees whose salaries are less than 3500 

SELECT *
FROM employees
WHERE salary <3500;

# 23. Write a query in SQL to list the name, job_name, and salary of any employee whose designation is ANALYST.    

SELECT emp_name,
       job_name,
       salary
FROM employees
WHERE job_name = 'ANALYST';


# 24. Write a query in SQL to list the employees who have joined in the year 1991. 
SELECT *
FROM employees
WHERE year(hire_date) = '1991';

# 25. Write a query in SQL to list the name, id, hire_date, and salary of all the employees joined before 1 apr 91.    
SELECT e.emp_id,
       e.emp_name,
       e.hire_date,
       e.salary
FROM employees e
WHERE hire_date <'1991-04-01';


# 26. Write a query in SQL to list the employee name, and job_name who are not working under a manager.    

    SELECT e.emp_name, e.job_name FROM employees e
    WHERE manager_id IS NULL;
    
# 27. Write a query in SQL to list all the employees joined on 1st may 91 

SELECT * FROM employees
WHERE hire_date = '1991-05-01';

# 28. Write a query in SQL to list the id, name, salary, and experiences of all the employees working for the manger 68319. 

SELECT 
    emp_id,
    emp_name,
    salary,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS Experience
FROM employees
WHERE manager_id = 68319;

# 29. Write a query in SQL to list the id, name, salary, and experience of all the employees who earn more than 100 as daily salary.  

SELECT emp_id,
       emp_name,
       salary,
       TIMESTAMPDIFF (year, hire_date, CURDATE()) "Experience"
FROM employees
WHERE (salary/30)>100;

# 30. Write a query in SQL to list the employees who are retiring after 31-Dec-99 after completion of 8 years of service period. 

SELECT emp_name, hire_date
FROM employees
WHERE DATE_ADD(hire_date, INTERVAL 96 MONTH) > '1999-12-31';


# 31. Write a query in SQL to list those employees whose salary is an odd value.    

SELECT *
FROM employees
WHERE salary % 2 = 1;

# 32. Write a query in SQL to list those employees whose salary contain only 3 digits. 

SELECT *
FROM employees
WHERE CHAR_LENGTH(CAST(FLOOR(salary) AS CHAR)) = 3;


# 33. Write a query in SQL to list the employees who joined in the month of APRIL.    

SELECT *
FROM employees
WHERE format (hire_date,'MMM') ='APR';


# 34. Write a query in SQL to list the employees those who joined in company before 19th of the month.    

SELECT *
FROM employees
WHERE day(hire_date) < '19';

# 35. List the employees who are SALESMAN and gathered an experience which month portion is more than 10.    

SELECT *
FROM employees
WHERE job_name = 'SALESMAN'
  AND  TIMESTAMPDIFF (month, hire_date, CURDATE())  > 10;

# 36. Write a query in SQL to list the employees of department id 3001 or 1001 joined in the year 1991.    

SELECT *
FROM employees
WHERE year(hire_date) = '1991'
  AND (dep_id =3001
       OR dep_id =1001);


# 37. Write a query in SQL to list the employees who are working for the department ID 1001 or 2001.

SELECT *
FROM employees
WHERE dep_id=1001
  OR dep_id=2001;


#  38. Write a query in SQL to list all the employees of designation CLERK in department no 2001.   

SELECT *
FROM employees
WHERE job_name ='CLERK'
  AND dep_id = 2001;


# 39. Write a query in SQL to list the ID, name, salary, and job_name of the employees for -    
#1. Annual salary is below 34000 but receiving some commission which should not be more than the salary,
#2. And designation is SALESMAN and working for department 3001.

SELECT emp_id,
       emp_name,
       salary,
       job_name
FROM employees
WHERE 12*(salary+commission) < 34000
  AND commission IS NOT NULL
  AND commission < salary
  AND job_name = 'SALESMAN'
  AND dep_id = 3001;

# 40. Write a query in SQL to list the employees who are either CLERK or MANAGER.

SELECT *
FROM employees
WHERE job_name IN ('CLERK','MANAGER');

# 41. Write a query in SQL to list the employees who joined in any year except the month February.    

SELECT *
FROM employees
WHERE FORMAT (hire_date,'MMM') NOT IN ('FEB');
       #or
       
 SELECT *
FROM employees
WHERE FORMAT (hire_date,'MMM') NOT LIKE 'FEB%';

# 42. Write a query in SQL to list the employees who joined in the year 91.    

SELECT *
FROM employees
WHERE hire_date BETWEEN '1991-01-01' AND '1991-12-31';


# 43. Write a query in SQL to list the employees who joined in the month of June in 1991. 

SELECT *
FROM employees
WHERE hire_date BETWEEN '1991-06-01' AND '1991-06-30';


# 44. Write a query in SQL to list the employees whose annual salary is within the range 24000 and 50000. 

SELECT *
FROM employees
WHERE 12*salary BETWEEN 24000 AND 50000;

# 45. Write a query in SQL to list the employees who have joined on the following dates 1st May,20th Feb, and 03rd Dec in the year 1991.    

SELECT *
FROM employees
WHERE format  (hire_date,'dd-MMM-yy') IN ('01-MAY-91',
                                         '20-FEB-91',
                                         '03-DEC-91');

# 46. Write a query in SQL to list the employees working under the managers 63679,68319,66564,69000.    

SELECT *
FROM employees
WHERE manager_id IN (63679,
                     68319,
                     66564,
                     69000);


# 47. Write a query in SQL to list the employees who joined after the month JUNE in the year 1992.    

SELECT *
FROM employees
WHERE hire_date BETWEEN '1992-07-01' AND '1992-12-31';

# 48. Write a query in SQL to list the employees who joined in 90's.    


 SELECT *
FROM employees
WHERE year(hire_date) BETWEEN '1990' AND '1999';

# 49. Write a query in SQL to list the managers of department 1001 or 2001.    

SELECT *
FROM employees
WHERE job_name = 'MANAGER'
  AND (dep_id = 1001
       OR dep_id =2001);


# 50. Write a query in SQL to list the employees, joined in the month FEBRUARY with a salary range between 1001 to 2000 

SELECT *
FROM employees
WHERE format (hire_date,'MMM') = 'FEB'
  AND salary BETWEEN 1000 AND 2000;

# 51. Write a query in SQL to list all the employees who joined before or after 1991. 

  SELECT *
FROM employees
WHERE year(hire_date) NOT IN ('1991');
        #OR

SELECT *
FROM employees
WHERE year(hire_date) NOT LIKE '1991';

# 52. Write a query in SQL to list the employees along with department name.    

SELECT e.emp_id,
       e.emp_name,
       e.job_name,
       e.manager_id,
       e.hire_date,
       e.salary,
       e.commission,
       e.dep_id,
       d.dep_name
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id;


# 53. Write a query in SQL to list the name, job name, annual salary, department id, department name and grade of the employees who earn 60000 in a year or not working as an ANALYST.   

SELECT e.emp_name,
       e.job_name,
       (12*e.salary)"Annual Salary",
       e.dep_id,
       d.dep_name,
       s.grade
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND (((12*e.salary)>= 60000)
       OR (e.job_name != 'ANALYST'))


# 54. Write a query in SQL to list the name, job name, manager id, salary, manager name, manager's salary for those employees whose salary is greater than the salary of their managers.

SELECT w.emp_name,
       w.job_name,
       w.manager_id,
       w.salary,
       m.emp_name "Manager",
       m.emp_id,
       m.salary "Manager_Salary"
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.salary > m.salary;


# 55. Write a query in SQL to list the employees name, department, salary and commission. For those whose salary is between 2000 and 5000 while location is PERTH.    

SELECT e.emp_name,
       e.dep_id,
       e.salary,
       e.commission
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND d.dep_location = 'PERTH'
  AND e.salary BETWEEN 2000 AND 5000;

# 56. Write a query in SQL to list the grade, employee name for the department id 1001 or 3001 but salary grade is not 4 while they joined the company before 1992-12-31.

SELECT s.grade,
       e.emp_name
FROM employees e,
     salary_grade s
WHERE e.dep_id IN (1001,
                   3001)
  AND hire_date < ('1992-12-31')
  AND (e.salary BETWEEN s.min_salary AND s.max_salary
       AND s.grade NOT IN (4));

# 57. Write a query in SQL to list the employees whose manager name is JONAS.   

SELECT w.emp_id,
       w.emp_name,
       w.job_name,
       w.manager_id,
       w.hire_date,
       w.salary,
       w.dep_id,
       m.emp_name
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND m.emp_name = 'JONAS';


# 58. Write a query in SQL to list the name and salary of FRANK if his salary is equal to max_sal of his grade.  

SELECT e.emp_name,
       e.salary
FROM employees e,
     salary_grade s
WHERE e.emp_name = 'FRANK'
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND e.salary = s.max_salary ;


# 59. Write a query in SQL to list the employees who are working either MANAGER or ANALYST with a salary range between 2000 to 5000 without any commission.   

SELECT *
FROM employees
WHERE job_name IN ('MANAGER',
                   'ANALYST')
  AND salary BETWEEN 2000 AND 5000
  AND commission IS NULL;

# 60. Write a query in SQL to list the id, name, salary, and location of the employees working at PERTH,or MELBOURNE with an experience over 10 years.  

SELECT 
    e.emp_id,
    e.emp_name,
    e.dep_id,
    e.salary,
    d.dep_location
FROM employees e
JOIN department d
    ON e.dep_id = d.dep_id
WHERE d.dep_location IN ('PERTH', 'MELBOURNE')
  AND TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) > 10;



# 61. Write a query in SQL to list the employees along with their location who belongs to SYDNEY, MELBOURNE with a salary range between 2000 and 5000 and joined in 1991 

SELECT e.emp_id,
       e.emp_name,
       e.dep_id,
       e.salary,
       d.dep_location
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND d.dep_location IN ('SYDNEY',
                         'MELBOURNE')
  AND year(e.hire_date) = '1991'
  AND e.salary BETWEEN 2000 AND 5000;


# 62. Write a query in SQL to list the employees with their location and grade for MARKETING department who comes from MELBOURNE or PERTH within the grade 3 to 5 and experience over 5 years.   

SELECT 
    e.dep_id,
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dep_name,
    d.dep_location,
    s.grade
FROM employees e
JOIN department d 
    ON e.dep_id = d.dep_id
JOIN salary_grade s 
    ON e.salary BETWEEN s.min_salary AND s.max_salary
WHERE s.grade IN (3, 4, 5)
  AND TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) > 5
  AND d.dep_name = 'MARKETING'
  AND d.dep_location IN ('MELBOURNE', 'PERTH');


# 63. Write a query in SQL to list the employees who are senior to their own manager. 

SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.hire_date < m.hire_date;


# 64. Write a query in SQL to list the employee with their grade for the grade 4.    


SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary
  AND s.grade = 4;

# 65. Write a query in SQL to list the employees in department PRODUCTION or AUDIT who joined after 1991 and they are not MARKER or ADELYN to their name. 

SELECT e.emp_name
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND d.dep_name IN ('PRODUCTION',
                     'AUDIT')
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND e.emp_name NOT IN ('MARKER',
                         'ADELYN')
  AND YEAR(hire_date) >'1991';




# 66. Write a query in SQL to list the employees in the ascending order of their salaries.    

SELECT * 
FROM employees 
ORDER BY salary ASC;

# 67. Write a query in SQL to list the details of the employees in ascending order to the department_id and descending order to the jobs.    

SELECT *
FROM employees
ORDER BY dep_id ASC,
         job_name DESC;

# 68. Write a query in SQL to display all the unique job in descending order.   

SELECT DISTINCT job_name
FROM employees
ORDER BY job_name DESC;

# 69. Write a query in SQL to list the id, name, monthly salary, daily salary of all the employees in the ascending order of their annual salary.    

SELECT emp_id,
       emp_name,
       salary Monthly_Salary,
       salary/30 Daily_Salary,
       12*salary Anual_Salary
FROM employees
ORDER BY Anual_Salary ASC;


# 70. Write a query in SQL to list the employees in descending order who are either 'CLERK' or 'ANALYST'. 

SELECT *
FROM employees
WHERE job_name='CLERK'
  OR job_name='ANALYST'
ORDER BY job_name DESC;

# 71. Write a query in SQL to display the location of CLARE 

SELECT dep_location
FROM department d,
     employees e
WHERE e.emp_name = 'CLARE'
  AND e.dep_id = d.dep_id ;

# 72. Write a query in SQL to list the employees in ascending order of seniority who joined on 1-MAY-91,or 3-DEC-91, or 19-JAN-90.   

SELECT *
FROM employees
WHERE hire_date IN ('1991-5-01',
                    '1991-12-03',
                    '1990-01-19')
ORDER BY hire_date ASC;

# 73. Write a query in SQL to list the employees who are drawing the salary less than 1000 and sort the output in ascending order on salary. 

SELECT *
FROM employees
WHERE salary < 1000
ORDER BY salary;

# 74. Write a query in SQL to list the details of the employees in ascending order on the salary. 

SELECT *
FROM employees
ORDER BY salary ASC;

# 75. Write a query in SQL to list the employees in ascending order on job name and descending order on employee id.    


SELECT *
FROM employees e
ORDER BY e.job_name ASC,
         e.emp_id DESC ;

# 76. Write a query in SQL to list the unique jobs of department 2001 and 3001 in descending order.    

SELECT DISTINCT job_name
FROM employees
WHERE dep_id IN (2001,
                 3001)
ORDER BY job_name DESC;

# 77. Write a query in SQL to list all the employees except PRESIDENT and MANAGER in ascending order of salaries.    

SELECT *
FROM employees
WHERE job_name NOT IN ('PRESIDENT',
                       'MANAGER')
ORDER BY salary ASC;


# 78. Write a query in SQL to list the employees in ascending order of the salary whose annual salary is below 25000.    

SELECT *
FROM employees
WHERE (12*salary) < 25000
ORDER BY salary ASC;


# 79. Write a query in SQL to list the employee id, name, annual salary, daily salary of all the employees in the ascending order of annual salary who works as a SALESMAN.   

SELECT e.emp_id,
       e.emp_name,
       12*salary "Annual Salary",
       (12*salary)/365 "Daily Salary"
FROM employees e
WHERE e.job_name = 'SALESMAN'
ORDER BY "Annual Salary" ASC;

# 80. Write a query in SQL to list the employee id, name, hire_date, current date and experience of the employees in ascending order on their experiences.   


SELECT 
    e.dep_id,
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dep_name,
    d.dep_location,
    s.grade
FROM employees e
JOIN department d 
    ON e.dep_id = d.dep_id
JOIN salary_grade s 
    ON e.salary BETWEEN s.min_salary AND s.max_salary
WHERE s.grade IN (3, 4, 5)
  AND TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) > 5
  AND d.dep_name = 'MARKETING'
  AND d.dep_location IN ('MELBOURNE', 'PERTH');




# 81. Write a query in SQL to list the employees in ascending order of designations of those, joined after the second half of 1991.   

SELECT *
FROM employees
WHERE hire_date>('1991-6-30')
  AND year(hire_date)=1991
ORDER BY job_name ASC;


# 82. Write a query in SQL to list the total information of employees table along with department, and location of all the employees working under FINANCE and AUDIT in the ascending department no. 

SELECT *
FROM employees e,
     department d
WHERE (dep_name = 'FINANCE'
       OR dep_name ='AUDIT')
  AND e.dep_id = d.dep_id
ORDER BY e.dep_id ASC;


# 83. Write a query in SQL to display the total information of the employees along with grades in ascending order.    

SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary
ORDER BY grade ASC;

        # Or
SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary >= s.min_salary
  AND e.salary <= s.max_salary
ORDER BY s.grade ASC;



# 84. Write a query in SQL to list the name, job name, department, salary, and grade of the employees according to the department in ascending order 

SELECT e.emp_name,
       e.job_name,
       (12*e.salary)"Annual Salary",
       e.dep_id,
       d.dep_name,
       s.grade
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND (((12*e.salary)>= 60000)
       OR (e.job_name != 'ANALYST'))

# 85. Write a query in SQL to list the name, job name, salary, grade and department name of employees except CLERK and sort result set on the basis of highest salary.

SELECT e.emp_name,
       e.job_name,
       e.salary,
       s.grade,
       d.dep_name
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND e.job_name NOT IN('CLERK')
ORDER BY e.salary DESC;


# 86. Write a query in SQL to list the employee ID, name, salary, department, grade, experience, and annual salary of employees working for department 1001 or 2001.  

SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    s.grade,
    d.dep_name,
    TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) AS Experience,
    12 * e.salary AS `Annual Salary`
FROM employees e
JOIN department d 
    ON e.dep_id = d.dep_id
JOIN salary_grade s 
    ON e.salary BETWEEN s.min_salary AND s.max_salary
WHERE e.dep_id IN (1001, 2001);



# 87. Write a query in SQL to list the details of the employees along with the details of their departments. 

SELECT *
FROM employees e,
     department d
WHERE e.dep_id= d.dep_id;

# 88. Write a query in SQL to list the employees who are senior to their own MANAGERS.    

SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.hire_date < m.hire_date;


#  OR

SELECT *
FROM employees w,
     employees m
WHERE w.emp_id= m.manager_id
  AND w.hire_date> m.hire_date;


# 89. Write a query in SQL to list the employee id, name, salary, and department id of the employees in ascending order of salary who works in the department 1001.   

SELECT e.emp_id,
       e.emp_name,
       e.salary,
       e.dep_id
FROM employees E
WHERE e.dep_id = 1001
ORDER BY e.salary ASC;

# 90. Write a query in SQL to find the highest salary from all the employees.    

SELECT max(salary)
FROM employees;


# 91. Write a query in SQL to find the average salary and average total remuneration(salary and commission) for each type of job.    

SELECT job_name,
       avg(salary),
       avg(salary+commission)
FROM employees
GROUP BY job_name;


# 92. Write a query in SQL to find the total annual salary distributed against each job in the year 1991. 

SELECT job_name,
       sum(12*salary)
FROM employees
WHERE year(hire_date) = '1991'
GROUP BY job_name;

# 93. Write a query in SQL to list the employee id, name, department id, location of all the employees.    

SELECT e.emp_id,
       e.emp_name,
       e.dep_id,
       d.dep_location
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id ;

# 94. Write a query in SQL to list the employee id, name, location, department of all the departments 1001 and 2001.    

SELECT e.emp_id,
       e.emp_name,
       e.dep_id,
       d.dep_location,
       d.dep_name
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND e.dep_id IN (1001,
                   2001);

# 95. Write a query in SQL to list the employee id, name, salary, grade of all the employees. Sample table: employees


       SELECT e.emp_id,
       e.emp_name,
       e.salary,
       s.grade
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary ;


# 96. Write a query in SQL to list the manager no and the number of employees working for those managers in ascending order on manager id.    

SELECT w.manager_id,
       count(*)
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
GROUP BY w.manager_id
ORDER BY w.manager_id ASC;



# 97. Write a query in SQL to display the number of employee for each job in each department.    

SELECT dep_id,
       job_name,
       count(*)
FROM employees
GROUP BY dep_id,
         job_name;


# 98. Write a query in SQL to list the department where at least two employees are working.    

SELECT dep_id,
       count(*)
FROM employees
GROUP BY dep_id
HAVING count(*) >= 2;


# 99. Write a query in SQL to display the Grade, Number of employees, and maximum salary of each grade.   

SELECT s.grade,
       count(*),
       max(salary)
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary
GROUP BY s.grade;


# 100. Write a query in SQL to display the department name, grade, no. of employees where at least two employees are working as a SALESMAN.    

SELECT d.dep_name,
       s.grade,
       count(*)
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.job_name = 'SALESMAN'
  AND e.salary BETWEEN s.min_salary AND s.max_salary
GROUP BY d.dep_name,
         s.grade
HAVING count(*) >= 2;

# 101. Write a query in SQL to list the no. of employees in each department where the no. is less than 4. 

SELECT dep_id,
       count(*)
FROM employees
GROUP BY dep_id
HAVING count(*)<4;


# 102. Write a query in SQL to list the name of departments where atleast 2 employees are working in that department.    

SELECT d.dep_name,
       count(*)
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
GROUP BY d.dep_name
HAVING count(*) >= 2;

# 103. Write a query in SQL to check whether all the employees numbers are indeed unique.    

SELECT emp_id,
       count(*)
FROM employees
GROUP BY emp_id;
# 104. Write a query in SQL to list the no. of employees and average salary within each department for each job name.    

SELECT count(*),
       avg(salary),
       dep_id,
       job_name
FROM employees
GROUP BY dep_id,
         job_name;

# 105. Write a query in SQL to list the names of those employees starting with 'A' and with six characters in length.    

SELECT emp_name
FROM employees
WHERE emp_name LIKE 'A%'
  AND CHAR_LENGTH(TRIM(emp_name)) = 6;



# 106. Write a query in SQL to list the employees whose name is six characters in length and third character must be 'R'.    

SELECT *
FROM employees
WHERE CHAR_LENGTH(TRIM(emp_name)) = 6
  AND emp_name LIKE '__R%';


# 107. Write a query in SQL to list the name of the employee of six characters long and starting with 'A' and ending with 'N'.    

SELECT *
FROM employees
WHERE char_length(trim(emp_name))=6
  AND emp_name LIKE 'A%N';


# 108. Write a query in SQL to list the employees who joined in the month of which second character is 'a'.   

SELECT *
FROM employees
WHERE FORMAT (hire_date,'MMM') LIKE '_a%';

# 109. Write a query in SQL to list the employees whose names containing the character set 'AR' together.   

SELECT *
FROM employees
WHERE emp_name LIKE '%AR%';


# 110. Write a query in SQL to list the employees those who joined in 90's.    


SELECT *
FROM employees
WHERE format(hire_date, 'yy') LIKE '9%';

# 111. Write a query in SQL to list the employees whose ID not starting with digit 68.    

SELECT *
FROM employees
WHERE emp_id  NOT LIKE '68%';

# 112. Write a query in SQL to list the employees whose names containing the letter 'A'.   


SELECT *
FROM employees
WHERE emp_name LIKE '%A%';


# 113. Write a query in SQL to list the employees whose name is ending with 'S' and six characters long.    

SELECT *
FROM employees
WHERE emp_name LIKE '%S'
  AND char_length(trim(emp_name)) = 6;


# 114. Write a query in SQL to list the employees who joined in the month having char 'A' at any position. 
	
SELECT *
FROM employees
WHERE DATE_FORMAT(hire_date, '%b') LIKE '%a%';


# 115. Write a query in SQL to list the employees who joined in the month having second char is 'A'.    


SELECT *
FROM employees
WHERE UPPER(DATE_FORMAT(hire_date, '%b')) LIKE '_A%';
 

    
    














