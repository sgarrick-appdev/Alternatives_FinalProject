# == Schema Information
#
# Table name: types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Type < ApplicationRecord
  has_many(:ingredient_alternatives, { :class_name => "OriginalIngredient", :foreign_key => "type_id", :dependent => :destroy })
end
