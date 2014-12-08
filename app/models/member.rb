class Member < ActiveRecord::Base
  has_many :attendances, :foreign_key => 'student_id', :primary_key => 'student_id'
  validates_uniqueness_of :student_id

  def student_id=(val)
    write_attribute(:student_id, val.to_s.gsub(/\D/,""))
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def hours
    work_time / 60.0 / 60.0
  end

  def work_time
    attendances.inject(0.0) { |total, att| total + att.duration }
  end
end
