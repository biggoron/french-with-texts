class AddDispayOption < ActiveRecord::Migration
  def change
    add_column :articles, :online, :boolean
  end
end
