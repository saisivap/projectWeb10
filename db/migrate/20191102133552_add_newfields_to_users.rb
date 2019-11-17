class AddNewfieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :stID, :string
    add_column :users, :balance, :integer
    add_column :users, :admin, :boolean
  end
end
