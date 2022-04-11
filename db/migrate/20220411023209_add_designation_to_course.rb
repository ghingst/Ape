class AddDesignationToCourse < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :designator, :string
    add_column :courses, :designator, :string, unique: true
  end
end
