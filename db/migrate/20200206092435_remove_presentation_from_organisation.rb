class RemovePresentationFromOrganisation < ActiveRecord::Migration[5.2]
  def change
    remove_column :organisations, :presentation, :string
  end
end
