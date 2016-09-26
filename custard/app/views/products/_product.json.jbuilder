json.extract! product, :id, :facility_id, :flavor, :mid, :state, :packaged, :opened, :created_at, :updated_at
json.url product_url(product, format: :json)