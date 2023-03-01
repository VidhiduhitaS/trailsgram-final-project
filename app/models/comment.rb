# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  trail_id   :integer
#  user_id    :integer
#
class Comment < ApplicationRecord
end
