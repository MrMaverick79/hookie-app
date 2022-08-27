class User < ApplicationRecord
    has_many :hooks
    has_secure_password
end
