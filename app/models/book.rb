class Book < ActiveRecord::Base
  include Shared::Presentators
  
  attr_accessible :author, :price, :title, :reference_id, :quantity
  validates_presence_of :author, :price, :title, :reference_id, :quantity
  
  has_many :pictures, :as => :imageable, :dependent => :destroy  
  has_many :discounts, :as => :discountable, :dependent => :destroy
  
  def name
    title
  end
end
