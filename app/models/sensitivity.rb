# == Schema Information
#
# Table name: sensitivities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Sensitivity < ApplicationRecord
  has_many(:food_sensitivities, { :class_name => "FoodSensitivity", :foreign_key => "sensitivity_id", :dependent => :destroy })
  has_many(:ingredients, { :through => :food_sensitivities, :source => :ingredient })
end
