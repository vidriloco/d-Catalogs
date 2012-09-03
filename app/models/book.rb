class Book < ActiveRecord::Base
  attr_accessible :author, :price, :title, :reference_id, :quantity
  validates_presence_of :author, :price, :title, :reference_id, :quantity
  
  has_many :pictures, :as => :imageable
  has_many :discounts, :as => :discountable
  
end
