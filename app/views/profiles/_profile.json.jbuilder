json.extract! profile, :id, :name, :description, :country, :address, :atitude, :longitude, :image, :created_at, :updated_at
json.url profile_url(profile, format: :json)
