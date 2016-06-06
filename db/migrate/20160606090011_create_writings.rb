class CreateWritings < ActiveRecord::Migration
  def up
    create_table :writings do |t|
      t.integer     :abs_lvl
      t.integer     :rel_lvl
      t.references  :article,  index:  true,  foreign_key:  true
      t.timestamps  null:      false
    end
  end
  def down
    drop_table :writings
  end
end
