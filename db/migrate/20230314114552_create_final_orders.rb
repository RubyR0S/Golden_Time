class CreateFinalOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :final_orders do |t|
      t.string :first_name,   null: false
      t.string :last_name,    null: false
      t.string :address,      null: false
      t.string :phone_number, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
