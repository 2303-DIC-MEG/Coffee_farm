class ChangeColumnsAddNotnullOnBlogs < ActiveRecord::Migration[6.1]
  def change
    change_column :blogs, :created_at, :datetime, null: false
    change_column :blogs, :updated_at, :datetime, null: false
  end
end
