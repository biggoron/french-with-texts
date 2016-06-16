class CreateExercices < ActiveRecord::Migration
  def up
  # Create the exercise entity, mainly used in grammar and lesson
    create_table :exercices do |t|
      t.integer     :number
      t.integer     :level

      t.references  :article,  index:  true,  foreign_key:  true
      t.timestamps  null:        false
    end
  end
  def down
    drop_table :exercices
  end
end
