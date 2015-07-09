class CreatePopulations < ActiveRecord::Migration
  def change
    create_table :populations do |t|
      t.date :date
      t.integer :gender
      t.integer :count
      t.references :audience
      t.references :area
      t.timestamps null: false
    end
    remove_column :areas, :total_population, :integer
    remove_column :areas, :total_population_male, :integer
    remove_column :areas, :total_population_female, :integer
  end
end
