class AddHoursToMembers < ActiveRecord::Migration
  def up
    add_column :members, :hours, :json, :default => { :hours => [] }
    add_column :members, :mentor, :boolean, :default => false

    Member.all.each do |m|
      puts "Member #{m.name}: #{m.attendances}"
      m.hours = m.attendances.order(:signin).all.map do |a| 
        recs = []
        recs << a.signin.to_i
        recs << a.signout.to_i if a.signout
        recs
      end
      m.save
    end
  end

  def down
    remove_column :members, :hours
    remove_column :members, :mentor
  end

end


