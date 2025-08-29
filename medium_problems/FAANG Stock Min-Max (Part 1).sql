WITH stock_max_open AS (
  SELECT 
    Sp.ticker, 
    TO_CHAR(date, 'Mon-YYYY') AS highest_mth, 
    Mx.highest_open 
  FROM stock_prices Sp 
  INNER JOIN (
    SELECT 
        ticker, 
        MAX(open) as highest_open 
      FROM stock_prices 
      GROUP BY ticker 
  ) Mx 
  ON Sp.ticker = Mx.ticker AND Sp.open = Mx.highest_open
), stock_min_open AS (
  SELECT 
    Sp.ticker, 
    TO_CHAR(date, 'Mon-YYYY') AS lowest_mth, 
    Mn.lowest_open 
  FROM stock_prices Sp 
  INNER JOIN (
    SELECT 
        ticker, 
        MIN(open) as lowest_open
      FROM stock_prices 
      GROUP BY ticker 
  ) Mn
  ON Sp.ticker = Mn.ticker AND Sp.open = Mn.lowest_open
)


SELECT 
  Mx.ticker, 
  Mx.highest_mth, 
  Mx.highest_open, 
  Mn.lowest_mth, 
  Mn.lowest_open
FROM stock_max_open Mx 
INNER JOIN stock_min_open Mn 
ON Mx.ticker = Mn.ticker 
ORDER BY ticker ASC




