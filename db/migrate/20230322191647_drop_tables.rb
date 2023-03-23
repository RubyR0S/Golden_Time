class DropTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :order_items
    drop_table :final_orders
    drop_table :final_order_products
  end
end
