module HelperMethods

  def login_as(user, password=nil)
    visit new_user_session_path
    
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => password || user.password
    
    within('.form-actions') do
      click_on I18n.t('app.views.sessions.new.log_in')
    end
  end
  
end

RSpec.configuration.include HelperMethods, :type => :acceptance