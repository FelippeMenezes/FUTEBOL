class Player < ApplicationRecord
  belongs_to :team

  validates :name, :position, presence: true
  validates :goalkeep, :strength, :speed, :balance, :agility, :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

