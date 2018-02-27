require("spec_helper")

describe(Employee) do
  it("validates the presence of name") do
    employee = Employee.new({:name => ""})
    expect(employee.save()).to(eq(false))
  end
end
