require "spec_helper"

describe PicturesController do
  
  describe "routes" do
    
    it "matches /books/1/pictures/new with controller :pictures action #new" do
      { :get => "/books/1/pictures/new" }.should route_to(:action => "new", :controller => "pictures", :book_id => "1")
    end
    
    it "matches /books/1/pictures/edit with controller :pictures action #edit" do
      { :get => "/books/1/pictures/1/edit" }.should route_to(:action => "edit", :controller => "pictures", :book_id => "1", :id => "1")
    end
    
    it "matches /pre_sales/1/pictures/new with controller :pictures action #new" do
      { :get => "/pre_sales/1/pictures/new" }.should route_to(:action => "new", :controller => "pictures", :pre_sale_id => "1")
    end
    
    it "matches /pre_sales/1/pictures/edit with controller :pictures action #edit" do
      { :get => "/pre_sales/1/pictures/1/edit" }.should route_to(:action => "edit", :controller => "pictures", :pre_sale_id => "1", :id => "1")
    end
    
    it "matches /items/1/pictures/new with controller :pictures action #new" do
      { :get => "/items/1/pictures/new" }.should route_to(:action => "new", :controller => "pictures", :item_id => "1")
    end
    
    it "matches /items/1/pictures/edit with controller :pictures action #edit" do
      { :get => "/items/1/pictures/1/edit" }.should route_to(:action => "edit", :controller => "pictures", :item_id => "1", :id => "1")
    end
  end
end