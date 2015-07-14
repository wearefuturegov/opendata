require 'open-uri'
require 'csv'

# Note: PopulationMetrics and FundVerticals are hard coded in seeds.rb
# as only available in PDF format (Devon MPS2011)

namespace :import do

  desc 'Import population data'
  # Sources:
  # http://www.ons.gov.uk/ons/publications/re-reference-tables.html?edition=tcm%3A77-335242
  # http://www.ons.gov.uk/ons/rel/snpp/sub-national-population-projections/2012-based-projections/rft-open-population-las.zip
  # All local authorities: 2012 SNPP Population [females|males].csv
  task :populations => :environment do

    # Devon Population Predicted by Gender - Female.csv
    # Devon Population Predicted by Gender - Male.csv

    # Population.create({
    #     area: devon,
    #     audience: carer,
    #     gender: "female",
    #     date: Date.parse('01-01-2015'),
    #     count: 365900
    # })
  end

  desc 'Import Residential Care data'
  # Residential Care data
  # devon_resnurs_model_july2014-201503-19-clean.csv
  # Home Vacancies data
  # devon_home_vacancies-2015-03-17-clean.csv
  # CQC Compliance data
  # devon_mi_cqc_compliance-2015-02-01-clean.csv
  # DTOC data'
  # devon_dtoc_december_2014_all-2015-03-19-clean.csv
  task :residential_care_placements => :environment do

  end

end
