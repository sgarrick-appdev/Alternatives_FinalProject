class AddUserIdToAlternatives < ActiveRecord::Migration[6.0]
  def change
    add_column :alternatives, :user_id, :integer
  end
end
