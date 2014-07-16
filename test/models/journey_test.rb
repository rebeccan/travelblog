require 'test_helper'

class JourneyTest < ActiveSupport::TestCase
  test "journey scenario" do
    journey_australia = Journey.find(1)
    journey_timbuktu = Journey.find(2)

    assert journey_australia.routes.size == 1
    assert journey_timbuktu.routes.size == 2
  end

  test "australia journey waypoints" do
    journey_australia = Journey.find(1)

    journey_route = journey_australia.routes[0]

    assert journey_route.travel_mode.blank?
    assert journey_route.route_waypoint_orders.size == 1
    wp_order = journey_route.route_waypoint_orders[0]

    assert_not wp_order.nil?
    assert_not wp_order.waypoint.nil?

    assert_equal 1, wp_order.waypoint.id

    assert_equal "Opera", wp_order.waypoint.name
  end
end
