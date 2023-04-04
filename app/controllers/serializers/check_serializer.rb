class CheckSerializer < ActiveModel::Serializer
    attributes :complete, day_of_week_id
    belongs_to :day_of_week
end