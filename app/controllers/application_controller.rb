class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :get_url_journey_main_photo, :get_url_post_main_photo, :get_mark_down_html, :get_url_post_main_photo_gallery, :get_url_journey_main_photo_gallery
  before_filter :set_content_variables, :authenticate_readers
  
  
  #ask blog readers for http username and passwort, if settings say so
  protected 
  def authenticate_readers
    setting_http_authentication = Setting.find(1)
    if(setting_http_authentication.active)
      authenticate_or_request_with_http_basic do |username, password|
        username == setting_http_authentication.attribute1 && password == setting_http_authentication.attribute2
      end
    end
  end
  
  
  def get_url_journey_main_photo(journey)
    url = ''
    posts = journey.posts
    if(posts == nil)
      return url
    end
    posts.each do |post|
      gallery = post.galleries
      if(gallery[0] == nil)
        return url
      end
      photos = gallery[0].photos
      if(photos == nil)
        return url
      end
      photos.each do |photo|
        if photo.travel_main
          url = photo.url
        end
      end
    end

    return url
  end


  def get_url_journey_main_photo_gallery(journey)
    url = journey_path(journey)
    
    posts = journey.posts
    if(posts == nil)
      return journey_path(journey)
    end
    posts.each do |post|
      gallery = post.galleries
      if(gallery[0] == nil)
        return journey_path(journey)
      end
      photos = gallery[0].photos
      if(photos == nil)
        return journey_path(journey)
      end
      photos.each do |photo|
        if photo.travel_main
          url = gallery_path(gallery[0])
        end
      end
    end

    return url
  end




  def get_url_post_main_photo(post)
    url = ''
    gallery = post.galleries
    
    if(gallery[0] == nil)
       return url
    end
      
    photos = gallery[0].photos
    
    if(photos == nil)
      return url
    end
    
    photos.each do |photo|
      if photo.post_main
        url = photo.url
      end
    end
    
    return url
  end

  def get_url_post_main_photo_gallery(post)
    gallery = post.galleries
    
    unless gallery[0]
       post_path(post)
    else
      gallery_path(gallery[0])      
    end
  end


  def get_mark_down_html(content) 
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options = {}), extensions = {})

    html = markdown.render(content)
    html.gsub(/^\s*<p>/, "").gsub(/<\/p>\s*^/, "")
  end

  private
    def set_content_variables
      @title_wo_yield = Rails.application.config.blog_site_title
      @maps_script_url = "https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&sensor=false"

      unless Rails.application.config.maps_api_key.blank?
        @maps_script_url += "&key=" + Rails.application.config.maps_api_key
      end
    end



end
