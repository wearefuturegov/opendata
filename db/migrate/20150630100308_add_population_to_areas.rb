class AddPopulationToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :total_population, :integer
    add_column :areas, :total_population_male, :integer
    add_column :areas, :total_population_female, :integer
  end
end
