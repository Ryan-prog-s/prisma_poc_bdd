SELECT
  p.ProductName,
  p.ProductID
FROM
  Products AS p
  LEFT JOIN [Order Details] AS od ON p.ProductID = od.ProductID
WHERE
  od.ProductID IS NULL;