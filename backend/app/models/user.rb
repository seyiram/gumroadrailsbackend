class User < ApplicationRecord
    before_validation :assign_url_prefix, on: :create

    has_secure_password
    has_many :products, dependent: :destroy

    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :gumroad_user_id, uniqueness: true, allow_nil: true
    validates :url, format: { with: /\A[a-zA-Z0-9_.-]+\.gumroad\.com\/l\// }, allow_nil: true

    private

    def assign_url_prefix
      self.url ||= generate_url_prefix if email.present?
    end

    def generate_url_prefix
      email_prefix = email.split('@').first
      sanitized_prefix = sanitize_for_url(email_prefix)
      "#{sanitized_prefix}.gumroad.com/l/"
    end

    def sanitize_for_url(text)
      text.gsub(/[^a-zA-Z0-9_.-]/, '')
    end
  end
