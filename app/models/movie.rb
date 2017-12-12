class Movie < ApplicationRecord
  has_many :user_watchlists, dependent: :destroy
end
