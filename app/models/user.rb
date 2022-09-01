class User < ApplicationRecord
    has_many :hooks

    validates :email, presence: true, uniqueness: true

    validates :name, length: {minimum: 2}
    validates :password, length: {minimum: 6}

    has_secure_password
end
