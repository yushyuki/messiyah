class AllToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :all, :integer
  	add_column :posts, :kitchen, :integer
  	add_column :posts, :hall, :integer
  	add_column :posts, :counter, :integer
  	add_column :posts, :equipment, :integer
  	add_column :posts, :gas_stove, :integer
  	add_column :posts, :range, :integer
  	add_column :posts, :refrigerator, :integer
  	add_column :posts, :dishwashers, :integer
  	add_column :posts, :worktop, :integer
  end
end
