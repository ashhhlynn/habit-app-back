class CreateDayOfWeeks < ActiveRecord::Migration[6.1]
  def change
    create_table :day_of_weeks do |t|
      t.string :name
      t.string :habit_id

      t.timestamps
    end
  end
end
