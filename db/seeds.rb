# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

journeys = Journey.create([
  {title: 'Australia', start: DateTime.new(2012,9,30), end: DateTime.new(2013,03,15), 
  text: 'Australia was so lorem ipsum awesome! I was surfing in the morning before going to work.', public: true, marker_color: '#FE766F'}, 
  {title: 'Thailand',start: DateTime.new(2014, 2, 18), end: DateTime.new(2014,3,16), 
  text: 'Thailand...', public: true, marker_color: '#FE9134'}, 
  {title: 'USA', start: DateTime.new(2011,9,30), end: DateTime.new(2012,3,15), 
  text: 'USA was...', public: true, marker_color: '#FDEC75'},
  {title: 'Russia',start: DateTime.new(2013,9,1), end: DateTime.new(2013,9,14), 
  text: 'Russia...', public: true, marker_color: '#BAE5FC'}
]);
  

posts = Post.create([
  {title: 'Outback', date: DateTime.new(2013,2,20), text: 'The red desert...', draft: false, journey_id: journeys[0].id },
  
  {title: 'Chiang Mai', date: DateTime.new(2014,2,24), text: 'Elephant riding..', draft: false, journey_id: journeys[1].id },
  {title: 'Bangkok', date: DateTime.new(2014,2,18), text: 'Crazy city...', draft: false, journey_id: journeys[1].id },
  {title: 'Khao Lak', date: DateTime.new(2014,3,2), text: 'Awesome beaches...', draft: false, journey_id: journeys[1].id },
  
  {title: 'Moscow', date: DateTime.new(2013,9,1), text: 'Moscow\'s Stalin Skyscrapers...', draft: false, journey_id: journeys[3].id },
  {title: 'Sankt Petersburg', date: DateTime.new(2013,9,1), text: 'A Paris-Venice mixture...', draft: false, journey_id: journeys[3].id },
  
  {title: 'New York', date: DateTime.new(2011,11,1), text: 'Brooklyn Bridge in NYC...', draft: false, journey_id: journeys[2].id },
  {title: 'West Coast', date: DateTime.new(2012,11,1), text: 'California ...', draft: false, journey_id: journeys[2].id },
  
  #some more Australia Posts
  {title: 'Sydney', date: DateTime.new(2013,2,20), text: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', draft: false, journey_id: journeys[0].id },
  {title: 'Melbourne', date: DateTime.new(2013,2,20), text: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', draft: false, journey_id: journeys[0].id },
  {title: 'Darwin', date: DateTime.new(2013,2,20), text: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', draft: false, journey_id: journeys[0].id },
  {title: 'Cairns', date: DateTime.new(2013,2,20), text: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', draft: false, journey_id: journeys[0].id }
  
]);  


galleries = Gallery.create([
  {name: 'Moscow Gallery', post_id: posts[4].id },
  {name: 'Chiang Mai Gallery', post_id: posts[1].id },
  {name: 'Bangkok', post_id: posts[2].id },
  {name: 'Outback', post_id: posts[0].id },
  {name: 'Khao Lak', post_id: posts[3].id },
  {name: 'New York', post_id: posts[6].id },
  {name: 'Sankt Petersburg', post_id: posts[5].id },
  {name: 'West Coast', post_id: posts[7].id },
  {name: 'Sydney', post_id: posts[8].id },
  {name: 'Melbourne', post_id: posts[9].id },
  {name: 'Darwin', post_id: posts[10].id },
  {name: 'Cairns', post_id: posts[11].id }
]);


photos = Photo.create([
  {url_seed: 'russia2.jpg', post_main: true, travel_main: true, gallery_id: galleries[0].id},
  {url_seed: 'russia2.jpg', post_main: true, travel_main: true, gallery_id: galleries[6].id},
  {url_seed: 'thailand_chiangmai2.jpg', post_main: true, travel_main: true, gallery_id: galleries[1].id},
  {url_seed: 'thailand_bangkok_detail2.jpg', post_main: true, travel_main: true, gallery_id: galleries[2].id},
  {url_seed: 'australia2.jpg', post_main: true, travel_main: true, gallery_id: galleries[3].id},
  {url_seed: 'thailand2.jpg', post_main: true, travel_main: true, gallery_id: galleries[4].id},
  {url_seed: 'usa2.jpg', post_main: true, travel_main: true, gallery_id: galleries[5].id},
  {url_seed: 'usa2.jpg', post_main: true, travel_main: true, gallery_id: galleries[7].id},
  {url_seed: 'thailand_chiangmai3.jpg', post_main: false, travel_main: false, gallery_id: galleries[1].id},
  {url_seed: 'thailand_chiangmai4.jpg', post_main: false, travel_main: false, gallery_id: galleries[1].id},
  {url_seed: 'thailand_chiangmai5.jpg', post_main: false, travel_main: false, gallery_id: galleries[1].id},
  {url_seed: 'thailand_chiangmai6.jpg', post_main: false, travel_main: false, gallery_id: galleries[1].id},
  {url_seed: 'sydney.jpg', post_main: true, travel_main: false, gallery_id: galleries[8].id},
  {url_seed: 'greatOceanRoad.jpg', post_main: true, travel_main: false, gallery_id: galleries[9].id},
  {url_seed: 'darwin.jpg', post_main: true, travel_main: false, gallery_id: galleries[10].id},
  {url_seed: 'cairns.jpg', post_main: true, travel_main: false, gallery_id: galleries[11].id},
  {url_seed: 'outback.jpg', post_main: false, travel_main: false, gallery_id: galleries[3].id}
]);

journey_routes = Route.create([
  { show_on_overview: true, route_able_type: 'Journey', route_able_id: journeys[1].id },
  { show_on_overview: true, route_able_type: 'Journey', route_able_id: journeys[0].id },
  { show_on_overview: true, route_able_type: 'Journey', route_able_id: journeys[3].id },
  { show_on_overview: true, route_able_type: 'Journey', route_able_id: journeys[2].id }
]);

post_routes = Route.create([
  { show_on_overview: true, travel_mode: 'Driving', route_able_type: 'Post',    route_able_id: posts[1].id }, # Thailand 
  
  { show_on_overview: true, travel_mode: 'Driving', route_able_type: 'Post',    route_able_id: posts[0].id }, # Australia

  { show_on_overview: true, travel_mode: 'Driving', route_able_type: 'Post',    route_able_id: posts[4].id }, # Russia
  { show_on_overview: true, travel_mode: 'Driving', route_able_type: 'Post',    route_able_id: posts[5].id }, # Russia

  { show_on_overview: true, travel_mode: 'Driving', route_able_type: 'Post',    route_able_id: posts[6].id }, # USA
  { show_on_overview: true, travel_mode: 'Driving', route_able_type: 'Post',    route_able_id: posts[7].id }, # USA
]);

journey_waypoints = Waypoint.create([
  { name: 'Bangkok',          longitude: 100.5194091796875   , latitude: 13.7313809749427  }, # Thailand 
  { name: 'Sydney',           longitude: 151.19384765625     , latitude: -33.86129311351552 }, # Australia
  { name: 'Moskau',           longitude: 37.6173             , latitude: 55.755826 }, # Russia
  { name: 'New York City',    longitude: -74.0059731         , latitude: 40.7143528 }, # USA
  { name: 'New Haven',        longitude: -72.925663          , latitude: 41.307830 }, # USA
]);

post_waypoints = Waypoint.create([
  { name: 'Bangkok',          longitude: 100.5194091796875   , latitude: 13.7313809749427  }, # Thailand 
  { name: 'Chiang Mai',       longitude: 98.997802734375     , latitude: 18.79191774423445 }, # Thailand 
  { name: 'Khao Lak',         longitude: 98.24931621551514   , latitude: 8.645262272109393 }, # Thailand 

  { name: 'Sydney',           longitude: 151.19384765625     , latitude: -33.86129311351552 }, # Australia
  { name: 'Melbourne',        longitude: 144.9700927734375   , latitude: -37.818463195113296 }, # Australia
  { name: 'Alice Springs',    longitude: 133.88061140000002  , latitude: -23.7002104 }, # Australia
  { name: 'Darwin',           longitude: 130.84177720000002  , latitude: -12.4628271 }, # Australia
  { name: 'Cairns',           longitude: 145.77085239999997  , latitude: -16.9203287 }, # Australia

  { name: 'Moskau',           longitude: 37.6173             , latitude: 55.755826 }, # Russia
  { name: 'Sankt Petersburg', longitude: 30.335098600000038  , latitude: 59.9342802 }, # Russia

  { name: 'New York City',    longitude: -74.0059731         , latitude: 40.7143528 }, # USA
  { name: 'New Haven',        longitude: -72.925663          , latitude: 41.307830 }, # USA
  
  { name: 'San Francisco',    longitude: -122.41941550000001 , latitude: 37.7749295 }, # USA
  { name: 'Chicago',          longitude: -87.62979819999998  , latitude: 41.8781136 }, # USA
  { name: 'New Orleans',      longitude: -90.0715323         , latitude: 29.95106579999999 }, # USA
  { name: 'Miami',            longitude: -80.22643929999998  , latitude: 25.7889689 }, # USA
  { name: 'Las Vegas',        longitude: -115.23834850000003 , latitude: 36.255123 } # USA
]);

journey_routes_wp_orders = RouteWaypointOrder.create([
  { order: 0, route_id: journey_routes[0].id, waypoint_id: journey_waypoints[0].id },
  { order: 0, route_id: journey_routes[1].id, waypoint_id: journey_waypoints[1].id },
  { order: 0, route_id: journey_routes[2].id, waypoint_id: journey_waypoints[2].id },
  { order: 0, route_id: journey_routes[3].id, waypoint_id: journey_waypoints[3].id },
  { order: 0, route_id: journey_routes[3].id, waypoint_id: journey_waypoints[4].id }
]);

post_routes_wp_orders = RouteWaypointOrder.create([
  { order: 0, route_id: post_routes[0].id, waypoint_id: post_waypoints[0].id }, # Thailand 
  { order: 1, route_id: post_routes[0].id, waypoint_id: post_waypoints[1].id }, # Thailand 
  { order: 2, route_id: post_routes[0].id, waypoint_id: post_waypoints[2].id }, # Thailand 
  { order: 3, route_id: post_routes[0].id, waypoint_id: post_waypoints[0].id }, # Thailand 

  { order: 0, route_id: post_routes[1].id, waypoint_id: post_waypoints[3].id }, # Australia 
  { order: 1, route_id: post_routes[1].id, waypoint_id: post_waypoints[4].id }, # Australia 
  { order: 2, route_id: post_routes[1].id, waypoint_id: post_waypoints[5].id }, # Australia 
  { order: 3, route_id: post_routes[1].id, waypoint_id: post_waypoints[6].id }, # Australia 
  { order: 4, route_id: post_routes[1].id, waypoint_id: post_waypoints[7].id }, # Australia 
  
  { order: 0, route_id: post_routes[2].id, waypoint_id: post_waypoints[8].id }, # Russia 
  { order: 0, route_id: post_routes[3].id, waypoint_id: post_waypoints[9].id }, # Russia 
  
  { order: 0, route_id: post_routes[4].id, waypoint_id: post_waypoints[10].id }, # USA East Coast 
  { order: 1, route_id: post_routes[4].id, waypoint_id: post_waypoints[11].id }, # USA East Coast 

  { order: 0, route_id: post_routes[5].id, waypoint_id: post_waypoints[12].id }, # USA West Coast 
  { order: 1, route_id: post_routes[5].id, waypoint_id: post_waypoints[13].id }, # USA West Coast 
  { order: 2, route_id: post_routes[5].id, waypoint_id: post_waypoints[14].id }, # USA West Coast 
  { order: 3, route_id: post_routes[5].id, waypoint_id: post_waypoints[15].id }, # USA West Coast 
  { order: 4, route_id: post_routes[5].id, waypoint_id: post_waypoints[16].id }, # USA West Coast 
  { order: 7, route_id: post_routes[5].id, waypoint_id: post_waypoints[12].id } # USA West Coast 
]);


user = User.new
user.email = 'change_email@example.com'
user.password = 'change_pwd'
user.password_confirmation = 'change_pwd'
user.save!
