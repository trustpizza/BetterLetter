class OrganizationProfile < ApplicationRecord
  belongs_to :organization
  has_one_attached :logo

  validate :acceptable_logo

  private 

  def acceptable_logo
    return unless logo.attached?

    unless logo.blob.byte_size <= 1.megabyte
      errors.add(:logo, "is too big (should be less than 1MB)")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(logo.blob.content_type)
      errors.add(:logo, "must be a JPEG or PNG")
    end
  end
end
