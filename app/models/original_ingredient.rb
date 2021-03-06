# == Schema Information
#
# Table name: original_ingredients
#
#  id             :integer          not null, primary key
#  notes          :text
#  original       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  sensitivity_id :integer
#  type_id        :integer
#
class OriginalIngredient < ApplicationRecord
  belongs_to(:type, { :required => false, :class_name => "Type", :foreign_key => "type_id" })
  validates(:original, { :uniqueness => true })
  has_many(:food_sensitivities, { :class_name => "FoodSensitivity", :foreign_key => "ingredient_id", :dependent => :destroy })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "ingredient_id", :dependent => :destroy })
end
