class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  validates :home_score, :away_score, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

