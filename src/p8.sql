SELECT *
FROM employees
WHERE department = 'Sales' AND salary > 50000;
-- This query finds all employees who are in the ‘Sales’ department and have a salary greater than 50,000.


--Index suggestion:
--CREATE INDEX idx_department_salary ON employees(department, salary);

--Reason:
-- The index lets the database quickly find employees in Sales with salary over 50,000
-- without scanning the entire table.
-- department first, then salary works best because department uses = and salary uses >.

--Trade-offs:
--Index uses extra storage.
--Inserts, updates, or deletes on the table will be slightly slower.