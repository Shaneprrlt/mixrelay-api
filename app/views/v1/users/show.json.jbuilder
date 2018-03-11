json.user do
  json.(@user, :id, :email, :username, :phone_number, :first_name, :last_name, :full_name, :phone_verified, :email_verified, :profile_image_url, :status, :token, :created_at, :updated_at)
end
