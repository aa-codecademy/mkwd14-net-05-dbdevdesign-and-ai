Select p.Name, s.Name, ps.Price, STRING_AGG(i.[Name], ', ') as Ingredients
From PizzaSizes ps
INNER JOIN Pizzas p ON ps.PizzaId = p.Id
INNER JOIN Sizes s ON s.Id = ps.SizeId
INNER JOIN PizzaIngredients pi ON p.Id = pi.PizzaId
INNER JOIN Ingredients i ON i.Id = pi.IngredientId
GROUP BY p.Name, s.Name, ps.Price