class Projects < ActiveRecord::Migration[5.1]
  def change
    create_table(:projects) do |t|
      t.column(:title, :string)

      t.timestamps()
    end
  end
end
