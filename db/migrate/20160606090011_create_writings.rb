class CreateWritings < ActiveRecord::Migration
  def up
  # Create the writing entity
    create_table :writings do |t|
      t.integer     :abs_lvl # Difficulty of the writing
      t.integer     :rel_lvl # Relative difficulty of the writing
      t.references  :article,  index:  true,  foreign_key:  true
      t.timestamps  null:      false
    end
  end
  def down
  # Deletes the writing entity
    drop_table :writings
  end
end
