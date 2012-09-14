require 'acceptance/acceptance_helper'
require 'acceptance/pre_sales/helpers'

feature 'User account management' do
  
  describe "As a superuser",:js => true do
  
    before(:each) do
      @pepe = Fabricate(:user, :as => "admin")
      login_as(@pepe)
      
    end
    
    scenario "I can change my settings" do
      visit edit_user_path(@pepe)
      page.should have_content I18n.t('app.navbar.sections.users')
    
      fill_in :user_username, :with => "paquito"
      fill_in :user_email, :with => "paco@example.com"
      select User.humanized_category_for(:permissions, :manager), :from => :user_permissions
    
      within('.form-actions') do
        find('.btn-primary').click()
      end
    
      page.current_path.should == user_path(@pepe)
      page.should_not have_content I18n.t('app.navbar.sections.users')
    end
  
    scenario "It will not let me add a new user without providing a password" do
      visit new_user_path
      
      fill_in 'user_username', :with => "pancho"
      fill_in 'user_email', :with => "pancho@example.com" 
      select User.humanized_category_for(:permissions, :manager), :from => 'user_permissions'
      
      within('.form-actions') do
        find('.btn-primary').click()
      end
      
      page.current_path.should == users_path
      page.should have_content I18n.t("app.views.users.messages.save.failure")
    end
    
    scenario "Can add a new user when providing full info" do
      visit new_user_path
      
      fill_in 'user_username', :with => "pancho"
      fill_in 'user_email', :with => "pancho@example.com" 
      select User.humanized_category_for(:permissions, :manager), :from => 'user_permissions'
      fill_in 'user_password', :with => "kirky" 
      fill_in 'user_password_confirmation', :with => "kirky" 
      
      within('.form-actions') do
        find('.btn-primary').click()
      end
      
      page.current_path.should == user_path(User.last)
      page.should have_content I18n.t("app.views.users.messages.create.success")
    end
  end
  
  describe "As a normal user" do
    
    before(:each) do
      @pablo = Fabricate(:user, :as => "manager")
    end
    
    describe "Given I am logged in as a manager", :js => true do
      
      before(:each) do
        login_as(@pablo)
      end
    
      scenario "I can change some of my settings" do
        visit edit_user_path(@pablo)
        page.should have_content I18n.t('app.views.users.edit.my_title')
        
        fill_in :user_username, :with => "paquito"
        fill_in :user_email, :with => "paco@example.com"
        page.should have_no_selector(:xpath, "//select[@id='user_permissions']")
        
        within('.form-actions') do
          find('.btn-primary').click()
        end
      
        page.current_path.should == user_path(@pablo)
      end
      
      scenario "I can change my password" do
        visit edit_user_path(@pablo)
        page.should have_content I18n.t('app.views.users.edit.my_title')
        
        fill_in 'user_password', :with => "kirky" 
        fill_in 'user_password_confirmation', :with => "kirky"
        
        within('.form-actions') do
          find('.btn-primary').click()
        end
      
        login_as(@pablo, "kirky")
        visit edit_user_path(@pablo)
        page.should have_content I18n.t('app.views.users.edit.my_title')
      end
      
      scenario "attempting to visit the users admin panel is not allowed to me" do
        visit users_path
        page.current_path.should == root_path
      end
      
    end
    
  end
  
end
