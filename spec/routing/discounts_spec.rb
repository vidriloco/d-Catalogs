require "spec_helper"

describe DiscountsController do
  
  describe "routes" do
    
    it "matches /pre_sales/1/discounts/new with controller :discounts action #new" do
      { :get => "/pre_sales/1/discounts/new" }.should route_to(:action => "new", :controller => "discounts", :pre_sale_id => "1")
    end
    
  end
end