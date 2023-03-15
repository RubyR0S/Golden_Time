class CreateFinalOrderProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :final_order_products do |t|
      t.references :final_order, foreign_key: true
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
