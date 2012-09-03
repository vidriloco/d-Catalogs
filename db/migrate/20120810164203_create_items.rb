class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :brand
      t.string :model
      t.float :price
      t.integer :kind
      t.integer :quantity
      t.integer :reference_id, :null => false
      
      t.timestamps
    end
    
    add_index :items, :reference_id, :unique => true
  end
end
