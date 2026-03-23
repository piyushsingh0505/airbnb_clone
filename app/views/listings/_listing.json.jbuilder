json.extract! listing, :id, :title, :price, :location, :image_url, :created_at, :updated_at
json.url listing_url(listing, format: :json)
