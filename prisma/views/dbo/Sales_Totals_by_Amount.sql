SELECT
  "Order Subtotals".Subtotal AS SaleAmount,
  Orders.OrderID,
  Customers.CompanyName,
  Orders.ShippedDate
FROM
  Customers
  JOIN (
    Orders
    JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
  ) ON Customers.CustomerID = Orders.CustomerID
WHERE
  ("Order Subtotals".Subtotal > 2500)
  AND (
    Orders.ShippedDate BETWEEN '19970101' AND '19971231'
  );