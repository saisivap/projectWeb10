json.extract! item, :id, :name, :description, :category1_id, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
