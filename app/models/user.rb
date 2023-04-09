class User < ApplicationRecord
    has_many :habits
    has_secure_password
    has_many :day_of_weeks, through: :habits
end
