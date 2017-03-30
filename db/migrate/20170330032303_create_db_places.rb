class CreateDbPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :db_places do |t|
      
      t.string :label #name
      t.float :latitude
      t.float :longitude
      t.string :zip_code
      t.string :street_number
      t.string :street
      t.float :area # square miles
      t.boolean :earth
      t.boolean :space
      t.string :country
      t.string :state
      t.integer :north
      t.integer :south
      t.integer :east
      t.integer :west
      t.integer :up
      t.integer :down
      t.text :description 
      t.string :place_type # human readable type such as city, ocean, street, etc

      t.timestamps
    end
  end
end
