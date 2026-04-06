SELECT 
    e.department,
    e.name,
    e.salary AS max_salary,
    dept_avg.avg_salary
FROM employees e
JOIN (
    -- Get the maximum salary for each department
    SELECT 
        department,
        MAX(salary) AS max_salary
    FROM employees
    GROUP BY department
) dept_max
ON e.department = dept_max.department
AND e.salary = dept_max.max_salary

JOIN (
    -- Calculate the average salary for each department
    SELECT 
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) dept_avg
ON e.department = dept_avg.department;