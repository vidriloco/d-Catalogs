class PreSale < ActiveRecord::Base
  attr_accessible :date, :description, :event, :price, :reference_id, :quantity
  
  validates_presence_of :date, :description, :event, :price, :reference_id, :quantity
  
  has_many :pictures, :as => :imageable
  has_many :discounts, :as => :discountable
end
