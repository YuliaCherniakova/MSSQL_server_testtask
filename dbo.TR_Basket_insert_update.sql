-- Ñîçäàíèå ïðîöåäóðû dbo.usp_MakeFamilyPurchase
CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
    @FamilySurName VARCHAR(255)
AS
BEGIN
    -- Îáíîâëåíèå äàííûõ â òàáëèöå dbo.Family
    UPDATE dbo.Family
    SET BudgetValue = BudgetValue - (SELECT SUM(Value) FROM dbo.Basket WHERE dbo.Family.SurName = @FamilySurName)
    WHERE SurName = @FamilySurName;

    -- Ïðîâåðêà íàëè÷èÿ ñåìüè â òàáëèöå dbo.Family
    IF @@ROWCOUNT = 0
    BEGIN
        RAISERROR('Error: This family does not exist!', 16, 1);
        RETURN;
    END;
END;
