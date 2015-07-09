class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.date :date
      t.integer :count
      t.string :title
      t.references :area
      t.references :audience
      t.timestamps
    end
  end
end
