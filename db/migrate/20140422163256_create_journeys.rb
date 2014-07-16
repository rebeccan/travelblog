class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.string :title
      t.date :start
      t.date :end
      t.text :text
      t.boolean :public
      t.string :password
      t.string :marker_color

      t.timestamps
    end
  end
end
