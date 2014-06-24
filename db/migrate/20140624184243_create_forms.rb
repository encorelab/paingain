class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :title
      t.integer :page_id
      t.boolean :repeatable

      t.timestamps
    end
  end
end
