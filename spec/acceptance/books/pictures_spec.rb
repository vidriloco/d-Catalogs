require 'acceptance/acceptance_helper'
require 'acceptance/pre_sales/helpers'

feature 'Pictures management (for books)' do
  
  before(:each) do
    @book = Fabricate(:book)
    @pepe = Fabricate(:user, :as => "admin")
    login_as(@pepe)
  end
  
  describe "Visiting a book description page with no registered pictures", :js => true do
    
    before(:each) do
      visit book_path(@book)
      find("#pictures-tab").click
    end
    
    scenario "should show an empty-listing message" do
      page.should have_content I18n.t('app.views.pictures.listing.none')
    end
    
    scenario "should let me add a new picture until I provide complete data" do
      click_on I18n.t('app.controls.add')
      page.current_path.should == new_book_picture_path(@book)
      page.should have_content I18n.t('app.views.pictures.new.title')
      page.should have_content @book.name
      
      # first attempt to save record
      fill_in "picture_caption", :with => "Este libro es bastante bueno, trata sobre ..."
      within('.form-actions') do
        find('.btn-primary').click()
      end
      
      page.current_path.should == pictures_path
      page.should have_content I18n.t('app.views.pictures.messages.save.failure')
      page.should have_content I18n.t('app.views.pictures.messages.field_errors.missing_attachment')
      
      # second attempt to save record
      fill_in "picture_caption", :with => ""
      attach_file("picture_image", Rails.root.join(["app","assets","images", "book.png"].join("/")))      
      within('.form-actions') do
        find('.btn-primary').click()
      end
      
      page.current_path.should == pictures_path
      page.should have_content I18n.t('app.views.pictures.messages.save.failure')
      page.should have_content I18n.t('app.views.pictures.messages.field_errors.missing_caption')
      
      #third attempt
      attach_picture(@book, "book.png")
      
      page.current_path.should == book_path(@book)
      page.should have_content I18n.t('app.views.pictures.messages.create.success')
      
      find("#pictures-tab").click
      within('#picture-list') do
        find('#1')
      end
    end
    
    it "can go to the new picture page but can cancel the registration" do
      visit new_book_picture_path(@book)
      click_on I18n.t('app.controls.cancel')
      
      page.current_path.should == book_path(@book)
    end
  end
  
  describe "Visiting a book description page with pictures", :js => true do
    
    before(:each) do
      attach_picture(@book, "book.png")
      find("#pictures-tab").click
    end
    
    scenario "then I should see it listed" do
      within('#picture-list') do
        within('#1') do
          find('.edit')
          find('.delete')
        end
      end
    end
    
    scenario "then I can modify it" do
      within('#picture-list') do
        within('#1') do
          find('.edit').click
        end
      end
      
      page.current_path.should == edit_book_picture_path(@book, Picture.first)
      
      fill_in "picture_caption", :with => "Cambios de foto"
      
      within('.form-actions') do
        find('.btn-primary').click()
      end
      
      page.current_path.should == book_path(@book)
      page.should have_content I18n.t('app.views.pictures.messages.update.success')
    end
    
    scenario "then I should be able to destroy it", :js => true do
      within('#picture-list') do
        within('#1') do
          find('.delete').click
        end
      end
      
      page.driver.browser.switch_to.alert.accept
      
      page.current_path.should == book_path(@book)
      
      find("#pictures-tab").click
      page.should have_content I18n.t('app.views.pictures.listing.none')
    end
    
  end
  
  def attach_picture(imageable, photo)
    visit new_book_picture_path(imageable)
    attach_file("picture_image", Rails.root.join(["app","assets","images", photo].join("/")))      
    fill_in "picture_caption", :with => "Este libro es bastante bueno, trata sobre ..."
    
    within('.form-actions') do
      find('.btn-primary').click()
    end
  end
end