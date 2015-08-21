require 'open-uri'
require 'csv'

# Note: PopulationMetrics and FundVerticals are hard coded in seeds.rb
# as only available in PDF format (Devon MPS2011)

namespace :import do

  desc 'Import population data'
  # Past, current and predictad populations. Source:
  # http://www.ons.gov.uk/ons/publications/re-reference-tables.html?edition=tcm%3A77-335242
  # http://www.ons.gov.uk/ons/rel/snpp/sub-national-population-projections/2012-based-projections/rft-open-population-las.zip
  # Sources manually downloaded and stored in lib/tasks/data/2012 SNPP Population [females|males].csv
  task :populations => :environment do
    # Filter national data source by Devon districts
    devon_districts = Set.new(["Exeter", "East Devon", "Mid Devon", "North Devon", "Torridge", "West Devon", "South Hams", "Teignbridge", "Plymouth", "Torbay"])
    devon = Area.find_by_name("Devon")
    elderly_audience = Audience.where(title: "65+ year olds").first
    younger_audience = Audience.where(title: "18-65 year olds").first
    years = (2012..2037).map(&:to_s)
    counts = {
      "male" => { younger_audience.id => Hash.new(0), elderly_audience.id => Hash.new(0) },
      "female" => { younger_audience.id => Hash.new(0), elderly_audience.id => Hash.new(0) }
    }

    [["2012 SNPP Population males.csv", "male"], ["2012 SNPP Population females.csv", "female"]].each do |name, sex|
      CSV.foreach("lib/tasks/data/%s" % name, headers: true) do |row|
        next unless devon_districts.include?(row["areaname".freeze])
        age = row["AgeGroup".freeze].to_i
        if age >= 18 && age <= 65
          years.each do |year|
            counts[sex][younger_audience.id][year] += row[year].to_f
          end
        elsif age > 65
          years.each do |year|
            counts[sex][elderly_audience.id][year] += row[year].to_f
          end
        end
      end
    end

    # Round counts to integers
    counts.each do |sex, audiences|
      audiences.each do |audience, years|
        years.each do |year, count|
          counts[sex][audience][year] = counts[sex][audience][year].round
        end
      end
    end

    ActiveRecord::Base.transaction do
      counts.each do |sex, audiences|
        audiences.each do |audience, years|
          years.each do |year, count|
            Population.create!(
              area: devon,
              audience: Audience.find(audience),
              gender: sex,
              date: Date.parse("%s-01-01" % year),
              count: count
            )
          end
        end
      end
    end
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
