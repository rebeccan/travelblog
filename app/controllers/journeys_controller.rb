class JourneysController < ApplicationController
  before_action :set_journey, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show ]
  
   def index
    #force user to change credentials
    if user_signed_in? && User.find_by(email: "change_email@example.com")
      unless Rails.application.config.default_login
        redirect_to edit_user_registration_path
      end
    end

    #admin sees all journeys
    if user_signed_in?
      @journeys = Journey.find_recent
    #any user sees only journeys which are public
    else
      @journeys = Journey.find_recent_public
    end
  end

  #view für neuen Reise anlegen anzeigen
  def new
    @journey = Journey.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @journey }
    end
  end
  
  # neue Reise abspeichern
  def create
    @journey = Journey.new(journey_params)

    respond_to do |format|
      if @journey.save
        format.html { redirect_to @journey, notice: 'Journey was successfully created.' }
        format.json { render json: @journey, status: :created, location: @journey }
      else
        format.html { render action: "new" }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def edit
  end
  
  
  def show  
    @journey = Journey.find(params[:id])

    if user_signed_in?
      @posts = Post.find_recent(params[:id])
    else
      @posts = Post.find_recent_not_draft(params[:id])
    end
  end
  
  
  def update
    respond_to do |format|
      if @journey.update(journey_params)
        format.html { redirect_to @journey, notice: 'Journey was successfully edit.' }
        format.json { render json: @journey, status: :created, location: @journey }
      else
        format.html { render action: "edit" }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def destroy
    @journey.destroy
    redirect_to journeys_url
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journey
      @journey = Journey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journey_params
      params.require(:journey).permit(:title, :public, :password, :text, :marker_color, :start ,:end)
    end

end
