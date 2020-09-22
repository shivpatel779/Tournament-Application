class Team < ApplicationRecord
  belongs_to :user
  has_many :members
  has_many :tournament_teams
end
