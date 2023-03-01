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
end
