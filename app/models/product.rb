class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :url, format: { with: URI::regexp(%w[http https]), message: "must be a valid url" }

end
