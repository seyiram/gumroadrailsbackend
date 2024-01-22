class User < ApplicationRecord
    has_secure_password
    has_many :products, dependent: :destroy
    validates :username, uniqueness: true
    validates :gumroad_user_id, uniqueness: true, allow_nil: true
    validates :url, format: { with: URI::regexp(%w[http https]) }, allow_nil: true
end
