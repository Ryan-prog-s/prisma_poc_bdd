SELECT
  r.RegionID,
  r.RegionDescription,
  p.ProductID,
  p.ProductName,
  SUM(od.Quantity) AS Qte
FROM
  Products AS p
  JOIN dbo.[Order Details] AS od ON od.ProductID = p.ProductID
  JOIN dbo.[Orders] AS o ON o.OrderID = od.OrderID
  JOIN dbo.[Employees] AS e ON e.EmployeeID = o.EmployeeID
  JOIN dbo.[EmployeeTerritories] AS et ON et.EmployeeID = e.EmployeeID
  JOIN dbo.[Territories] AS t ON t.TerritoryID = et.TerritoryID
  JOIN dbo.[Region] AS r ON r.RegionID = t.RegionID
GROUP BY
  r.RegionID,
  r.RegionDescription,
  p.ProductID,
  p.ProductName;