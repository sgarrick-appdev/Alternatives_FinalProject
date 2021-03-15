class CreateFoodSensitivities < ActiveRecord::Migration[6.0]
  def change
    create_table :food_sensitivities do |t|
      t.integer :ingredient_id
      t.integer :sensitivity_id
      t.integer :dietary_id

      t.timestamps
    end
  end
end
