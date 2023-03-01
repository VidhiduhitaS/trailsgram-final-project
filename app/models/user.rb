# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  account_type    :string
#  comments_count  :integer
#  email           :string
#  password_digest :string
#  photos_count    :integer
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:photos, { :class_name => "Photo", :foreign_key => "user_id" })

  has_many(:comments, { :class_name => "Comment", :foreign_key => "user_id" })

  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:trails, { :through => :bookmarks, :source => :trail })
  
end
