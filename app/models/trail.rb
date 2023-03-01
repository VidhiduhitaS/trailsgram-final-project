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
#  length          :boolean
#  likes_count     :integer
#  name            :string
#  photos_count    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Trail < ApplicationRecord
end
