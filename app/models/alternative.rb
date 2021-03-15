# == Schema Information
#
# Table name: alternatives
#
#  id                        :integer          not null, primary key
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  alternative_ingredient_id :integer
#  original_ingredient_id    :integer
#
class Alternative < ApplicationRecord
end
