class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.float :price
      t.integer :quantity
      t.integer :reference_id, :null => false
      
      t.timestamps
    end
    
    add_index :books, :reference_id, :unique => true
  end
end
