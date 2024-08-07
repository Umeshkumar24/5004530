UPDATE Loans SET InterestRate = InterestRate - 1
WHERE CustomerID IN (
    SELECT CustomerID FROM Customers
    WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, DOB) / 12) > 60
);
