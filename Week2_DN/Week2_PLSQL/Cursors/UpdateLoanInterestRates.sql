DECLARE
    CURSOR c_Loans IS
        SELECT LoanID, InterestRate
        FROM Loans;

    v_LoanID Loans.LoanID%TYPE;
    v_OldInterestRate Loans.InterestRate%TYPE;
    v_NewInterestRate Loans.InterestRate%TYPE;

BEGIN
    OPEN c_Loans;
    LOOP
        FETCH c_Loans INTO v_LoanID, v_OldInterestRate;
        EXIT WHEN c_Loans%NOTFOUND;

        -- Define new interest rate based on policy
        v_NewInterestRate := v_OldInterestRate + 0.5; -- Example: increase by 0.5%

        -- Update the interest rate for the loan
        UPDATE Loans
        SET InterestRate = v_NewInterestRate
        WHERE LoanID = v_LoanID;

    END LOOP;
    CLOSE c_Loans;

    COMMIT;
END;
/
