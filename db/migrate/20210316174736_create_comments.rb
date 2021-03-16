class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :commenter_id
      t.integer :ingredient_id
      t.integer :measurement_id
      t.integer :dietary_id

      t.timestamps
    end
  end
end
