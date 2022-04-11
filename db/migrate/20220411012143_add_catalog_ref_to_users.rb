class AddCatalogRefToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :catalog, foreign_key: true
  end
end
