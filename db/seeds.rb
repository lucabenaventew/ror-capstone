# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


## Tresor -----------

tresor = User.create(name: 'luca', email: 'gato@test.com', password: 'password')
inventory_tresor =  Inventory.create(name: "inventory for tresor", user: tresor)

recipe_tresor_1 = Recipe.create(name: 'Apple Pie', preparation_time: '20 min', cooking_time: '45 min', description: 'I remember coming home sullen one day because we d lost a softball game. Grandma, in her wisdom, suggested, "Maybe a slice of my homemade apple pie will make you feel better." One bite, and Grandma was right. If you want to learn how to make homemade apple pie filling, this is retresor the only recipe you need. —Maggie Greene, Granite Falls, Washington', public: true, user: tresor)
recipe_tresor_2 = Recipe.create(name: 'Puff Pastry Apple Strudel', preparation_time: '30 min', cooking_time: '25 min', description: 'This puff pastry apple strudel is such a fun recipe. It can be served alone or with a side salad. Different types of cheese, like goat, feta or jack, can be used in this dish. —Donna-Marie Ryan, Topsfield, Massachusetts', public: true, user: tresor)
recipe_tresor_3 = Recipe.create(name: 'Homemade Air-Fryer Churros', preparation_time: '15 min', cooking_time: '15 min', description: 'Serve these cinnamon-sugar air-fryer churros fresh and hot with a cup of coffee or hot chocolate. They re sure to become a family favorite! —Taste of Home Test Kitchen', public: false, user: tresor)

# https://www.tasteofhome.com/recipes/apple-pie/
food= Food.create(name: 'Dough for double-crust pie',measurement_unit: 'g', price: 3, user: tresor)
RecipeFood.create(quantity: 300, recipe: recipe_tresor_1, food: food)
InventoryFood.create(quantity: 1000, inventory: inventory_tresor, food: food)

food= Food.create(name: 'Sugar', measurement_unit: 'g', price: 1,user: tresor)
RecipeFood.create(quantity: 300, recipe: recipe_tresor_1, food: food)
InventoryFood.create(quantity: 1000, inventory: inventory_tresor, food: food)

food= Food.create(name: 'Brown sugar',measurement_unit: 'g', price: 2, user: tresor)
RecipeFood.create(quantity: 300, recipe: recipe_tresor_1, food: food)
InventoryFood.create(quantity: 1000, inventory: inventory_tresor, food: food)

food= Food.create(name: 'Flour', measurement_unit: 'g', price: 1,user: tresor)
RecipeFood.create(quantity: 250, recipe: recipe_tresor_1, food: food)
InventoryFood.create(quantity: 1000, inventory: inventory_tresor, food: food)

food= Food.create(name: 'Cinnamon',measurement_unit: 'g', price: 10, user: tresor)
RecipeFood.create(quantity: 10, recipe: recipe_tresor_1, food: food)
InventoryFood.create(quantity: 1000, inventory: inventory_tresor, food: food)

food= Food.create(name: 'Ginger', measurement_unit: 'g', price: 8, user: tresor)
RecipeFood.create(quantity: 30, recipe: recipe_tresor_1, food: food)
InventoryFood.create(quantity: 1000, inventory: inventory_tresor, food: food)

food= Food.create(name: 'Nutmeg',measurement_unit: 'g', price: 7, user: tresor)
RecipeFood.create(quantity: 10, recipe: recipe_tresor_1, food: food)
InventoryFood.create(quantity: 1000, inventory: inventory_tresor, food: food)

apple= Food.create(name: 'Apple',measurement_unit: 'g', price: 4, user: tresor)
RecipeFood.create(quantity: 100, recipe: recipe_tresor_1, food: apple)
InventoryFood.create(quantity: 1000, inventory: inventory_tresor, food: apple)

food= Food.create(name: 'Lemon juice',measurement_unit: 'g', price: 2, user: tresor)
RecipeFood.create(quantity: 100, recipe: recipe_tresor_1, food: food)
InventoryFood.create(quantity: 1000, inventory: inventory_tresor, food: food)

