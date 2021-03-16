# == Schema Information
#
# Table name: favorites
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  alternative_id :integer
#  dietary_id     :integer
#  user_id        :integer
#
class Favorite < ApplicationRecord
end
