class Player < ApplicationRecord
  belongs_to :team

  validates :name, uniqueness: true
  validates :name, :position, presence: true
  validates :level, :yellow_card, :red_card, :goal_scored, :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :injury, inclusion: { in: [true, false] }
end

