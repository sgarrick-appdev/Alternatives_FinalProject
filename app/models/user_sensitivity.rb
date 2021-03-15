# == Schema Information
#
# Table name: user_sensitivities
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  sensitivity_id :integer
#  user_id        :integer
#
class UserSensitivity < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:sensitivity, { :required => false, :class_name => "Sensitivity", :foreign_key => "sensitivity_id" })
  
end
