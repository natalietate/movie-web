class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :movies, through: :group_watchlists
end
