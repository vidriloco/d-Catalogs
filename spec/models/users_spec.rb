require 'spec_helper'

describe User do

  it "should generate a humanized name for a superuser" do
    user = Fabricate(:user, :as => "admin")
    user.humanized_permissions.should == I18n.t('app.categories.users.permissions.superuser')
  end
  
  it "should generate a humanized name for a superuser" do
    user = Fabricate(:user, :as => "manager")
    user.humanized_permissions.should == I18n.t('app.categories.users.permissions.manager')
  end
  
  it "should generate a humanized name for a superuser" do
    user = Fabricate(:user, :as => "observer")
    user.humanized_permissions.should == I18n.t('app.categories.users.permissions.observer')
  end
end