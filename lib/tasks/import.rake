require 'open-uri'
require 'csv'

# Note: PopulationMetrics and FundVerticals are hard coded in seeds.rb
# as only available in PDF format (Devon MPS2011)

namespace :import do

  desc 'Import population data'
  # Past, current and predictad populations. Source:
  # http://www.ons.gov.uk/ons/publications/re-reference-tables.html?edition=tcm%3A77-335242
  # http://www.ons.gov.uk/ons/rel/snpp/sub-national-population-projections/2012-based-projections/rft-open-population-las.zip
  task :populations => :environment do

    # Filter national data source by Devon districts
    devon_districts = ["Exeter", "East Devon", "Mid Devon", "North Devon", "Torridge", "West Devon", "South Hams", "Teignbridge", "Plymouth", "Torbay"]

    # Sources manually downloaded and stored in lib/tasks/data/2012 SNPP Population [females|males].csv
    female_csv_text = File.read('lib/tasks/data/2012 SNPP Population females.csv')
    female_csv = CSV.parse(female_csv_text, :headers => true)

    # Parse to [:year, :count]
    female_years = (2012...2037)
    female_counts = Hash[*(2012...2038).map {|k| [k, 0.to_f]}.flatten]
    female_csv.each do |row|
      population = row.to_hash
      if devon_districts.include?(population["areaname"]) && (population["AgeGroup"] == "90 and over" || population["AgeGroup"].to_i == 65)
        population.each do |key, value|
          if female_years.include?(key.to_i)
            female_counts[key] = female_counts[key.to_i] + value.to_f
          end
        end
      end
    end

    puts female_counts.inspect

    #Population.create({
    #  area: Area.find_by_name("Devon"),
    #  audience: Audience.find_by_title("65+ year olds"),
    #  gender: "female",
    #  date: Date.parse('01-01-2015'),
    #  count: 365900
    #})

  end

  desc 'Import care placement data'
  # Residential Care data
  # devon_resnurs_model_july2014-201503-19-clean.csv
  # Home Vacancies data
  # devon_home_vacancies-2015-03-17-clean.csv
  # CQC Compliance data
  # devon_mi_cqc_compliance-2015-02-01-clean.csv
  # DTOC data'
  # devon_dtoc_december_2014_all-2015-03-19-clean.csv
  task :care_placements => :environment do
    # No models exist, need to work out how to shape
    # this based on wireframes
  end

end
