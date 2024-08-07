DECLARE
    CURSOR c_Accounts IS
        SELECT AccountID, Balance
        FROM Accounts;

    v_AccountID Accounts.AccountID%TYPE;
    v_Balance Accounts.Balance%TYPE;
    v_AnnualFee NUMBER := 50; -- Annual maintenance fee amount

BEGIN
    OPEN c_Accounts;
    LOOP
        FETCH c_Accounts INTO v_AccountID, v_Balance;
        EXIT WHEN c_Accounts%NOTFOUND;

        -- Deduct the annual fee
        UPDATE Accounts
        SET Balance = Balance - v_AnnualFee
        WHERE AccountID = v_AccountID;

    END LOOP;
    CLOSE c_Accounts;

    COMMIT;
END;
/
