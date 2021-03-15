class CreateOriginalIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :original_ingredients do |t|
      t.string :original
      t.string :alternative
      t.string :sensitivity
      t.text :notes
      t.integer :type_id

      t.timestamps
    end
  end
end
