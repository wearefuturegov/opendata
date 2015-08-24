class CreateCareHomeMetrics < ActiveRecord::Migration
  def change
    create_table :care_home_metrics do |t|
      t.integer :care_home_id, null: false
      t.date :collection_date
      t.integer :capacity
      t.integer :residential_vacancies
      t.integer :nursing_vacancies
      t.integer :short_stay_vacancies
      t.date :vacancy_update_date

      t.timestamps null: false
    end

    add_index :care_home_metrics, :care_home_id
  end
end
