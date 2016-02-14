class CreateRemarks < ActiveRecord::Migration
  def change
    create_table :remarks do |t|
      t.string :title
      t.text :body
      t.integer :type
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
