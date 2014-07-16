class AddUrlSeedToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :url_seed, :string
  end
end
