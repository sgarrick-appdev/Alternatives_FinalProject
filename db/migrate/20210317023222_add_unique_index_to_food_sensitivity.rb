class AddUniqueIndexToFoodSensitivity < ActiveRecord::Migration[6.0]
  def change
    add_index :food_sensitivities, [:ingredient_id, :sensitivity_id], unique: true
  end
end
