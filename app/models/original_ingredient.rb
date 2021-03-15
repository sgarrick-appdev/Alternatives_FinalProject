# == Schema Information
#
# Table name: original_ingredients
#
#  id          :integer          not null, primary key
#  alternative :string
#  notes       :text
#  original    :string
#  sensitivity :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  type_id     :integer
#
class OriginalIngredient < ApplicationRecord
end
