class BlogMigration < ActiveRecord::Migration[5.2]
  def up
  	create_table :blogs do |t|
  		t.string :title
  		t.string :slug
  		t.string :status
  		t.integer :category_id
  		t.integer :photo_id
  		t.text :description
  		t.timestamps
  	end
  end

  def down
  	drop_table :blog
  end
end
