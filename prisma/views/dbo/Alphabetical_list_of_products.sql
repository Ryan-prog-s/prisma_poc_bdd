SELECT
  Products.*,
  Categories.CategoryName
FROM
  Categories
  JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE
  (((Products.Discontinued) = 0));