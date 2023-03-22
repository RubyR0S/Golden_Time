class AddCartToProductItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :product_items, :cart, foreign_key: true
  end
end
