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
    
    scenario "I can register a pre-sale when providing valid data", :js => true do
      visit pre_sales_path
      click_on I18n.t('app.controls.new_f')
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
      
      within('.form-actions') do
        find('.btn-primary').click()
      end
      
      page.current_path.should == pre_sale_path(PreSale.last)
      page.should have_content I18n.t('app.views.pre_sales.messages.create.success')
      
      # As the following DateTime test datetime is not stored to db, we aren't changing the timezone such as: in_time_zone("Mexico City")
      page.should have_content DateTime.new(2012, Date.today.month, 15, 7, 30).to_time.to_s(:short)
    end
    
    scenario "I cannot register a pre-sale when not providing valid data", :js => true  do
      visit pre_sales_path
      click_on I18n.t('app.controls.new_f')
      page.current_path.should == new_pre_sale_path
      
      within('.form-actions') do
        find('.btn-primary').click()
      end
      
      page.current_path.should == pre_sales_path
      page.should have_content I18n.t('app.views.pre_sales.messages.save.failure')
    end
    
    describe "Having a previously registered pre-sale", :js => true do
      
      before(:each) do
        @presale = Fabricate(:pre_sale)
      end
      
      scenario "I can modify it's fields" do
        visit pre_sales_path
        click_on I18n.t('app.controls.edit')
        
        page.current_path.should == edit_pre_sale_path(@presale)
        page.evaluate_script("$('#date_text').val()").should == @presale.date.strftime("%d-%m-%Y")
        
        fill_in "pre_sale_event", :with => "Paca la del Barrio"

        within('#datepicker') do
          find('.add-on').click()
        end
        within('.datepicker-days') do
          page.execute_script("$('td:contains(25)').click();")
        end
        
        select "22", :from => "date_hour"
        select "30", :from => "date_minute"
        
        within('.form-actions') do
          find('.btn-primary').click()
        end
        
        page.current_path.should == pre_sale_path(PreSale.last.id)
        page.should have_content I18n.t('app.views.pre_sales.messages.update.success')

        # As the following DateTime test datetime is not stored to db, we aren't changing the timezone such as: in_time_zone("Mexico City")
        page.should have_content DateTime.new(2012, Date.today.month, 25, 22, 30).to_time.to_s(:short)
      end
    end
    
    
  end
  
end
