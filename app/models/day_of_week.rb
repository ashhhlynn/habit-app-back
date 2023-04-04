class DayOfWeek < ApplicationRecord

    belongs_to :habit
    has_many :checks
    accepts_nested_attributes_for :checks

end
