class MusicBox < ActiveRecord::Base
  include Shared::Categories
  
  attr_accessible :artist, :format, :label, :price, :title, :kind, :reference_id, :quantity
  
  has_many :discounts, :as => :discountable
  
  validates_presence_of :title, :artist, :format, :price, :kind, :reference_id
  
  def humanized_format
    MusicBox.humanized_category_for(:formats, self.format)
  end
  
  def humanized_kind
    MusicBox.humanized_category_for(:kinds, self.kind)
  end
  
  private
  def self.formats
    { 1 => :single, 2 => :double, 3 => :triple, 4 => :boxset}
  end
  
  def self.kinds
    { 1 => :cd, 2 => :vinil}
  end
end
