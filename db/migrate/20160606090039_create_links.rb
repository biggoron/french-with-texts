class CreateLinks < ActiveRecord::Migration
  def up
  # Create the link entity, for external link
    create_table :links do |t|
      t.string      :title
      t.text        :description
      t.string      :address

      t.timestamps  null:         false
    end
  end
  def down
  # Deletes the link entity
    drop_table :links
  end
end
