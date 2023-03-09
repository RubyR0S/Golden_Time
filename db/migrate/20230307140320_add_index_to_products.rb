class AddIndexToProducts < ActiveRecord::Migration[5.1]
  def change
    add_index :products, :name
  end
end
