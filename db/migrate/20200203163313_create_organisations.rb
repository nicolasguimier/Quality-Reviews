class CreateOrganisations < ActiveRecord::Migration[5.2]
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :presentation
      t.string :facebook_link
      t.string :tripadvisor_link
      t.string :google_link
      t.string :yelp_link
      t.string :image_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
