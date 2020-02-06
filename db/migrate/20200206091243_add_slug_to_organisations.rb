class AddSlugToOrganisations < ActiveRecord::Migration[5.2]
  def change
    add_column :organisations, :slug, :string
    add_index :organisations, :slug, unique: true
  end
end
