# Local Care Market

Usual dev stack, static data created by seed file, monthly data can be imported using:

```
rake import:care_placements
```

You'll need to setup a worker to run this at whatever interval councils have agreed to publish the data. Currently only indexing Devon.

Details of remote sources can be found in `lib/tasks/import.rake`

## Models

There is a vast amount of data from myriad sources used for this prototype. We have attempted to abstract this to the following app-specific nomenclature. Import scripts should import data necessary for these models and nothing else.

Further source details can be found in `lib/import.rake` and `db/seeds.rb`.

### Area

Hard coded seed file, example:

```
Area.create({
  name: 'Devon',
  audiences: [hash],
  live: [boolean]
})
```

### Audience

Hard coded seed file, example:

```
Audience.create({
  title: '65+ year olds'
})
```

### Populations

Each area has basic population data stored against it, scoped by year and gender. Projections and year-on-year changes are calculated by the app using the date field.

```
rake import:populations
```

- Source data: http://www.ons.gov.uk/ons/publications/re-reference-tables.html?edition=tcm%3A77-335242
- Devon only: `db/migrate/Devon Population Predicted by Gender - [Female | Male].csv`

```
Population.create({
  area: Population.where(:name => 'devon'),
  audience: Population.where(:title => 'carer'),
  gender: "female",
  date: Date.parse('01-01-2015'),
  count: 365900
})
```

### Population Metrics

Each `population` has a number of metrics, these originate in the Market Position Statements which are only available in PDF format so have been hardcoded in a seed file for area `Devon` and audience `65+ year olds`.

As with population data, these are scoped by year so projections can be calculated.

```
PopulationMetric.create({
  audience: elderly,
  area: devon,
  title: "Dementia care need",
  count: 15870000,
  date: Date.parse('01-01-2015')
})
```

### Funding Verticals

Each `population` and `audience` has a number of `FundVertical`'s. These show council and NHS spends, trends and allow us to dive deeper into how and why funds have been allocated.

The database has been seeded using data from the Market Position Statement from  area `Devon` and audience `65+ year olds`.

```
FundVertical.create({
  audience: Audience.where(:title => '65+ year olds'),
  area: Population.where(:name => 'devon'),
  title: "Nursing care placements",
  council_spend: 15870000
})
```
