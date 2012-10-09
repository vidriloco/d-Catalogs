require "spec_helper"

describe CatalogsController do
  
  describe "routes" do
    
    it "matches /catalogs on controller :catalogs to action #index" do
      { :get => "/catalogs" }.should route_to(:action => "index", :controller => "catalogs")
    end

  end
end