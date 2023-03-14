class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :phone_number, :string, null: false, unique: true
  end 
end