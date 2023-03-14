class RenameSubtotalToTotalSum < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :subtotal, :total_sum
    remove_column :orders, :total
  end
end
