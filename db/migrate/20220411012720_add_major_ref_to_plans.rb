class AddMajorRefToPlans < ActiveRecord::Migration[6.1]
  def change
    add_reference :plans, :major, foreign_key: true
  end
end
