class AddPayTypeToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :pay_type, :string
  end
end
