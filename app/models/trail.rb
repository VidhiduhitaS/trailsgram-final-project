# == Schema Information
#
# Table name: trails
#
#  id              :integer          not null, primary key
#  address         :string
#  bookmarks_count :integer
#  comments_count  :integer
#  difficulty      :string
#  duration        :integer
#  length          :float
#  likes_count     :integer
#  name            :string
#  photos_count    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Trail < ApplicationRecord

  has_many(:photos, { :class_name => "Photo", :foreign_key => "trail_id" })

  has_many(:comments, { :class_name => "Comment", :foreign_key => "trail_id", :dependent => :destroy })

  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "trail_id", :dependent => :destroy })

  has_many(:likes, { :class_name => "Like", :foreign_key => "trail_id", :dependent => :destroy })

  has_many(:users, { :through => :bookmarks, :source => :user })
end
