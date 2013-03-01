class Item < ActiveRecord::Base
  include Shared::Presentators::CatalogListPreview
  include Shared::Categories
  
  attr_accessible :brand, :model, :price, :kind, :quantity, :reference_id
  
  has_many :pictures, :as => :imageable, :dependent => :destroy  
  has_many :discounts, :as => :discountable, :dependent => :destroy
  
  validates_presence_of :reference_id, :brand, :model, :price, :quantity, :kind
  
  def first_field
    brand
  end
  
  def descriptor_field
    model
  end
  
  def second_field
    humanized_kind
  end
  
  def humanized_kind
    Item.humanized_category_for(:kinds, self.kind)
  end
  
  def self.kinds
    { 1 => :accessory, 2 => :equipment}
  end
end
