class FixSettingColumnBoolean < ActiveRecord::Migration
  def change
    rename_column :settings, :boolean, :active
  end
end
