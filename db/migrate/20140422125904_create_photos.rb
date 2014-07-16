class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.boolean :post_main
      t.boolean :travel_main
      t.references :gallery, index: true

      t.timestamps
    end
  end
end
