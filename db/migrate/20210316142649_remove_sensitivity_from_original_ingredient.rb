class RemoveSensitivityFromOriginalIngredient < ActiveRecord::Migration[6.0]
  def change
    remove_column :original_ingredients, :sensitivity
  end
end
