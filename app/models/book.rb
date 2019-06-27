class Book < ApplicationRecord
  has_many :pairs
  has_many :authors, through: :pairs
end
