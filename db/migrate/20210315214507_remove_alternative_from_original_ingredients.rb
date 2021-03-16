class RemoveAlternativeFromOriginalIngredients < ActiveRecord::Migration[6.0]
  def change
    remove_column :original_ingredients, :alternative
  end
end
