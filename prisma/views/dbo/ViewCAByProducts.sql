SELECT
  p.*,
  ReqCA.Qte,
  ROUND(ReqCA.computed, 2) AS CA,
  ROUND(ReqCA.computed / ReqCA.Qte, 2) AS AvgPrice
FROM
  Products AS p
  JOIN (
    SELECT
      od.ProductID,
      SUM(od.Quantity) AS Qte,
      SUM(od.UnitPrice * (1 - od.Discount) * od.Quantity) AS computed
    FROM
      [Order Details] AS od
    GROUP BY
      od.ProductID
  ) AS ReqCA ON ReqCA.ProductID = p.ProductID;