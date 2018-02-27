require("spec_helper")

describe(Project) do
  it("validates the presence of a title") do
    project = Project.new({:title => ""})
    expect(project.save()).to(eq(false))
  end
end
