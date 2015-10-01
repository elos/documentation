Calendar Model
--------------

We structure time into calendrical systems. Elos models time formally based on these well-known constructs. However the elos calendar model introduces another level of abstraction beyond the modular cycle of days, months and years.

### Definition

#### The Models

These definitions are in the form of the [metis data model](./2 - Data Model.md). All models are assumed to have an id trait and the [bookkeeping traits](./2 - Data Model.md#effective-bookkeeping). Note that all models are also [property](3 - Access Control.md), in the elos access control defintion, via their respective owner relation definitions.

##### Calendar

    Kind: 'calendar'
    Space: Calendars
    Domain: { 'calendars' }
    Traits: { ('name', Strings), ('weekday_schedules', Maps<String, ID>), 
              ('yearday_schedules', Maps<String, ID>) }
    Relations: { ('owner', Users), ('base_schedule', Schedules), ('manifest_fixture', Fixtures) }

##### Schedule

    Kind: 'schedule'
    Space: Schedules
    Domain: { 'schedules' }
    Traits: { ('name', Strings), ('start_time', Dates), ('end_time', Dates) }
    Relations: { ('owner', Users), ('fixtures', Fixtures) }

##### Fixture

    Kind: 'fixture'
    Space: Fixtures
    Domain: { 'fixtures' }
    Traits: { ('name', Strings), ('start_time', Dates), ('end_time', Dates), ('rank', Integers), 
              ('label', Booleans), ('expires_at', Dates), ('exceptions', []Dates)
    Relations: { ('owner', Users), ('note, Notes) }
