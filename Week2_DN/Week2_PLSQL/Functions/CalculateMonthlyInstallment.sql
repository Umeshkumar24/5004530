CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment (
    p_LoanAmount IN NUMBER,
    p_InterestRate IN NUMBER,
    p_LoanDuration IN NUMBER
) RETURN NUMBER
IS
    v_MonthlyRate NUMBER;
    v_NumberOfPayments NUMBER;
    v_MonthlyInstallment NUMBER;
BEGIN
    -- Convert annual interest rate to monthly and number of years to number of months
    v_MonthlyRate := p_InterestRate / 12 / 100;
    v_NumberOfPayments := p_LoanDuration * 12;

    -- Calculate the monthly installment using the formula for an annuity
    v_MonthlyInstallment := p_LoanAmount * v_MonthlyRate / (1 - POWER(1 + v_MonthlyRate, -v_NumberOfPayments));

    RETURN v_MonthlyInstallment;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error calculating monthly installment: ' || SQLERRM);
        RETURN NULL;
END CalculateMonthlyInstallment;
/
