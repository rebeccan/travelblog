class SettingsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @http_authentication = Setting.find(1)
  end
  
  def edit
    @http_authentication = Setting.find(1)
    if @http_authentication.save
        redirect_to settings_path, alert: "Settings saved successfully."
    else
        redirect_to settings_path, alert: "Error."
    end
  end
  
end
