# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

audiences = Audience.create([{ title: '18-65' }, { title: '65+' }, { title: 'Carers' }])

Area.create([
  { name: 'Devon', audiences: audiences }, 
  { name: 'Kingston', audiences: audiences }, 
  { name: 'Sutton', audiences: audiences }
])
