class Discount < ActiveRecord::Base
  attr_accessible :active, :discountable_id, :discountable_type, :percent_off, :price, :note
  
  validates_presence_of :discountable, :note
  
  belongs_to :discountable, :polymorphic => true
  
end
