class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.string      :title
      t.string      :layout
      t.string      :image_name
      t.boolean     :online
      t.timestamps  null:        false
    end
  end
  def down
    drop_table :articles
  end
end
