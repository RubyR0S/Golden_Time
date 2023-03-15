class AddQuantityToFinalOrderProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :final_order_products, :quantity, :integer
  end
end
