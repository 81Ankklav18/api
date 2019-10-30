class Job < ApplicationRecord
  belongs_to :company
  has_many :applies

  validates :name, presence: true
  validates :place, presence: true
  validates :company_id, numericality: true
  validates :name, length: { in: 1..100 }
  validates :place, inclusion: { in: ['Remote', 'Contract', 'Permanent'] }
end