butter= Food.create(name: 'Butter',measurement_unit: 'g', price: 6, user: tresor)
RecipeFood.create(quantity: 500, recipe: recipe_tresor_1, food: butter)
InventoryFood.create(quantity: 1000, inventory: inventory_tresor, food: butter)

egg= Food.create(name: 'Egg white',measurement_unit: 'g', price: 3, user: tresor)
RecipeFood.create(quantity: 50, recipe: recipe_tresor_1, food: egg)
InventoryFood.create(quantity: 1000, inventory: inventory_tresor, food: egg)


# https://www.tasteofhome.com/recipes/puff-pastry-apple-strudel/
RecipeFood.create(quantity: 500, recipe: recipe_tresor_2, food: butter)

food= Food.create(name: 'Onions',measurement_unit: 'g', price: 3, user: tresor)
RecipeFood.create(quantity: 500, recipe: recipe_tresor_2, food: food)

RecipeFood.create(quantity: 500, recipe: recipe_tresor_2, food: apple)

food= Food.create(name: 'Walnuts',measurement_unit: 'g', price: 3, user: tresor)
RecipeFood.create(quantity: 500, recipe: recipe_tresor_2, food: food)

food= Food.create(name: 'Honey',measurement_unit: 'g', price: 33, user: tresor)
RecipeFood.create(quantity: 100, recipe: recipe_tresor_2, food: food)

food= Food.create(name: 'Salt',measurement_unit: 'g', price: 10, user: tresor)
RecipeFood.create(quantity: 100, recipe: recipe_tresor_2, food: food)

food= Food.create(name: 'pepper',measurement_unit: 'g', price: 100, user: tresor)
RecipeFood.create(quantity: 100, recipe: recipe_tresor_2, food: food)

RecipeFood.create(quantity: 50, recipe: recipe_tresor_2, food: egg)


# https://www.tasteofhome.com/recipes/homemade-air-fryer-churros/

food= Food.create(name: 'Milk',measurement_unit: 'g', price: 100, user: tresor)
RecipeFood.create(quantity: 100, recipe: recipe_tresor_3, food: food)

# James ----

james = User.create(name: 'carlos', email: 'carlos@test.com', password: '111111')
inventory_james =  Inventory.create(name: "inventory for tresor", user: tresor)


# https://www.tasteofhome.com/recipes/double-chocolate-pumpkin-bread/
recipe_james_1 = Recipe.create(name: 'Double Chocolate Pumpkin Bread', preparation_time: '25 min', cooking_time: '70 min', description: 'This double chocolate pumpkin bread is a favorite. It s nice and moist, and it actutresor gets better as it sits! It freezes well, too. —Tami Malan, Draper, Utah', public: true, user: james)

food= Food.create(name: 'Sugar', measurement_unit: 'g', price: 1,user: james)
RecipeFood.create(quantity: 300, recipe: recipe_james_1, food: food)
InventoryFood.create(quantity: 1000, inventory: inventory_james, food: food)

food= Food.create(name: 'Brown sugar',measurement_unit: 'g', price: 2, user: james)
RecipeFood.create(quantity: 300, recipe: recipe_james_1, food: food)
InventoryFood.create(quantity: 1000, inventory: inventory_james, food: food)

food= Food.create(name: 'Flour', measurement_unit: 'g', price: 1,user: james)
RecipeFood.create(quantity: 500, recipe: recipe_james_1, food: food)
InventoryFood.create(quantity: 1000, inventory: inventory_james, food: food)

butter=Food.create(name: 'Butter',measurement_unit: 'g', price: 6, user: james)
RecipeFood.create(quantity: 500, recipe: recipe_james_1, food: butter)
InventoryFood.create(quantity: 1000, inventory: inventory_james, food: butter)

egg= Food.create(name: 'Egg white',measurement_unit: 'g', price: 3, user: james)
RecipeFood.create(quantity: 50, recipe: recipe_james_1, food: egg)
InventoryFood.create(quantity: 1000, inventory: inventory_james, food: egg)

