class Discount < ActiveRecord::Base
  attr_accessible :active, :discountable_id, :discountable_type, :percent_off, :price, :note
  
  validates_presence_of :discountable
  validates_presence_of :note, :message => I18n.t('app.views.discounts.messages.field_errors.missing_note')
  validates_presence_of :price, :message => I18n.t('app.views.discounts.messages.field_errors.missing_price_info')
  validates_presence_of :percent_off, :message => I18n.t('app.views.discounts.messages.field_errors.missing_percentage_info')
    
  belongs_to :discountable, :polymorphic => true
  
  def self.new_with(params)
    discountable_obj = nil
    discountable_obj = PreSale.find(params[:pre_sale_id]) if params.has_key?(:pre_sale_id)
    discountable_obj = MusicBox.find(params[:music_box_id]) if params.has_key?(:music_box_id)
    discountable_obj = Book.find(params[:book_id]) if params.has_key?(:book_id)
    discountable_obj = Item.find(params[:item_id]) if params.has_key?(:item_id)
    
    self.new(:discountable_id => discountable_obj.id, :discountable_type => discountable_obj.class.to_s)
  end
  
end
