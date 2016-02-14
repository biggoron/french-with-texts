class CreateWritings < ActiveRecord::Migration
  def change
    create_table :writings do |t|
      t.integer :abs_lvl
      t.integer :rel_lvl
      t.text :body
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
