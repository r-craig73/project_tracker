require("spec_helper")

describe(Employee) do
  it("validates the presence of name") do
    employee = Employee.new({:name => ""})
    expect(employee.save()).to(eq(false))
  end

  it("has many projects") do
    project = Project.create({:title => "apple"})
    employee = Employee.create({:name => "Mike"})
    expect(employee.project()).to(eq(project))
  end
end
