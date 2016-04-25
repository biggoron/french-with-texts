class CreateRemarks < ActiveRecord::Migration
  def up
    create_table :remarks do |t|
      t.string :title
      t.text :body
      t.integer :category
      t.references :writing, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
  def down
    drop_table :remarks
  end
end
