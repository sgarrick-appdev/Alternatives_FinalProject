class CreateSensitivities < ActiveRecord::Migration[6.0]
  def change
    create_table :sensitivities do |t|
      t.string :name

      t.timestamps
    end
  end
end
