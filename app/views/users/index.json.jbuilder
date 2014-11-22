json.array!(@users) do |user|
  json.extract! user, :name, :email, :phonenumber, :address
  json.url user_url(user, format: :json)
end