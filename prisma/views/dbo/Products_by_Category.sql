SELECT
  Categories.CategoryName,
  Products.ProductName,
  Products.QuantityPerUnit,
  Products.UnitsInStock,
  Products.Discontinued
FROM
  Categories
  JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE
  Products.Discontinued <> 1;