class CreateUserSensitivities < ActiveRecord::Migration[6.0]
  def change
    create_table :user_sensitivities do |t|
      t.integer :user_id
      t.integer :sensitivity_id

      t.timestamps
    end
  end
end
