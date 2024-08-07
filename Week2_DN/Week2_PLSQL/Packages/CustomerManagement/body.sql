-- Package Body
CREATE OR REPLACE PACKAGE BODY CustomerManagement AS
    PROCEDURE AddNewCustomer(
        p_CustomerID IN NUMBER,
        p_Name IN VARCHAR2,
        p_DOB IN DATE
    ) IS
    BEGIN
        INSERT INTO Customers (CustomerID, Name, DOB, LastModified)
        VALUES (p_CustomerID, p_Name, p_DOB, SYSDATE);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Customer with this ID already exists.');
    END AddNewCustomer;

    PROCEDURE UpdateCustomerDetails(
        p_CustomerID IN NUMBER,
        p_Name IN VARCHAR2,
        p_DOB IN DATE
    ) IS
    BEGIN
        UPDATE Customers
        SET Name = p_Name, DOB = p_DOB, LastModified = SYSDATE
        WHERE CustomerID = p_CustomerID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Customer with this ID does not exist.');
    END UpdateCustomerDetails;

    FUNCTION GetCustomerBalance(
        p_CustomerID IN NUMBER
    ) RETURN NUMBER IS
        v_Balance NUMBER := 0;
    BEGIN
        SELECT SUM(a.Balance)
        INTO v_Balance
        FROM Accounts a
        WHERE a.CustomerID = p_CustomerID;

        RETURN v_Balance;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
    END GetCustomerBalance;
END CustomerManagement;
/
