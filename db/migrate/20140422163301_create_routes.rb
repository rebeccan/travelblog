class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :travel_mode
      t.boolean :show_on_overview


      t.integer :route_able_id
      t.string  :route_able_type


      t.timestamps
    end
  end
end
