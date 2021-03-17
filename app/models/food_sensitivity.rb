# == Schema Information
#
# Table name: food_sensitivities
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  dietary_id     :integer
#  ingredient_id  :integer
#  sensitivity_id :integer
#
# Indexes
#
#  index_food_sensitivities_on_ingredient_id_and_sensitivity_id  (ingredient_id,sensitivity_id) UNIQUE
#
class FoodSensitivity < ApplicationRecord
  validates :ingredient_id, uniqueness: { scope: :sensitivity_id }
  belongs_to(:ingredient, { :required => false, :class_name => "OriginalIngredient", :foreign_key => "ingredient_id" })
  belongs_to(:sensitivity, { :required => false, :class_name => "Sensitivity", :foreign_key => "sensitivity_id" })
end
