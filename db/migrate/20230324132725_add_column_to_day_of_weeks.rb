class AddColumnToDayOfWeeks < ActiveRecord::Migration[6.1]
    def change
      add_column :day_of_weeks, :done, :boolean

    end
  end