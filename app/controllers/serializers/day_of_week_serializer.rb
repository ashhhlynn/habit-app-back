class DayOfWeekSerializer < ActiveModel::Serializer
    attributes :name, :habit_id, :done
    belongs_to :habit
end