class CreatePreSales < ActiveRecord::Migration
  def change
    create_table :pre_sales do |t|
      t.string :event
      t.datetime :date
      t.float :price
      t.string :description
      t.integer :quantity
      t.integer :reference_id, :null => false
      
      t.timestamps
    end
    
    add_index :pre_sales, :reference_id, :unique => true
  end
end
