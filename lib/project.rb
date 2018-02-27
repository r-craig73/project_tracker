class Project < ActiveRecord::Base
  validates(:title, :presence => true)
  has_many :assignments
  has_many :employees, through: :assignments
end
