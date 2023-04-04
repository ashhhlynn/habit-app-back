class DayOfWeekSerializer < ActiveModel::Serializer
    attributes :name, :habit_id, :done
    has_many :checks
    belongs_to :habit
end