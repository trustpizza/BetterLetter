class CreateJobPostings < ActiveRecord::Migration[7.1]
  def change
    create_table :job_postings do |t|
      t.string :title
      t.text :description
      t.text :responsibilities
      t.text :qualifications
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
