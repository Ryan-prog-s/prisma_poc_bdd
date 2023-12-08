SELECT
  Categories.CategoryName,
  Products.ProductName,
  Sum(
    CONVERT(
      money,
      (
        "Order Details".UnitPrice * Quantity * (1 - Discount) / 100
      )
    ) * 100
  ) AS ProductSales
FROM
  (
    Categories
    JOIN Products ON Categories.CategoryID = Products.CategoryID
  )
  JOIN (
    Orders
    JOIN "Order Details" ON Orders.OrderID = "Order Details".OrderID
  ) ON Products.ProductID = "Order Details".ProductID
WHERE
  (
    (
      (Orders.ShippedDate) BETWEEN '19970101' AND '19971231'
    )
  )
GROUP BY
  Categories.CategoryName,
  Products.ProductName;