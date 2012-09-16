require 'carrierwave/orm/activerecord'

class Picture < ActiveRecord::Base
  
  belongs_to :imageable, :polymorphic => true
  attr_accessible :caption, :imageable_id, :imageable_type, :image
  
  validates_presence_of :caption, :message => I18n.t('app.views.pictures.messages.field_errors.missing_caption')
  validates_presence_of :image, :message => I18n.t('app.views.pictures.messages.field_errors.missing_attachment')
  
  mount_uploader :image, ImageUploader
  
  def self.new_with(params)
    imageable_obj = nil
    imageable_obj = Book.find(params[:book_id]) if params.has_key?(:book_id)
    imageable_obj = PreSale.find(params[:pre_sale_id]) if params.has_key?(:pre_sale_id)
    imageable_obj = Item.find(params[:item_id]) if params.has_key?(:item_id)
    
    self.new(:imageable_id => imageable_obj.id, :imageable_type => imageable_obj.class.to_s)
  end
end
