class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :type
      t.boolean :boolean
      t.string :attribute1
      t.string :attribute2

      t.timestamps
    end
  end
end
