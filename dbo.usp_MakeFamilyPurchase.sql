-- Создание триггера dbo.TR_Basket_insert_update
CREATE TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT, UPDATE
AS
BEGIN
    -- Обновление значений в поле DiscountValue
    UPDATE B
    SET DiscountValue = CASE
                            WHEN C.Count >= 2 THEN B.Value * 0.05
                            ELSE 0
                       END
    FROM dbo.Basket AS B
    INNER JOIN (
                    SELECT ID_SKU, COUNT(*) AS Count
                    FROM dbo.Basket
                    WHERE ID_SKU IN (SELECT ID_SKU FROM Inserted)
                    GROUP BY ID_SKU
               ) AS C ON B.ID_SKU = C.ID_SKU;
END;