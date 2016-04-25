class CreateLinks < ActiveRecord::Migration
  def up
    create_table :links do |t|
      t.string :title
      t.text :description
      t.string :address

      t.timestamps null: false
    end
  end
  def down
    drop_table :links
  end
end
