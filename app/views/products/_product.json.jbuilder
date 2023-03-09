json.extract! product, :id, :name, :description, :price, :mens_watch, :womens_watch, :kids_watch, :mechanic_watch, :electronic_watch, :available, :created_at, :updated_at
json.url product_url(product, format: :json)
