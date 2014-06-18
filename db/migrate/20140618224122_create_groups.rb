class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :location
      t.string :unit

      t.timestamps
    end
  end
end
