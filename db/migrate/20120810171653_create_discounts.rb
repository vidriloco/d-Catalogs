class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.boolean :active
      t.float :price
      t.integer :percent_off
      t.string :note
      t.references :discountable, :polymorphic => true
      
      t.timestamps
    end
  end
end
