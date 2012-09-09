require 'acceptance/acceptance_helper'
require 'acceptance/pre_sales/helpers'

feature 'Discounts management (for pre-sales)' do
  
  before(:each) do
    @presale = Fabricate(:pre_sale)
    @pepe = Fabricate(:superuser, :as => "admin")
    login_as(@pepe)
  end
  
  
  describe "Visiting a pre-sale description page with no registered discounts" do
    
    before(:each) do
      visit pre_sale_path(@presale)
    end
    
    scenario "should show an empty-listing message" do
      page.should have_content I18n.t('app.views.discounts.listing.none')
    end
    
    scenario "should let me add a new discount" do
      click_on I18n.t('app.controls.add')
    end
  end
  
  describe "Visiting a pre-sale description page with discounts" do
    
    before(:each) do
      @discount = Fabricate(:discount, :discountable => @presale)
      visit pre_sale_path(@presale)
    end
    
    scenario "then I should see it listed" do
      page.should have_content "Un descuento singular"
      page.should have_content I18n.t('app.views.discounts.fields.active')[true]
      page.should have_content 200
      page.should have_content "20%"
    end
    
    scenario "then I should be able to destroy it", :js => true do
      click_on I18n.t('app.controls.destroy')
      page.driver.browser.switch_to.alert.accept
      
      page.current_path.should == pre_sale_path(@presale)
      page.should have_content I18n.t('app.views.discounts.listing.none')
    end
    
  end
  
end