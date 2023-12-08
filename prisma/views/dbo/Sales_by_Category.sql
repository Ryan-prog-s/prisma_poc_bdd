SELECT
  Categories.CategoryID,
  Categories.CategoryName,
  Products.ProductName,
  Sum("Order Details Extended".ExtendedPrice) AS ProductSales
FROM
  Categories
  JOIN (
    Products
    JOIN (
      Orders
      JOIN "Order Details Extended" ON Orders.OrderID = "Order Details Extended".OrderID
    ) ON Products.ProductID = "Order Details Extended".ProductID
  ) ON Categories.CategoryID = Products.CategoryID
WHERE
  Orders.OrderDate BETWEEN '19970101' AND '19971231'
GROUP BY
  Categories.CategoryID,
  Categories.CategoryName,
  Products.ProductName;