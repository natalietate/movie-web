class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :group_watchlists
  has_many :movies, through: :group_watchlists

  validates :title, uniqueness: true, presence: true

   scope :upcoming, -> { order(event_date: :asc, event_time: :asc)}

   scope :recent, -> { order(event_date: :desc, event_time: :desc)}



end
