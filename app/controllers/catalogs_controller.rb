class CatalogsController < ApplicationController
  
  before_filter :set_access_control_headers
  
  def index
    @new_items = Book.all+MusicBox.all+Item.all
    @discounts = Discount.all
    respond_to { |format| format.js }
  end
end
