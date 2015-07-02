class AddStatusToArea < ActiveRecord::Migration
  def change
    add_column :areas, :live, :boolean, :default => false
  end
end
