class RouteWaypointOrder < ActiveRecord::Base
  belongs_to :route
  belongs_to :waypoint
end
