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

  belongs_to(:photos, { :class_name => "Photo", :foreign_key => "photos_id", :counter_cache => true })

  belongs_to(:trail, { :required => true, :class_name => "Trail", :foreign_key => "trail_id", :counter_cache => true })
end
