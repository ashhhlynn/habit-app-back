class User < ApplicationRecord
    has_many :habits
    has_secure_password
end
