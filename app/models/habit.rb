class Habit < ApplicationRecord
    has_many :day_of_weeks
    belongs_to :user 
    accepts_nested_attributes_for :day_of_weeks
end
