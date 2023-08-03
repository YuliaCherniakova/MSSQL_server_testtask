-- Создание представления dbo.vw_SKUPrice
CREATE VIEW dbo.vw_SKUPrice
AS
SELECT *, dbo.udf_GetSKUPrice(@Price) AS product_price
FROM dbo.SKU;
