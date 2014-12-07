class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :student_id
      t.datetime :signin
      t.datetime :signout

      t.timestamps
    end

    add_index :attendances, :student_id
  end
end
