CREATE OR REPLACE FUNCTION HasSufficientBalance (
    p_AccountID IN Accounts.AccountID%TYPE,
    p_Amount IN NUMBER
) RETURN BOOLEAN
IS
    v_Balance Accounts.Balance%TYPE;
BEGIN
    -- Get the balance of the specified account
    SELECT Balance INTO v_Balance
    FROM Accounts
    WHERE AccountID = p_AccountID;

    -- Check if the balance is sufficient
    IF v_Balance >= p_Amount THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Account ID ' || p_AccountID || ' does not exist.');
        RETURN FALSE;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error checking balance: ' || SQLERRM);
        RETURN FALSE;
END HasSufficientBalance;
/
