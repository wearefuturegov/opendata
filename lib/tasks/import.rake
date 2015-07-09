require 'open-uri'
require 'csv'

# Note: PopulationMetrics and FundVerticals are hard coded in seeds.rb
# as only available in PDF format (Devon MPS2011)

namespace :import do

  desc 'Import population data'
  # Source
  # http://www.ons.gov.uk/ons/publications/re-reference-tables.html?edition=tcm%3A77-335242
  # http://www.ons.gov.uk/ons/rel/snpp/sub-national-population-projections/2012-based-projections/rft-open-population-las.zip
  task :populations => :environment do
    # Population.create({
    #     area: devon,
    #     audience: carer,
    #     gender: "female",
    #     date: Date.parse('01-01-2015'),
    #     count: 365900
    # })
  end

  desc 'Import Residential Care data'
  task :residential_care => :environment do

  end

  desc 'Import Home Vacancies data'
  task :home_vacancies => :environment do

  end

  desc 'Import CQC Compliance data'
  task :cqc_compliance => :environment do

  end

  desc 'Import DTOC data'
  task :dtoc => :environment do

  end

end
