class CreateCareHomes < ActiveRecord::Migration
  def change
    create_table :care_homes do |t|
      t.integer :area_id, null: false
      t.string :cqc_location_uid, null: false
      t.text :name, null: false
      t.string :town, null: false
      t.string :postcode, null: false
      t.boolean :nursing_care, null: false, default: false
      t.boolean :residential, null: false, default: false
      t.boolean :all_care, null: false, default: false
      t.boolean :dementia_care, null: false, default: false
      t.boolean :learning_disabilities_care, null: false, default: false
      t.boolean :mental_health_care, null: false, default: false

      t.timestamps null: false
    end

    add_index :care_homes, :area_id
    add_index :care_homes, :cqc_location_uid, unique: true
  end
end
