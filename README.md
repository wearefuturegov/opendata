# Local Care Market

Usual dev stack, static data created by seed file, monthly data can be imported using:

```
rake import:residential_care
rake import:home_vacancies
rake import:cqc_compliance
rake import:dtoc
```

You'll need to setup a worker to run these at whatever interval councils have agreed to publish the data. Currently only indexing Devon.

Details of remote sources can be found in `lib/tasks/import.rake`
