class CreateAlternatives < ActiveRecord::Migration[6.0]
  def change
    create_table :alternatives do |t|
      t.integer :original_ingredient_id
      t.integer :alternative_ingredient_id

      t.timestamps
    end
  end
end
