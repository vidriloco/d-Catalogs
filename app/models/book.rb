class Book < ActiveRecord::Base
  include Shared::Presentators::CatalogListPreview
  
  attr_accessible :author, :price, :title, :reference_id, :quantity
  validates_presence_of :author, :price, :title, :reference_id, :quantity
  
  has_many :pictures, :as => :imageable, :dependent => :destroy  
  has_many :discounts, :as => :discountable, :dependent => :destroy
  
  # Presentators for CatalogListPreview
  def first_field
    title
  end
  
  def descriptor_field
    brand
  end
  
  def image_field
    return nil if pictures.empty?
    pictures.first.image.thumbnail
  end
end
