class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def up
    change_column :profiles, :atitude,:decimal, null: true
    change_column :profiles, :longitude,:decimal, null: true# null: trueを明示する必要がある
  end

  def down
    change_column :profiles, :atitude,:decimal, null: false
    change_column :profiles, :longitude,:decimal, null: false
  end
end
