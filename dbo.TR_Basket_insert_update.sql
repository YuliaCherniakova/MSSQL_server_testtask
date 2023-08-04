-- Создание процедуры dbo.usp_MakeFamilyPurchase
CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
    @FamilySurName VARCHAR(255)
AS
BEGIN
    -- Обновление данных в таблице dbo.Family
    UPDATE dbo.Family
    SET BudgetValue = BudgetValue - (SELECT SUM(Value) FROM dbo.Basket WHERE dbo.Family.SurName = @FamilySurName)
    WHERE SurName = @FamilySurName;

    -- Проверка наличия семьи в таблице dbo.Family
    IF @@ROWCOUNT = 0
    BEGIN
        RAISERROR('Ошибка: Семьи с указанной фамилией не существует!', 16, 1);
        RETURN;
    END;
END;