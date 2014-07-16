class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :author
      t.references :post, index: true

      t.timestamps
    end
  end
end
