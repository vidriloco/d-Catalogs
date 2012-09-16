# encoding: utf-8
require 'spec_helper'

describe PicturesController do
  
  before(:each) do
    @pepe = Fabricate(:superuser, :as => "admin")
  end
  
  describe "When logged-in" do
    
    before(:each) do
      sign_in @pepe
    end
    
    describe "GET new" do
      
      before(:each) do
        @picture = Picture.new
        @imageable = Fabricate(:book)
      end
      
      it "should generate a new picture object associated to a book record" do
        get :new, :book_id => @imageable.id
        assigns(:picture).should be_instance_of(Picture)
        assigns(:picture).imageable.should_not be_nil
      end
      
    end
    
    describe "POST create" do
      before(:each) do
        @book = Fabricate(:book)
        @picture = Fabricate.build(:picture, :imageable => @book)
      end
      
      describe "on successful save" do
        
        before(:each) do
          @picture.stub(:save).and_return(true)
        end
        
        it "should redirect to the associated imageable record" do
          Picture.stub(:new) { @picture }
          post :create , :params => {}
          response.should redirect_to(@book)
        end
        
      end
      
      describe "on unsuccessful save" do
        
        before(:each) do
          @picture.stub(:save).and_return(false)
        end
        
        it "should re-render the new form" do
          Picture.stub(:new) { @picture }
          post :create , :params => {}
          response.should render_template('new')
        end
      end
    end
    
    describe "For an existant picture" do
    
      before(:each) do
        @book = Fabricate(:book)
        @picture = Fabricate(:picture, :imageable => @book, :image => File.new(Rails.root.join('app/assets/images/rails.png')))
      end
    
      describe "PUT update" do
      
        describe "on successful update" do
        
          before(:each) do
            @picture.stub(:update).and_return(true)
          end
        
          it "should redirect to the associated discountable record" do
            Picture.stub(:find).with(@picture.id.to_s) { @picture }
            put :update, :id => @picture.id,  :params => {}
            response.should redirect_to(@book)
          end
        
        end
      
        describe "on unsuccessful update" do
        
          before(:each) do
            @picture.stub(:update).and_return(false)
          end
        
          it "should re-render the edit form" do
            Picture.stub(:find).with(@picture.id.to_s) { @picture }
            put :update, :id => @book.id, :params => {}
            response.should render_template('edit')
          end
        
        end
      
      end
    
      describe "DELETE destroy" do

        it "should destroy it" do
          Picture.should_receive(:find) { @picture }
          @picture.should_receive(:destroy)
          delete :destroy, :id => @picture.id
        end

        it "should redirect back to the associated imageable record" do
          Picture.stub(:find) { @picture }
          delete :destroy, :id => @picture.id
          response.should redirect_to(@book)
        end

      end
    end
  
    
  end
end