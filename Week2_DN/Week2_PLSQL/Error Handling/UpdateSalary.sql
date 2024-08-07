CREATE PROCEDURE UpdateSalary (
    p_EmployeeID IN Employees.EmployeeID%TYPE,
    p_Percentage IN NUMBER
)
IS
    v_Salary Employees.Salary%TYPE;
BEGIN
    -- Get the current salary of the employee
    SELECT Salary INTO v_Salary
    FROM Employees
    WHERE EmployeeID = p_EmployeeID
    FOR UPDATE;

    -- Increase the salary by the given percentage
    UPDATE Employees
    SET Salary = Salary + (Salary * p_Percentage / 100), LastModified = SYSDATE
    WHERE EmployeeID = p_EmployeeID;

    COMMIT;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ID ' || p_EmployeeID || ' does not exist.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error during salary update: ' || SQLERRM);
        ROLLBACK;
END UpdateSalary;
/
