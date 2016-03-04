class AddImage < ActiveRecord::Migration
  def change
    add_column :articles, :image_name, :text
  end
end
