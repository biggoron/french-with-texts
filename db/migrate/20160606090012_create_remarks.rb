class CreateRemarks < ActiveRecord::Migration
  def up
  # Create the remark entity
    create_table :remarks do |t|
      t.string      :title
      t.integer     :category #can be vocabulary, grammar, culture etc...
      t.references  :writing,  index:  true,  foreign_key:  true

      t.timestamps  null:      false
    end
  end
  def down
  # Deletes the remark entity
    drop_table :remarks
  end
end
