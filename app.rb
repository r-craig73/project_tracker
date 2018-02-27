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

get('/employees_home') do
  erb(:employee_form)
end

get('/projects_home') do
  erb(:project_form)
end

post('/employees') do
  name = params.fetch('name')
  employee = Employee.new({:name => name, :id => nil})
  employee.save()
  @employees = Employee.all()
  erb(:employees)
end

post('/projects') do
  title = params.fetch('title')
  project = Project.new({:title => title, :id => nil})
  project.save()
  @projects = Project.all()
  erb(:projects)
end

get('/employees') do
  @employees = Employee.all()
  erb(:employees)
end

get('/projects') do
  @projects = Project.all()
  erb(:projects)
end

get('/employees/:id') do
  @employee = Employee.find(params.fetch("id").to_i())
  @employees = Employee.all()
  erb(:employee)
end

get('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i())
  @projects = Project.all()
  erb(:project)
end

get('/employees/:id/edit') do
  @employee = Employee.find(params.fetch("id").to_i())
  @employees = Employee.all()
  erb(:employee_edit)
end

get('/projects/:id/edit') do
  @project = Project.find(params.fetch("id").to_i())
  @projects = Project.all()
  erb(:project_edit)
end

patch("/employees/:id") do
  name = params.fetch("name")
  @employee = Employee.find(params.fetch("id").to_i())
  @employees = @employee.update({:name => name})
  erb(:index)
end

patch("/projects/:id") do
  title = params.fetch("title")
  @project = Project.find(params.fetch("id").to_i())
  @projects = @project.update({:title => title})
  erb(:index)
end

delete("/employees/:id") do
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.delete()
  @employees = Employee.all()
  erb(:employees)
end

delete("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Project.all()
  erb(:projects)
end
