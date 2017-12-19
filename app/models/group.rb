class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :group_watchlists
  has_many :movies, through: :group_watchlists

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validate :future_event

  scope :upcoming, -> { order(event_date: :asc, event_time: :asc)}
  scope :recent, -> { order(event_date: :desc, event_time: :desc)}

  private
  def future_event
    errors.add(:event_date, "can't be in the past!") if event_date < Date.today
  end

end
