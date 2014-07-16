class CreateMarkerBinaries < ActiveRecord::Migration
  def change
    create_table :marker_binaries do |t|
      t.string :color
      t.binary :image

      t.timestamps
    end
  end
end
