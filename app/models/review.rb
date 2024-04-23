class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :score, presence: true, inclusion: { in: 1..5 }
end
