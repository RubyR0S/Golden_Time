class DeleteColummnsForProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :mens_watch
    remove_column :products, :womens_watch
    remove_column :products, :kids_watch
    remove_column :products, :mechanic_watch
    remove_column :products, :electronic_watch
  end
end
