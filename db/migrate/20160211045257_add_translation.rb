class AddTranslation < ActiveRecord::Migration
  def change
    add_column :writings, :translation, :text
  end
end
