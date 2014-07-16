class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.references :post, index: true

      t.timestamps
    end
  end
end
