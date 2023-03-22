class AddQuantityToProductItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_items, :quantity
    add_column :product_items, :quantity, :integer, default: 1
  end
end

# class CombineItemsInCart < ActiveRecord::Migration[5.1]
#   def up
#     Cart.all.each do |cart|
#     sums = cart.product_items.group(:product_id).sum(:quantity)

#       sums.each do |product_id, quantity|
#         if quantity > 1
#           cart.product_items.where(product_id: product_id).delete_all
#           cart.product_items.create(product_id: product_id, quantity: quantity) 
#         end
#       end
#     end
#   end

  # def down
  #   # разбиение записей с quantity>1 на несколько записей 
  #   ProductItem.where("quantity >1").each do |product_item|
  #     # add individual items 
  #     product_item.quantity.times do
  #       ProductItem.create cart_id: product_item.cart_id, 
  #       product_id: product_item.product_id, quantity: 1
  #     end
  #     # удаление исходной записи
  #     product_item.destroy 
  #   end
  # end
# end