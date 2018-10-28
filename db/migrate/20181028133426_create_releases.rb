class CreateReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :releases do |t|
      t.integer :company_id
      t.date :release_date
      t.string :release_title
      t.string :page_url

      t.timestamps
    end
  end
end
