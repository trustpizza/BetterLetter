json.extract! organization_profile, :id, :organization_id, :name, :description, :created_at, :updated_at
json.url organization_profile_url(organization_profile, format: :json)
