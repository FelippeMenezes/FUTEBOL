class Player < ApplicationRecord
  belongs_to :team

  validates :name, uniqueness: true
  validates :name, :position, presence: true
  validates :accuracy, :strength, :speed, :balance, :agility, :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

