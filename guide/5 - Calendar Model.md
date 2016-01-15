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
    
A calendar contains the structures for completely defining a user's events and appointments indefinitely. It chooses fixtures from the base schedule, from the appropriate weekday schedule, and from the appropriate yearday schedule.

##### Schedule

    Kind: 'schedule'
    Space: Schedules
    Domain: { 'schedules' }
    Traits: { ('name', Strings), ('start_time', Dates), ('end_time', Dates) }
    Relations: { ('owner', Users), ('fixtures', Fixtures) }
    
A schedule is a composition of fixtures.

##### Fixture

    Kind: 'fixture'
    Space: Fixtures
    Domain: { 'fixtures' }
    Traits: { ('name', Strings), ('start_time', Dates), ('end_time', Dates), ('rank', Integers), 
              ('label', Booleans), ('expires_at', Dates), ('exceptions', []Dates)
    Relations: { ('owner', Users), ('note, Notes) }
    
A fixture is the building block of the elos calendar model. A fixture is a named block of time. A fixture can, however, be composed onto a schedule in order to be used in repetition. 

On the one hand, a a fixture could appear on a schedule, and therefore manifest repeatedly on a elysian's calendar, then the fixture can be thought of more expressly as an archetype for events.

On the other hand, consider the familiar case of adding a singular appointment to your calendar. This fixture would be added to the yearday schedule corresponding the date of the appointment, and the expiration date would be set for the end time. This fixture would therefore only appear once.
