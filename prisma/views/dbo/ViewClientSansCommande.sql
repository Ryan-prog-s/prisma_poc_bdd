SELECT
  c.*
FROM
  dbo.Customers AS c
  LEFT JOIN dbo.Orders AS o ON c.CustomerID = o.CustomerID
WHERE
  o.OrderID IS NULL;