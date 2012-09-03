require 'acceptance/acceptance_helper'
require 'acceptance/pre_sales/helpers'

feature 'Presales management' do
  
  before(:each) do
    @pepe = Fabricate(:superuser, :as => "admin")
  end
  
  describe "Given I am logged in as a superuser " do
    
    before(:each) do
      login_as(@pepe)
    end
    
    scenario 'I can register a pre-sale when providing valid data', :js => true do
      visit pre_sales_path
      click_on I18n.t('app.controls.new')
      page.current_path.should == new_pre_sale_path
      
      fill_in "pre_sale_event", :with => "Paquita la del Barrio"
      
      within('#datepicker') do
        find('.add-on').click()
      end
      within('.datepicker-days') do
        page.execute_script("$('td:contains(15)').click();")
      end
      
      select "07", :from => "date_hour"
      select "30", :from => "date_minute"
      
      fill_in "pre_sale_description", :with => "El concierto que estabas esperando"
      fill_in "pre_sale_price", :with => 500
      fill_in "pre_sale_quantity", :with => 400
      
      fill_in "pre_sale_reference_id", :with => 1
    end
    
  end
  
end
