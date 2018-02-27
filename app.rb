require("sinatra")
require("pry")
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
  erb(:employees)
end

get('/employee') do
  @employees = Employee.all()
  erb(:employee)
end

get('/employees/:id') do
  @employees =
  @employees = Employee.find(params.fetch("id").to_i())
  erb(:employee)
end

get('/employee/:id/edit') do
  @employees = Employee.find(params.fetch("id").to_i())
  erb(:employee_edit)
end

patch("/employee/:id") do
  name = params.fetch("name")
  @employees = Employee.find(params.fetch("id").to_i())
  @employees.update({:name => name})
  erb(:employee)
end

delete("/employee/:id") do
  @employees = Employee.find(params.fetch("id").to_i())
  @employees.delete()
  @employees = Employee.all()
  erb(:employees)
end
