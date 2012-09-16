require 'acceptance/acceptance_helper'
require 'acceptance/pre_sales/helpers'

feature 'Discounts management (for books)' do
  
  before(:each) do
    @book = Fabricate(:book)
    @pepe = Fabricate(:superuser, :as => "admin")
    login_as(@pepe)
  end
  
  describe "Visiting a book description page with no registered discounts", :js => true do
    
    before(:each) do
      visit book_path(@book)
      find("#discounts-tab").click
    end
    
    scenario "should show an empty-listing message" do
      page.should have_content I18n.t('app.views.discounts.listing.none')
    end
    
    scenario "should let me add a new discount until I provide complete data" do
      click_on I18n.t('app.controls.add')
      page.current_path.should == new_book_discount_path(@book)
      page.should have_content I18n.t('app.views.discounts.new.title')
      page.should have_content @book.name
      
      # first attempt to save record
      check "discount_active"
      fill_in "discount_note", :with => "En rebaja por que somos muy buena onda"
      
      within('.form-actions') do
        find('.btn-primary').click()
      end
      
      page.current_path.should == discounts_path
      page.should have_content I18n.t('app.views.discounts.messages.save.failure')
      page.should have_content I18n.t('app.views.discounts.messages.field_errors.missing_price_info')
      
      # second attempt to save record
      fill_in "discount_percent_off", :with => 50
      fill_in "discount_note", :with => ""
      
      within('.form-actions') do
        find('.btn-primary').click()
      end
      
      page.current_path.should == discounts_path
      page.should have_content I18n.t('app.views.discounts.messages.save.failure')
      page.should have_content I18n.t('app.views.discounts.messages.field_errors.missing_note')
      
      # third attempt to save record
      
      fill_in "discount_price", :with => 500
      fill_in "discount_note", :with => "En rebaja por que es un libro que todos deben leer"
      
      within('.form-actions') do
        find('.btn-primary').click()
      end
      
      page.current_path.should == book_path(@book)
      page.should have_content I18n.t('app.views.discounts.messages.create.success')
      
      find("#discounts-tab").click
      page.should have_content "En rebaja por que es un libro que todos deben leer"
      page.should have_content "50%"
      page.should have_content "$500.0 MXN"
    end
    
    it "can go to the new discount page but can cancel the registration" do
      visit new_book_discount_path(@book)
      click_on I18n.t('app.controls.cancel')
      
      page.current_path.should == book_path(@book)
    end
  end
  
  describe "Visiting a book description page with discounts", :js => true do
    
    before(:each) do
      @discount = Fabricate(:discount, :discountable => @book)
      visit book_path(@book)
      find("#discounts-tab").click
    end
    
    scenario "then I should see it listed" do
      page.should have_content "Un descuento singular"
      page.should have_content I18n.t('app.views.discounts.fields.active')[true]
      page.should have_content 200
      page.should have_content "20%"
    end
    
    scenario "then I can modify it" do
      within('#discounts') do
        click_on I18n.t('app.controls.edit')
      end
      
      page.current_path.should == edit_book_discount_path(@book, @discount)
      
      fill_in "discount_note", :with => "En rebaja por que somos bien buena onda"
      fill_in "discount_price", :with => 5000
      
      within('.form-actions') do
        find('.btn-primary').click()
      end
      
      page.current_path.should == book_path(@book)
      page.should have_content I18n.t('app.views.discounts.messages.update.success')
    end
    
    scenario "then I should be able to destroy it", :js => true do
      within('#discounts') do
        click_on I18n.t('app.controls.destroy')
      end
      
      page.driver.browser.switch_to.alert.accept
      
      page.current_path.should == book_path(@book)
      
      find("#discounts-tab").click
      page.should have_content I18n.t('app.views.discounts.listing.none')
    end
    
  end
  
end