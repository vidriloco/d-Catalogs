class PreSale < ActiveRecord::Base
  attr_accessible :date, :description, :event, :price, :reference_id, :quantity
  
  validates_presence_of :date, :description, :event, :price, :reference_id, :quantity
  
  has_many :pictures, :as => :imageable
  has_many :discounts, :as => :discountable
  
  def self.new_with(common_params, date_components)
    PreSale.new(common_params.merge({ date: PreSale.extract_date_from(date_components).utc }))
  end
  
  def update_attributes_with(common_params, date_components)
    self.update_attributes(common_params.merge({ date: PreSale.extract_date_from(date_components).utc }))
  end
  
  private
  
  def self.extract_date_from(date_components)
    date = Date.strptime(date_components["text"], "%d-%m-%Y")
    Time.new(date.year, date.month, date.day, date_components["hour"], date_components["minute"])
  end
end
