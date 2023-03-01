# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  likes_count :integer
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  trail_id    :integer
#  user_id     :integer
#
class Photo < ApplicationRecord
  has_many(:likes, { :class_name => "Like", :foreign_key => "photos_id", :dependent => :destroy })

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })

  belongs_to(:trail, { :required => true, :class_name => "Trail", :foreign_key => "trail_id", :counter_cache => true })
end
