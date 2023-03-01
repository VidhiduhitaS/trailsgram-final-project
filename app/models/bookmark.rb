# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  trail_id   :integer
#  user_id    :integer
#
class Bookmark < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:trail, { :required => true, :class_name => "Trail", :foreign_key => "trail_id", :counter_cache => true })
end
