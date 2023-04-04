class CreateChecks < ActiveRecord::Migration[6.1]
  def change
    create_table :checks do |t|
      t.boolean :complete
      t.string :day_of_week_id
      
      t.timestamps
    end
  end
end
