class AddShowOnOverviewToWaypoints < ActiveRecord::Migration
  def change
    add_column :waypoints, :show_on_overview, :boolean
  end
end
