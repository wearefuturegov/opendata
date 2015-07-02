# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

audiences = Audience.create([{ title: '18-65 year olds' }, { title: '65+ year olds' }, { title: 'Carers' }])

Area.create([
  { name: 'Devon', audiences: audiences, live: true, total_population: 753200, total_population_male: 365900, total_population_female: 387200 }, 
  { name: 'Kingston', audiences: audiences, total_population: 1000000, total_population_male: 500000, total_population_female: 500000 }, 
  { name: 'Sutton', audiences: audiences, total_population: 1000000, total_population_male: 500000, total_population_female: 500000 }, 
])
