-- �������� ��������� dbo.usp_MakeFamilyPurchase
CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
    @FamilySurName VARCHAR(255)
AS
BEGIN
    -- ���������� ������ � ������� dbo.Family
    UPDATE dbo.Family
    SET BudgetValue = BudgetValue - (SELECT SUM(Value) FROM dbo.Basket WHERE dbo.Family.SurName = @FamilySurName)
    WHERE SurName = @FamilySurName;

    -- �������� ������� ����� � ������� dbo.Family
    IF @@ROWCOUNT = 0
    BEGIN
        RAISERROR('������: ����� � ��������� �������� �� ����������!', 16, 1);
        RETURN;
    END;
END;