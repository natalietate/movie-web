class Movie < ApplicationRecord
  acts_as_votable
  has_many :user_watchlists, dependent: :destroy
  has_many :group_watchlists, dependent: :destroy


end
