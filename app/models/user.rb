class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true , format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true
    validates :password, confirmation: true
    has_secure_password
end
