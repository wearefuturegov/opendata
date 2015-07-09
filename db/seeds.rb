# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

young = Audience.create({ title: '18-65 year olds' })
elderly = Audience.create({ title: '65+ year olds' })
carer = Audience.create({ title: 'Carers' })

devon = Area.create({ name: 'Devon', audiences: audiences, live: true })
kingston = Area.create({ name: 'Kingston', audiences: audiences })
sutton = Area.create({ name: 'Sutton', audiences: audiences })
