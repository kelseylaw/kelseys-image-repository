json.extract! user, :id, :username, :password, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
