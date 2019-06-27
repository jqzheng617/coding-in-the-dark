class Author < ApplicationRecord
  has_many :pairs
  has_many :books, through: :pairs
  validates :name, :birth_year, presence: true
  validates :birth_year, numericality: { only_integer: true }
end
