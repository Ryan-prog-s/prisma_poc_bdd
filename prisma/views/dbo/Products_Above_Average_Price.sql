SELECT
  Products.ProductName,
  Products.UnitPrice
FROM
  Products
WHERE
  Products.UnitPrice > (
    SELECT
      AVG(UnitPrice)
    FROM
      Products
  );