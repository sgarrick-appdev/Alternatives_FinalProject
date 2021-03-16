class AddSensitivityIdToOriginalIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :original_ingredients, :sensitivity_id, :integer
  end
end
