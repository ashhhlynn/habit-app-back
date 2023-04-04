class Habit < ApplicationRecord
    has_many :day_of_weeks

    accepts_nested_attributes_for :day_of_weeks
end
