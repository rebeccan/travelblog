require 'open-uri'

Mime::Type.register "image/png", :png

# Example URLs
# With letter (dot): http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|FE7569
# Without letter:    http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=|FE7569

class MapsMarkerController < ApplicationController
  before_filter :authenticate_user!, :only => [ :add_marker ]

  def marker
    color_code = params[:color]

    if color_code && /#?[0-9a-fA-F]{1,6}/ =~ color_code
      if color_code.first == "#"
        color_code[0] = ''
      end

      cached = MarkerBinary.find_by color: color_code.upcase

      if cached
        logger.debug "Requested maps marker for color '#{color_code}' found in database"
      else
        url = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=|#{color_code}"
      
        logger.debug "Requested maps marker for color '#{color_code}' not found in database. Downloading #{url}"

        cached = MarkerBinary.new
        cached.color = color_code.upcase
        cached.image = open(URI.encode(url)).read
        cached.save
      end

      respond_to do |format|
        format.png do
          send_data(cached.image, :filename => "marker.png", :type => "image/png")
        end
      end
    else
      logger.warn "Requested maps marker for color '#{color_code}' failed"
    end
  end

  def marker_check
    color_code = params[:color]
    
    if color_code && /#?[0-9a-fA-F]{1,6}/ =~ color_code
      if color_code.first == "#"
        color_code[0] = ''
      end

      journeys = Journey.where("upper(marker_color) LIKE '%#{color_code.upcase}'") # SQL inject. doesn't work cause of the prev. regex check

      result = Hash.new

      if journeys.exists?
        result[:in_use] = true
      else
        result[:in_use] = false
      end

      respond_to do |format|
        format.json do 
          render :json => result end
      end
    else
      logger.warn "Requested marker color usage '#{color_code}' failed"
    end
  end
end