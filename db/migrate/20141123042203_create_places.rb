class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.text :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
