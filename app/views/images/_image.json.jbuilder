json.extract! image, :id, :title, :description, :user_id, :created_at, :updated_at
json.url image_url(image, format: :json)
