class Discount < ActiveRecord::Base
  attr_accessible :active, :discountable_id, :discountable_type, :percent_off, :price
  
  belongs_to :discountable, :polymorphic => true
end
