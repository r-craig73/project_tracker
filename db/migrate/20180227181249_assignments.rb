class Assignments < ActiveRecord::Migration[5.1]
  def change
    create_table(:assignments) do |t|
      t.column(:employees_id, :int)
      t.column(:projects_id, :int)

      t.timestamps()
    end
  end
end
