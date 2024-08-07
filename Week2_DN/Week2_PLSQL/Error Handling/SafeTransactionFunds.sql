CREATE PROCEDURE SafeTransferFunds (
    p_FromAccountID IN Accounts.AccountID%TYPE,
    p_ToAccountID IN Accounts.AccountID%TYPE,
    p_Amount IN NUMBER
)
IS
    v_FromBalance Accounts.Balance%TYPE;
    v_ToBalance Accounts.Balance%TYPE;
BEGIN
    -- Get the balance of the source account
    SELECT Balance INTO v_FromBalance
    FROM Accounts
    WHERE AccountID = p_FromAccountID
    FOR UPDATE;

    -- Check if the source account has sufficient funds
    IF v_FromBalance < p_Amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds in the source account.');
    END IF;

    -- Deduct the amount from the source account
    UPDATE Accounts
    SET Balance = Balance - p_Amount, LastModified = SYSDATE
    WHERE AccountID = p_FromAccountID;

    -- Add the amount to the destination account
    UPDATE Accounts
    SET Balance = Balance + p_Amount, LastModified = SYSDATE
    WHERE AccountID = p_ToAccountID;

    COMMIT;

EXCEPTION 
        WHEN OTHERS THEN ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error during fund transfer: ' || SQLERRM);
END SafeTransferFunds;
