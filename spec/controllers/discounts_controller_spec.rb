# encoding: utf-8
require 'spec_helper'

describe DiscountsController do

  before(:each) do
    @pepe = Fabricate(:superuser, :as => "admin")
  end
  
  describe "When logged-in" do
    
    before(:each) do
      sign_in @pepe
    end
    
    describe "GET new" do
      
      before(:each) do
        @discount = Discount.new
        @discountable = Fabricate(:pre_sale)
      end
      
      it "should generate a new discount object associated to a pre_sale record" do
        get :new, :pre_sale_id => @discountable.id
        assigns(:discount).should be_instance_of(Discount)
        assigns(:discount).discountable.should_not be_nil
      end
      
    end
    
    describe "DELETE destroy" do
      
      before(:each) do
        @discountable = Fabricate(:pre_sale)
        @discount = Fabricate(:discount, :discountable => @discountable)
        @discount.save
      end 
      
      it "should destroy an existing discount" do
        Discount.should_receive(:find) { @discount }
        @discount.should_receive(:destroy)
        delete :destroy, :id => @discount.id
      end
      
      it "should redirect back to the associated discountable" do
        Discount.stub(:find) { @discount }
        delete :destroy, :id => @discount.id
        response.should redirect_to(@discountable)
      end
      
    end
    
    describe "PUT update" do
      
      before(:each) do
        @presale = Fabricate(:pre_sale)
        @discount = Fabricate(:discount, :discountable => @presale)
      end
      
      describe "on successful update" do
        
        before(:each) do
          @discount.stub(:update).and_return(true)
        end
        
        it "should redirect to the associated discountable record" do
          Discount.stub(:find).with(@discount.id.to_s) { @discount }
          put :update, :id => @presale.id,  :params => {}
          response.should redirect_to(@presale)
        end
        
      end
      
      describe "on unsuccessful update" do
        
        before(:each) do
          @discount.stub(:update).and_return(false)
        end
        
        it "should re-render the edit form" do
          Discount.stub(:find).with(@discount.id.to_s) { @discount }
          put :update, :id => @presale.id, :params => {}
          response.should render_template('edit')
        end
        
      end
      
    end
    
    describe "POST create" do
      
      before(:each) do
        @presale = Fabricate(:pre_sale)
        @discount = Fabricate.build(:discount, :discountable => @presale)
      end
      
      describe "on successful save" do
        
        before(:each) do
          @discount.stub(:save).and_return(true)
        end
        
        it "should redirect to the associated discountable record" do
          Discount.stub(:new) { @discount }
          post :create , :params => {}
          response.should redirect_to(@presale)
        end
        
      end
      
      describe "on unsuccessful save" do
        
        before(:each) do
          @discount.stub(:save).and_return(false)
        end
        
        it "should re-render the new form" do
          Discount.stub(:new) { @discount }
          post :create , :params => {}
          response.should render_template('new')
        end
      end
    end
  end
  
end
