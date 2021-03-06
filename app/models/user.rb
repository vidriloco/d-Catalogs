class User < ActiveRecord::Base
  include Shared::Categories
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :username, :permissions
  validates_presence_of :permissions, :username
  validates_presence_of :password, :password_confirmation, :on => :create
  # attr_accessible :title, :body
  
  def humanized_permissions
    User.humanized_category_for(:permissions, self.permissions)
  end
  
  def superuser?
    return User.category_symbol_for(:permissions, permissions).eql?(:superuser)
  end
  
  private
  def self.permissions
    { 1 => :superuser, 2 => :manager, 3 => :observer}
  end
end
