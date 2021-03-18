desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  require 'faker'
#   names = ["Dylan", "Emily", "Sofia", "Cayla", "Fin", "Anna"]
#   emails = ["dylan@gmail.com", "emily@gmail.com", "cayla@gmail.com", "fin@gmail.com", "anna@gmail.com"]

#  6.times do |count|
#     user = User.new
#     user.username = names.at(count)
#     user.email = emails.at(count)
#     user.password = "my_password"
#     user.save
#  end

# type_names = ["oils", "sweetener", "dairy", "meat", "toppings/dressing", "acids", "spices/herbs", "veggies", "fruits", "baking"]
# 10.times do |count|
#  type = Type.new
#  type.name = type_names.at(count)
#  type.save
# end

# sensitivity_names = ["dairy", "meat", "eggs", "nuts", "gluten", "sugar", "grains"]
# 7.times do |count|
#  s = Sensitivity.new
#  s.name = sensitivity_names.at(count)
#  s.save
# end

# original_names = ["sugar", "milk", "canola oil", "baking soda", "stevia", "almond milk", "grapeseed oil", "baking powder", "peanut butter", "almond butter", "cashew butter", "coconut sugar", "honey"]
# type_ids = [2, 42, 1, 10, 2, 42, 1, 10, 5, 5, 5, 2, 2]

# 13.times do |count|
# ingredient = OriginalIngredient.new
# ingredient.original = original_names.at(count)
# ingredient.type_id = type_ids.at(count)
# ingredient.save
# end

# notes = ["read instructions on stevia packet/container for measurement conversion", "1:1 ratio ","1:1 ratio","use 3 times the amount of baking powder in lieu of baking soda", "1:1 ratio", "1:1 ratio", "read instructions on coconut sugar container - great substitute for brown sugar", "measurement depends on your tastes - great alternative to sugar in tea!"]
# alternative_id = [5,6,7,8, 10, 11, 12, 13]
# id_OG = [1,2,3,4, 9, 9, 1, 1]
# 8.times do |count|
# alternative_pair = Alternative.new
# alternative_pair.notes = notes.at(count)
# alternative_pair.alternative_ingredient_id = alternative_id.at(count)
# alternative_pair.original_ingredient_id = id_OG.at(count)
# alternative_pair.save
# end

# ingredient_id = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
# sensitivity_id = [6, 1, 8, 8, 8, 4, 8, 8, 4, 4, 4, 6, 6]

# 13.times do |count|
# food_sensitivity = FoodSensitivity.new
# food_sensitivity.ingredient_id = ingredient_id.at(count)
# food_sensitivity.sensitivity_id = sensitivity_id.at(count)
# food_sensitivity.save
# end

end
