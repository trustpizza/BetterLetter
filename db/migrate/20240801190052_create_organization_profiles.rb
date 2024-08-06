class CreateOrganizationProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :organization_profiles do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
