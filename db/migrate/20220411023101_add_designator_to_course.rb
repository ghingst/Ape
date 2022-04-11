class AddDesignatorToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :designator, :string
  end
end
