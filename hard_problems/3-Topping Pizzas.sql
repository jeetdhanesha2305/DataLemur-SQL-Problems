SELECT 
  CONCAT(
    P1.topping_name, ',', 
    P2.topping_name, ',', 
    P3.topping_name
  ) AS pizza, 
  (
    P1.ingredient_cost + 
    P2.ingredient_cost + 
    P3.ingredient_cost
  ) AS total_cost
FROM pizza_toppings P1 
CROSS JOIN pizza_toppings P2 
CROSS JOIN pizza_toppings P3 
WHERE 
  P1.topping_name < P2.topping_name AND  
  P2.topping_name < P3.topping_name 
ORDER BY total_cost DESC, pizza ASC