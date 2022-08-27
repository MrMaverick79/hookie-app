class User < ApplicationRecord
    has_many :hooks

    validates :email, presence: true, uniqueness: true

    validates :name, length: {minimum: 2}

    has_secure_password
end
