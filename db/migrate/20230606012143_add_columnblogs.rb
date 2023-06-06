class AddColumnblogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :created_at, :datetime
    add_column :blogs, :updated_at, :datetime
    add_column :blogs, :image, :text
  end
end
