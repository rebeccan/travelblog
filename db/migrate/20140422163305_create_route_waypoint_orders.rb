class CreateRouteWaypointOrders < ActiveRecord::Migration
  def change
    create_table :route_waypoint_orders do |t|
      t.integer :order
      t.references :route, index: true
      t.references :waypoint, index: true

      t.timestamps
    end
  end
end
