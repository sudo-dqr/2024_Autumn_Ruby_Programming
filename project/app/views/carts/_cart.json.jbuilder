json.extract! cart, :id, :user_id, :quantity, :added_at, :created_at, :updated_at
json.url cart_url(cart, format: :json)
