class CreateMusicBoxes < ActiveRecord::Migration
  def change
    create_table :music_boxes do |t|
      t.string :title
      t.string :artist
      t.integer :format
      t.float :price
      t.string :label
      t.integer :quantity, :default => 0
      t.integer :kind
      t.integer :reference_id, :null => false
      
      t.timestamps
    end
    
    add_index :music_boxes, :reference_id, :unique => true
  end
end
