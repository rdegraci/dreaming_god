class CreateDbPeople < ActiveRecord::Migration[5.0]
  def change
    create_table :db_people do |t|
      
      t.string :label #name
      t.integer :age
      t.integer :height #inches
      t.string :hair_color
      t.string :eye_color
      t.boolean :alive 
      t.float :weight
      t.float :mass
      t.string :gender
      t.text :description      
      t.string :people_type # human readable type such as man, woman, boy, girl etc

      t.timestamps
    end
  end
end
