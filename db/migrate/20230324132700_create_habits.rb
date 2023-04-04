class CreateHabits < ActiveRecord::Migration[6.1]
  def change
    create_table :habits do |t|
      t.string :title
      t.string :description
      t.string :days
      t.string :startday
      t.string :user_id

      t.timestamps
    end
  end
end
