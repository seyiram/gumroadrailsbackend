class Product < ApplicationRecord
  belongs_to :user
  validates :user_product_number, uniqueness: { scope: :user_id}
  has_many :product_details, dependent: :destroy
end
