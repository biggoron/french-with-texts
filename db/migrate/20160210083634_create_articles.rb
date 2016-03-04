class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :layout

      t.timestamps null: false
    end
  end
end
