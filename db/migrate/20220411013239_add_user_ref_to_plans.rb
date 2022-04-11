class AddUserRefToPlans < ActiveRecord::Migration[6.1]
  def change
    remove_column :plans, :user_id, :string
    add_reference :plans, :user, foreign_key: true
  end
end
