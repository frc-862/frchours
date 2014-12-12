class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.date :day
      t.integer :hours

      t.timestamps
    end
  end
end
