class CreateTranslations < ActiveRecord::Migration
  def up
    create_table :translations do |t|
      t.string :expression
      t.references :definition, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
  def down
    drop_table :translations 
  end
end
