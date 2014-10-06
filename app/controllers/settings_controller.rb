class SettingsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @settings = Setting.all
  end
  
  def edit
    @setting = Setting.find(params[:id])
  end
  
  def update
    @setting = Setting.find(params[:id])

    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to edit_setting_path(@setting), notice: 'Setting was successfully edited.' }
        format.json { render json: @setting, status: :created, location: @setting }
      else
        format.html { render action: "edit" }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def setting_params
    params.require(:setting).permit(:active, :attribute1, :attribute2)
  end
  
end
