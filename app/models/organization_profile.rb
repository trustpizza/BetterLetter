class OrganizationProfile < ApplicationRecord
  belongs_to :organization
  has_one_attached :logo
end
