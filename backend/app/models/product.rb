class Product < ApplicationRecord
  belongs_to :user
  has_many :product_details, dependent: :destroy
end
