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

# original_names = ["sugar", "milk", "canola oil", "baking soda", "stevia", "almond milk", "grapeseed oil", "baking powder"]
# sensitivities = ["sugar","dairy","none", "none", "none" ,"nuts", "none","none"]
# type_ids = [2, 3, 1, 10, 2, 42, 1, 10]

# 8.times do |count|
# ingredient = OriginalIngredient.new
# ingredient.original = original_names.at(count)
# ingredient.sensitivity = sensitivities.at(count)
# ingredient.type_id = type_ids.at(count)
# ingredient.save
# end

# notes = ["read instructions on stevia packet for measurement conversion", "N/A ","N/A ","use 3 times the amount of baking powder in lieu of baking soda"]
# alternative_id = [5,6,7,8]
# OG_id = [1,2,3,4]
# 4.times do |count|
# alternative_pair = Alternative.new
# alternative_pair.notes = notes.at(count)
# alternative_pair.alternative_ingredient_id = alternative_id.at(count)
# alternative_pair.original_ingredient_id = OG_id.at(count)
# alternative_pair.save
# end

ingredient_id = [1, 2, 6, 3]
sensitivity_id = [6,1, 4, 8]

4.times do |count|
food_sensitivity = FoodSensitivity.new
food_sensitivity.ingredient_id = ingredient_id.at(count)
food_sensitivity.sensitivity_id = sensitivity_id.at(count)
food_sensitivity.save
end


end
