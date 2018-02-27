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

post('/employees') do
  name = params.fetch('name')
  employee = Employee.new({:name => name, :id => nil})
  employee.save()
  @employees = Employee.all()
  erb(:employees)
end

get('/employees') do
  @employees = Employee.all()
  erb(:employees)
end

get('/employees/:id') do
  @employee = Employee.find(params.fetch("id").to_i())
  @employees = Employee.all()
  erb(:employee)
end

get('/employees/:id/edit') do
  @employee = Employee.find(params.fetch("id").to_i())
  @employees = Employee.all()
  erb(:employee_edit)
end

patch("/employees/:id") do
  name = params.fetch("name")
  @employee = Employee.find(params.fetch("id").to_i())
  @employees = @employee.update({:name => name})
  erb(:index)
end

delete("/employees/:id") do
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.delete()
  @employees = Employee.all()
  erb(:employees)
end
