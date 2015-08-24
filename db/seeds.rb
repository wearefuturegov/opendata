# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

elderly = Audience.create({ title: '65+ year olds' })
young = Audience.create({ title: '18-65 year olds' })
carer = Audience.create({ title: 'Carers' })

audiences = young, elderly, carer

devon = Area.find_or_create_by(name: "Devon") do |area|
  area.audiences = audiences
  area.live = true
end
kingston = Area.find_or_create_by(name: "Kingston") do |area|
  area.audiences = audiences
end
sutton = Area.find_or_create_by(name: "Sutton") do |area|
  area.audiences = audiences
end

# From MPS2011 document (PDF)
PopulationMetric.create([
  {
    audience: elderly,
    area: devon,
    title: "Dementia care need",
    count: 12531,
    date: Date.parse('01-01-2010')
  },
  {
    audience: elderly,
    area: devon,
    title: "Dementia care need",
    count: 14110,
    date: Date.parse('01-01-2015')
  },
  {
    audience: elderly,
    area: devon,
    title: "Dementia care need",
    count: 16189,
    date: Date.parse('01-01-2020')
  },
  {
    audience: elderly,
    area: devon,
    title: "Dementia care need",
    count: 19061,
    date: Date.parse('01-01-2025')
  },
  {
    audience: elderly,
    area: devon,
    title: "People with a limiting long-term illness",
    count: 70248,
    date: Date.parse('01-01-2010')
  },
  {
    audience: elderly,
    area: devon,
    title: "People with a limiting long-term illness",
    count: 80905,
    date: Date.parse('01-01-2015')
  },
  {
    audience: elderly,
    area: devon,
    title: "People with a limiting long-term illness",
    count: 89957,
    date: Date.parse('01-01-2020')
  },
  {
    audience: elderly,
    area: devon,
    title: "People with a limiting long-term illness",
    count: 101241,
    date: Date.parse('01-01-2025')
  },
  {
    audience: elderly,
    area: devon,
    title: "People unable to manage at least one personal care task",
    count: 57978,
    date: Date.parse('01-01-2010')
  },
  {
    audience: elderly,
    area: devon,
    title: "People unable to manage at least one personal care task",
    count: 66046,
    date: Date.parse('01-01-2015')
  },
  {
    audience: elderly,
    area: devon,
    title: "People unable to manage at least one personal care task",
    count: 74242,
    date: Date.parse('01-01-2020')
  },
  {
    audience: elderly,
    area: devon,
    title: "People unable to manage at least one personal care task",
    count: 84401,
    date: Date.parse('01-01-2025')
  },
  {
    audience: elderly,
    area: devon,
    title: "People unable to manage at least one domestic care task",
    count: 70543,
    date: Date.parse('01-01-2010')
  },
  {
    audience: elderly,
    area: devon,
    title: "People unable to manage at least one domestic care task",
    count: 80247,
    date: Date.parse('01-01-2015')
  },
  {
    audience: elderly,
    area: devon,
    title: "People unable to manage at least one domestic care task",
    count: 90678,
    date: Date.parse('01-01-2020')
  },
  {
    audience: elderly,
    area: devon,
    title: "People unable to manage at least one domestic care task",
    count: 103243,
    date: Date.parse('01-01-2025')
  },
  {
    audience: young,
    area: devon,
    title: "People with a moderate or severe learning disability",
    count: 2409,
    date: Date.parse('01-01-2010')
  },
  {
    audience: young,
    area: devon,
    title: "People with a moderate or severe learning disability",
    count: 2431,
    date: Date.parse('01-01-2015')
  },
  {
    audience: young,
    area: devon,
    title: "People with a moderate or severe learning disability",
    count: 2483,
    date: Date.parse('01-01-2020')
  },
  {
    audience: young,
    area: devon,
    title: "People with a moderate or severe learning disability",
    count: 2550,
    date: Date.parse('01-01-2025')
  },
  {
    audience: young,
    area: devon,
    title: "People with moderate physical disability",
    count: 37417,
    date: Date.parse('01-01-2010')
  },
  {
    audience: young,
    area: devon,
    title: "People with moderate physical disability",
    count: 37346,
    date: Date.parse('01-01-2015')
  },
  {
    audience: young,
    area: devon,
    title: "People with moderate physical disability",
    count: 38488,
    date: Date.parse('01-01-2020')
  },
  {
    audience: young,
    area: devon,
    title: "People with moderate physical disability",
    count: 39242,
    date: Date.parse('01-01-2025')
  },
  {
    audience: young,
    area: devon,
    title: "People with a severe physical disability",
    count: 11579,
    date: Date.parse('01-01-2010')
  },
  {
    audience: young,
    area: devon,
    title: "People with a severe physical disability",
    count: 11428,
    date: Date.parse('01-01-2015')
  },
  {
    audience: young,
    area: devon,
    title: "People with a severe physical disability",
    count: 11914,
    date: Date.parse('01-01-2020')
  },
  {
    audience: young,
    area: devon,
    title: "People with a severe physical disability",
    count: 12298,
    date: Date.parse('01-01-2025')
  },
  {
    audience: young,
    area: devon,
    title: "People with a moderate or severe personal care disability",
    count: 23045,
    date: Date.parse('01-01-2010')
  },
  {
    audience: young,
    area: devon,
    title: "People with a moderate or severe personal care disability",
    count: 22902,
    date: Date.parse('01-01-2015')
  },
  {
    audience: young,
    area: devon,
    title: "People with a moderate or severe personal care disability",
    count: 23782,
    date: Date.parse('01-01-2020')
  },
  {
    audience: young,
    area: devon,
    title: "People with a moderate or severe personal care disability",
    count: 24731,
    date: Date.parse('01-01-2025')
  },
  {
    audience: young,
    area: devon,
    title: "People with a mental health problem",
    count: 71733,
    date: Date.parse('01-01-2010')
  },
  {
    audience: young,
    area: devon,
    title: "People with a mental health problem",
    count: 71851,
    date: Date.parse('01-01-2015')
  },
  {
    audience: young,
    area: devon,
    title: "People with a mental health problem",
    count: 72733,
    date: Date.parse('01-01-2020')
  },
  {
    audience: young,
    area: devon,
    title: "People with a mental health problem",
    count: 73777,
    date: Date.parse('01-01-2025')
  }
])

# From PSS-EX1 (not cleansed or automated, could be...)
FundVertical.create([
  {
    audience: elderly,
    area: devon,
    title: "Nursing care placements",
    council_spend: 15870000
  },
  {
    audience: elderly,
    area: devon,
    title: "Residential care placements",
    council_spend: 86510000
  },
  {
    audience: elderly,
    area: devon,
    title: "Home care",
    council_spend: 25760000
  },
  {
    audience: elderly,
    area: devon,
    title: "Day Care / Day Services",
    council_spend: 6150000
  },
  {
    audience: elderly,
    area: devon,
    title: "Direct Payments",
    council_spend: 6610000
  },
  {
    audience: elderly,
    area: devon,
    title: "Equipment and adaptations",
    council_spend: 1770000
  },
  {
    audience: elderly,
    area: devon,
    title: "Meals",
    council_spend: 1240000
  }
])
