# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  photos_id  :integer
#  trail_id   :integer
#
class Like < ApplicationRecord
end
