class AddNotesToAlternatives < ActiveRecord::Migration[6.0]
  def change
    add_column :alternatives, :notes, :text
  end
end
