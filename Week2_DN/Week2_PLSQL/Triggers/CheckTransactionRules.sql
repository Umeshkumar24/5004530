CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
    v_Balance NUMBER;
BEGIN
    -- Check for withdrawals exceeding the balance
    IF :NEW.TransactionType = 'Withdrawal' THEN
        -- Retrieve the current balance of the account
        SELECT Balance INTO v_Balance
        FROM Accounts
        WHERE AccountID = :NEW.AccountID
        FOR UPDATE;

        -- Ensure the balance is sufficient
        IF v_Balance < :NEW.Amount THEN
            RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds for withdrawal.');
        END IF;
    END IF;

    -- Ensure deposits are positive
    IF :NEW.TransactionType = 'Deposit' THEN
        IF :NEW.Amount <= 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'Deposit amount must be positive.');
        END IF;
    END IF;
END;
/
