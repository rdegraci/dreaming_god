class CreateDbThings < ActiveRecord::Migration[5.0]
  def change
    create_table :db_things do |t|
      t.string :label #name
      t.float :mass
      t.boolean :edible
      t.boolean :visible
      t.boolean :wearable
      t.boolean :container
      t.boolean :containable
      t.boolean :transportable
      t.boolean :transport
      t.boolean :platform
      t.boolean :platformable
      t.boolean :damageable
      t.boolean :damager # able to damage
      t.integer :cost
      t.boolean :takeable #able to be taken
      t.boolean :dropable 
      
      t.text :description 
      t.string :thing_type # human readable type such as food, jewel, utensil, etc

      t.timestamps
    end
  end
end
