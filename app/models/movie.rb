class Movie < ApplicationRecord
  has_many :user_watchlists
  has_many :group_watchlists
  has_many :groups, :through => :group_watchlists


end
