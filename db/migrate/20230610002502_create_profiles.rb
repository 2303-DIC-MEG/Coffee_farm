class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :description
      t.string :country
      t.string :address, null: false
      t.decimal :atitude, null: false
      t.decimal :longitude, null: false
      t.text :image

      t.timestamps
    end
  end
end
