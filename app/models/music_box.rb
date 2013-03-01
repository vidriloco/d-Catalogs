class MusicBox < ActiveRecord::Base
  include Shared::Presentators::CatalogListPreview
  include Shared::Categories
  
  attr_accessible :artist, :presentation_format, :label, :price, :title, :kind, :reference_id, :quantity
  
  has_many :discounts, :as => :discountable, :dependent => :destroy
    
  validates_presence_of :title, :artist, :presentation_format, :price, :kind, :reference_id, :quantity
  
  def humanized_presentation_format
    MusicBox.humanized_category_for(:presentation_formats, self.presentation_format)
  end
  
  def humanized_kind
    MusicBox.humanized_category_for(:kinds, self.kind)
  end
  
  # Presentators for CatalogListPreview
  def first_field
    title
  end
  
  def image_field
  end
  
  private
  def self.presentation_formats
    { 1 => :single, 2 => :double, 3 => :triple, 4 => :boxset}
  end
  
  def self.kinds
    { 1 => :cd, 2 => :vinil}
  end
end
