class DeleteTotalFromOrderIrem < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_items, :total
  end
end
