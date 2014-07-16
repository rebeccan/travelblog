class Waypoint < ActiveRecord::Base
  has_many :RouteWaypointOrders
  
  validates :name, length: { minimum: 1 }
  validates :longitude, presence: true
  validates :latitude, presence: true
 
  has_many :RouteWaypointOrders, dependent: :destroy
end
