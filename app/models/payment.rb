class Payment < ApplicationRecord
  validates :id_loan, presence: true,numericality: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
