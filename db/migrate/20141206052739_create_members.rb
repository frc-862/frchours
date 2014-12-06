class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :last_name
      t.string :first_name
      t.string :student_id
      t.string :grade
      t.string :email

      t.timestamps
    end
  end
end
