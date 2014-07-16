class Route < ActiveRecord::Base
  belongs_to :route_able, polymorphic: true

  has_many :route_waypoint_orders, dependent: :destroy
end
