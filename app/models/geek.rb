class Geek < ApplicationRecord
  has_many :applies

  validates :name, presence: true
  validates :stack, presence: true
  validates :id, numericality: true
  validates :name, length: { in: 1..100 }
end
