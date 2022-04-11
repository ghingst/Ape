class AddMajorRefToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :major, foreign_key: true
  end
end
