class Courses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :credits, :integer
    add_column :courses, :description, :string
  end
end
