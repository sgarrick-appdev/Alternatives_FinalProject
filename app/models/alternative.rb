# == Schema Information
#
# Table name: alternatives
#
#  id                        :integer          not null, primary key
#  notes                     :text
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  alternative_ingredient_id :integer
#  original_ingredient_id    :integer
#  user_id                   :integer
#
class Alternative < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
  
  belongs_to(:original_ingredient, { :required => false, :class_name => "OriginalIngredient", :foreign_key => "original_ingredient_id" })

  belongs_to(:alternative_ingredient, { :required => false, :class_name => "OriginalIngredient", :foreign_key => "alternative_ingredient_id" })

  has_many(:likes, { :class_name => "Like", :foreign_key => "alternative_id", :dependent => :destroy })

  has_many(:favorites, { :class_name => "Favorite", :foreign_key => "alternative_id", :dependent => :destroy })
end
