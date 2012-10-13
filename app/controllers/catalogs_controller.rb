class CatalogsController < ApplicationController
  
  before_filter :set_access_control_headers
  
  def index
    respond_to { |format| format.js }
  end
end
