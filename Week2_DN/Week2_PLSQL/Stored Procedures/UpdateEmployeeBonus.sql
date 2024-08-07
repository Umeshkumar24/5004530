CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_Department IN Employees.Department%TYPE,
    p_BonusPercentage IN NUMBER
)
IS
BEGIN
    -- Update the salary of employees in the given department by adding the bonus percentage
    UPDATE Employees
    SET Salary = Salary + (Salary * p_BonusPercentage / 100),
        LastModified = SYSDATE
    WHERE Department = p_Department;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error updating employee bonus: ' || SQLERRM);
END UpdateEmployeeBonus;
/
