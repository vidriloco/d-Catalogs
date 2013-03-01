class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  def set_access_control_headers 
    unless Rails.env=="development"
      headers['Access-Control-Allow-Origin'] = request.env['HTTP_ORIGIN']
      headers['Access-Control-Allow-Methods'] = 'GET, OPTIONS'
      headers['Access-Control-Max-Age'] = '1000'
      headers['Access-Control-Allow-Headers'] = '*,x-requested-with'
    end
  end
end
