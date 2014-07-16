class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.date :date
      t.string :text
      t.boolean :draft

      t.timestamps
    end
  end
end
