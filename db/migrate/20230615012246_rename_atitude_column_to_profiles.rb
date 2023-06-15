class RenameAtitudeColumnToProfiles < ActiveRecord::Migration[6.1]
  def change
    rename_column :profiles, :atitude, :latitude
  end
end
