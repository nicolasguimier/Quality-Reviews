class RemoveImageUrlFromOrganisation < ActiveRecord::Migration[5.2]
  def change
    remove_column :organisations, :image_url, :string
  end
end
