class Organization < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :build_default_profile

  has_one :organization_profile, dependent: :destroy
  accepts_nested_attributes_for :organization_profile

  private

  def build_default_profile
    create_organization_profile
  end
end
