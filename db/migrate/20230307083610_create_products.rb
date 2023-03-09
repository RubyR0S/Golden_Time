class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.boolean :mens_watch,       default: false
      t.boolean :womens_watch,     default: false
      t.boolean :kids_watch,       default: false
      t.boolean :mechanic_watch,   default: false
      t.boolean :electronic_watch, default: false
      t.boolean :available,        default: true

      t.timestamps
    end
  end
end
