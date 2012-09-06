class Item < ActiveRecord::Base
  include Shared::Categories
  
  attr_accessible :brand, :model, :price, :kind, :quantity, :reference_id
  
  has_many :pictures, :as => :imageable
  has_many :discounts, :as => :discountable
  
  validates_presence_of :reference_id, :brand, :model, :price, :quantity, :kind
  
  def humanized_kind
    Item.humanized_category_for(:kinds, self.kind)
  end
  
  def self.kinds
    { 1 => :accessory, 2 => :equipment}
  end
end
