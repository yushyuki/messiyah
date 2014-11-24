class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :user_id
      t.text :address
      t.integer :shop_kind
      t.integer :locational
      t.integer :other
      t.integer :time
      t.integer :time2
      t.integer :youbi_all
      t.integer :sunday
      t.integer :monday
      t.integer :tuesday
      t.integer :wednesday
      t.integer :thursday
      t.integer :friday
      t.integer :saturday
      t.integer :house_rent
      t.timestamps
    end
  end
end
