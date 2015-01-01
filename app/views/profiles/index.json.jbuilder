json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :bio, :contact
  json.url profile_url(profile, format: :json)
end
