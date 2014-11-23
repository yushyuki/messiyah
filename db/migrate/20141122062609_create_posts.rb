class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :user_id
      t.text :address
      t.integer :shop_kind
      t.string :time
      t.string :house_rent
      t.timestamps
    end
  end
end
