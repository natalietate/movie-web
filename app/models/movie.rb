class Movie < ApplicationRecord
  has_many :user_watchlists, dependent: :destroy
  has_many :group_watchlists, dependent: :destroy
end
