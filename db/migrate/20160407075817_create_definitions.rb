class CreateDefinitions < ActiveRecord::Migration
  def up
    create_table :definitions do |t|
      t.string :expression
      t.text :note
      t.timestamps null: false
    end
  end
  def down
    drop_table :definitions 
  end
end
