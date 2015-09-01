require 'open-uri'
require 'csv'

# Note: PopulationMetrics and FundVerticals are hard coded in seeds.rb
# as only available in PDF format (Devon MPS2011)

namespace :import do

  desc 'Import population data'
  # Past, current and predictad populations. Source:
  # http://www.ons.gov.uk/ons/publications/re-reference-tables.html?edition=tcm%3A77-335242
  # http://www.ons.gov.uk/ons/rel/snpp/sub-national-population-projections/2012-based-projections/rft-open-population-las.zip
  # Sources manually downloaded and stored in db/data/2012 SNPP Population [females|males].csv
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
      CSV.foreach("db/data/%s" % name, headers: true) do |row|
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

  task :care_homes do
    raise ArgumentError, "Please specify CQC_SOURCE as path to data." if ENV["CQC_SOURCE"].nil?

    booleanize = ->(val) { return true if val == "Y"; return false if val == "N"; return val }
    devon = Area.where(name: "Devon").first
    ActiveRecord::Base.transaction do
      CSV.foreach(ENV["CQC_SOURCE"], headers: true, converters: booleanize) do |row|
        CareHome.create!(area: devon,
                         cqc_location_uid: row.fetch("location_id"),
                         name: row.fetch("name"),
                         town: row.fetch("town"),
                         postcode: row.fetch("provider_postcode"),
                         nursing_care: row.fetch("nursing_flag"),
                         residential: row.fetch("residential_flag"),
                         all_care: row.fetch("all_care_flag"),
                         dementia_care: row.fetch("dementia"),
                         learning_disabilities_care: row.fetch("learning_disabilities_or_autistic_spectrum_disorder"),
                         mental_health_care: row.fetch("mental_health"))
      end
    end
  end

  task :care_home_metrics do
    raise ArgumentError, "Please specify CQC_SOURCE as path to data." if ENV["CQC_SOURCE"].nil?
    raise ArgumentError, "Please specify HOME_VACANCIES_SOURCE as path to data." if ENV["HOME_VACANCIES_SOURCE"].nil?

    devon = Area.where(name: "Devon").first
    ActiveRecord::Base.transaction do
      CSV.foreach(ENV["CQC_SOURCE"], headers: true) do |row|
        home = CareHome.find_by!(cqc_location_uid: row.fetch("location_id"))
        home.metrics.create!(capacity: row.fetch("capacity"))
      end
    end
    ActiveRecord::Base.transaction do
      CSV.foreach(ENV["HOME_VACANCIES_SOURCE"], headers: true) do |row|
        begin
          home = CareHome.find_by!(cqc_location_uid: row.fetch("cqc_location_id"))
          home.metrics.first.update_attributes!(residential_vacancies: row.fetch("no_of_residential_vacancies").to_i,
                                                nursing_vacancies: row.fetch("no_of_nursing_vacancies").to_i,
                                                short_stay_vacancies: row.fetch("no_of_short_stay_vacancies").to_i,
                                                vacancy_update_date: row["date_vacancies_were_updated"].to_s.strip != "" ? Date.parse(row["date_vacancies_were_updated"]) : nil)
        rescue ActiveRecord::RecordNotFound => e
          puts e.inspect, row.inspect
        rescue ArgumentError => e
          puts e.inspect, row.inspect
        end
      end
    end
  end

end
