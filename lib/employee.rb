class Employee < ActiveRecord::Base
  validates(:name, :presence => true)
  has_many :assignments
  has_many :projects, through: :assignments

end
