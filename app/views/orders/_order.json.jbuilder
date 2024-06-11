json.extract! order, :id, :creation_date, :total, :status, :customer_id, :store_id, :created_at, :updated_at
json.url order_url(order, format: :json)
