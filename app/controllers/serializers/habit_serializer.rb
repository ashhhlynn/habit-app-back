class HabitSerializer < ActiveModel::Serializer
    attributes :title, :description, :days, :user_id
    has_many :day_of_weeks
end