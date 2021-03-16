# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  body           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  commenter_id   :integer
#  dietary_id     :integer
#  ingredient_id  :integer
#  measurement_id :integer
#
class Comment < ApplicationRecord
  belongs_to(:commenter, { :required => false, :class_name => "User", :foreign_key => "commenter_id" })
  belongs_to(:ingredient, { :required => false, :class_name => "Alternative", :foreign_key => "ingredient_id" })
end
