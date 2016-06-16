class CreateArticles < ActiveRecord::Migration
  def up
  # Create the article entity
    create_table :articles do |t|
      t.string      :title
      t.string      :layout            # States the type of article
      t.string      :image_name
      t.string      :filename
      t.boolean     :online
      t.timestamps  null:        false
    end
  end
  def down
  # Deletes the article entity
    drop_table :articles
  end
end
