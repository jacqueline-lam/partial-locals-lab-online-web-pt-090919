# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(query)
    if query.present?
      # when it receives an empty search argument
      # returns all students whose names contain the given string
      Student.where("name LIKE ?", "%#{query}%")
    else
      # when it receives an empty search argument
      # returns all students
      self.all
    end
  end
end
