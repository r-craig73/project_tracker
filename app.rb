require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/employee")
require("./lib/project")
require("./lib/assignment")


get ('/') do
  @employees = Employee.all()
  @projects = Project.all()
  erb(:index)
end

get('/employee/new') do
  erb(:employee_form)
end

post('/employee') do
  name = params.fetch('name')
  employee = Employee.new({:name => name, :id => nil})
  employee.save()
  @employees = Employee.all()
  erb(:employee)
end
