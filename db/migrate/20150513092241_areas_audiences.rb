class AreasAudiences < ActiveRecord::Migration
  def change
    create_table :areas_audiences do |t|
      t.references :area
      t.references :audience
    end
  end
end
