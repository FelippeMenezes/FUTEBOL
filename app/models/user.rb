class User < ApplicationRecord
  has_one :team
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
