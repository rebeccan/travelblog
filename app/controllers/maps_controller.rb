class MapsController < ApplicationController
  before_filter :check_map_parameter, only: [:data]
  before_filter :set_params

  def data
    unless @map 
      respond_to do |format|
       format.js { render :text => "alert('Tried to load unknown map data.');" }
      end
    else
      send "load_#{@map}"

      respond_to do |format|
       format.js { render :file => "maps/#{@map}.js.erb" }
      end
    end
  end

  def journey_bubble
    @journey = Journey.find(params[:journey])
    
    if params[:post]
      @post = Post.find(params[:post])
    end

    if params[:latitude]
      @latitude = params[:latitude].to_f
    end

    if params[:longitude]
      @longitude = params[:longitude].to_f
    end

    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  # This definition is tricky. When it's html, it responds with the information window content (html)
  # When it's json it edits a waypoint information or (when the waypoint doesn't exist, yes) it creates it. 
  def add_marker
    set_params

    @latitude = params[:latitude]
    @longitude = params[:longitude]
    @title = params[:title]

    if @post 
      @routeParent = @post
    elsif @journey
      @routeParent = @journey
    end

    @view_mode = :add

    respond_to do |format|
      format.html { render :layout => false, :file => "maps/marker_edit.html.erb" }

      format.json {
        wp = Waypoint.new
        wp.longitude = @longitude
        wp.latitude = @latitude
        wp.name = @title
        wp.show_on_overview = false

        if @routeParent && wp.save
          wpRoute = Route.new
          wpRoute.travel_mode = "DRIVING"
          wpRoute.show_on_overview = false
          wpRoute.save

          @routeParent.routes << wpRoute

          wpOrder = RouteWaypointOrder.new
          wpOrder.order = 0
          wpOrder.route = wpRoute
          wpOrder.waypoint = wp
          wpOrder.save

          render json: wp, status: :created
        else  
          render json: wp.errors, status: :unprocessable_entity 
        end
      }
    end
  end

  def edit_marker 
    set_params

    @waypoint = Waypoint.find(params[:waypoint])

    @latitude = @waypoint.latitude
    @longitude = @waypoint.longitude
    @title = @waypoint.name
    
    @view_mode = :edit

    respond_to do |format|
      format.html { render :layout => false, :file => "maps/marker_edit.html.erb" }

      format.json { 
        @waypoint.name = params[:title]

        if @waypoint.save
          render json: @waypoint, status: :ok
        else
          render json: @waypoint.errors, status: :unprocessable_entity 
        end
      }
    end
  end

  def del_marker
    @waypoint = Waypoint.find(params[:waypoint])

    respond_to do |format|
      format.json { 
        if @waypoint.delete
          render json: @waypoint, status: :ok
        else
          render json: @waypoint, status: :already_reported
        end
      }
    end
  end

  private 
    def set_routes_json(routes, id)
      routes.each do |route|
        route_js = Hash.new
        route_js[:color] = @journey.marker_color
        route_js[:travel_mode] = route.travel_mode
        route_js[:waypoints] = Array.new

        wp_orders = route.route_waypoint_orders 

        wp_orders.each do |wp_order|
          wp = Waypoint.find(wp_order.waypoint)
          
          wp_hash_js = Hash.new
          wp_hash_js[:id] = wp.id
          wp_hash_js[:longitude] = wp.longitude
          wp_hash_js[:latitude] = wp.latitude
          wp_hash_js[:title] = wp.name
          wp_hash_js[:post] = id

          route_js[:waypoints] << wp_hash_js
        end

        @routes << route_js
      end
    end


    def load_posts
      if params[:journey]
        @journey = Journey.find(params[:journey])

        @routes = Array.new

        if @journey && !@journey.posts.empty?
          @posts = @journey.posts

          @posts.each do |post|
            routes = post.routes

            set_routes_json(routes, post.id)
          end
        end
      end
    end

    def load_marker_editable
      set_params
    end

    def load_journeys
      @journey_waypoints = Array.new

      journeys = Journey.where(:public => true)

      journeys.each do |journey|
        journey_hash = Hash.new

        journey_hash[:color] = journey.marker_color
        journey_hash[:id] = journey.id

        waypoints = Array.new
        journey_hash[:waypoints] = waypoints

        routes = Route.where(:route_able => journey)
        routes.each do |route|
#          if route.show_on_overview
            orders = route.route_waypoint_orders

            orders.each do |order|
              order_waypoint = Waypoint.find(order.waypoint)

              waypoints << order_waypoint
            end
#          end
        end

        @journey_waypoints << journey_hash
      end
    end


    def load_journey
      @routes = Array.new

      @journey_waypoints = Array.new

      journey_hash = Hash.new

      journey_hash[:id] = @journey.id
      journey_hash[:title] = @journey.title
      journey_hash[:color] = @journey.marker_color
      journey_hash[:travel_mode] = ""

      waypoints = Array.new
      journey_hash[:waypoints] = waypoints

      routes = Route.where(:route_able => @journey)
      routes.each do |route|
        orders = route.route_waypoint_orders

        orders.each do |order|
          wp = Waypoint.find(order.waypoint)

          wp_hash_js = Hash.new
          wp_hash_js[:id] = wp.id
          wp_hash_js[:longitude] = wp.longitude
          wp_hash_js[:latitude] = wp.latitude
          wp_hash_js[:title] = wp.name
          wp_hash_js[:journey] = @journey.id

          waypoints << wp_hash_js
        end
      end

      @routes << journey_hash
    end

    def set_params
      logger.debug params[:id].inspect

      @id_type = params[:type]

      if params[:id] && params[:id_type] == "journey"
        params[:journey] = params[:id]
      elsif params[:id] && params[:id_type] == "post"
        params[:post] = params[:id]
      end

      if params[:post]
       load_posts

        @post = Post.find(params[:post])
        @id = @post.id
        @id_type = "post"
      elsif params[:journey]
        @journey = Journey.find(params[:journey])

        load_journey
        @id = @journey.id
        @id_type = "journey"
      end
        

      @zoom = 4

      if params[:latitude]
        @latitude = params[:latitude].to_f
      else
        @latitude = 48.9174129
        @zoom = 2
      end

      if params[:longitude]
        @longitude = params[:longitude].to_f
      else
        @longitude = 11.4079934
        @zoom = 2
      end
    end

    def check_map_parameter
      allowed_map_parameters = Array.new 
      allowed_map_parameters += %w(journeys posts marker_editable)

      if params[:map] && !allowed_map_parameters.include?(params[:map])
        params.delete :map
      else
        @map = params[:map]
      end
    end
end