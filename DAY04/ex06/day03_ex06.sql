WITH pizza(menu_id, pizza_name, pizzeria_name, price) AS (
    SELECT menu.id, menu.pizza_name, pizzeria.name, menu.price
    FROM menu JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
)   
SELECT pizza.pizza_name, p.pizzeria_name AS pizzeria_name_1 , pizza.pizzeria_name AS pizzeria_name_2, pizza.price
FROM
    pizza
    JOIN pizza AS p ON pizza.pizza_name = p.pizza_name AND pizza.price = p.price AND pizza.menu_id != p.menu_id AND pizza.menu_id < p.menu_id
ORDER BY pizza.pizza_name;