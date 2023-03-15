class AddTotalSumToFinalOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :final_orders, :total_sum, :float
  end
end
