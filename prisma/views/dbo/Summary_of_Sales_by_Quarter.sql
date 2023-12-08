SELECT
  Orders.ShippedDate,
  Orders.OrderID,
  "Order Subtotals".Subtotal
FROM
  Orders
  JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
WHERE
  Orders.ShippedDate IS NOT NULL;