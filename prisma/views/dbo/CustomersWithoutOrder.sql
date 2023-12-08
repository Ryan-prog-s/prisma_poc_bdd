SELECT
  [c].[CustomerID],
  [c].[Address],
  [c].[City],
  [c].[CompanyName],
  [c].[ContactName],
  [c].[ContactTitle],
  [c].[Country],
  [c].[Fax],
  [c].[Phone],
  [c].[PostalCode],
  [c].[Region]
FROM
  [Customers] AS [c]
  LEFT JOIN [Orders] AS [o] ON [c].[CustomerID] = [o].[CustomerID]
WHERE
  [o].OrderID IS NULL;