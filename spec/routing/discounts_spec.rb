require "spec_helper"

describe DiscountsController do
  
  describe "routes" do
    
    it "matches /pre_sales/1/discounts/new with controller :discounts action #new" do
      { :get => "/pre_sales/1/discounts/new" }.should route_to(:action => "new", :controller => "discounts", :pre_sale_id => "1")
    end
    
    it "matches /books/1/discounts/new with controller :discounts action #new" do
      { :get => "/books/1/discounts/new" }.should route_to(:action => "new", :controller => "discounts", :book_id => "1")
    end
    
    it "matches /music_boxes/1/discounts/new with controller :discounts action #new" do
      { :get => "/music_boxes/1/discounts/new" }.should route_to(:action => "new", :controller => "discounts", :music_box_id => "1")
    end
    
    it "matches /items/1/discounts/new with controller :discounts action #new" do
      { :get => "/items/1/discounts/new" }.should route_to(:action => "new", :controller => "discounts", :item_id => "1")
    end
  end
end