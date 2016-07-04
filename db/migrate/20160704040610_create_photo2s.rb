class CreatePhoto2s < ActiveRecord::Migration
  def change
	  create_table :photo2s do |t|
	    t.text :caption
	    t.integer :place_id

	    t.timestamps
	  end

	add_index :photo2s, :place_id
  end
end
