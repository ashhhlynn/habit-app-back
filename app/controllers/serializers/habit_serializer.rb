class HabitSerializer < ActiveModel::Serializer
    attributes :title, :startday, :description, :days
   has_many :day_of_weeks
end