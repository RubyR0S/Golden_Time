class AddFieldToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :first_name, :string, null: false
    add_column :orders, :last_name, :string, null: false
    add_column :orders, :address, :string, null: false
    add_column :orders, :phone_number, :string, null: false
  end
end
