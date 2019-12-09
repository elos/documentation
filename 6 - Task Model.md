Task Model
----------

Tasks allow us to model things we need to do.

### Definition

#### The Models

These definitions are in the form of the [metis data model](./2 - Data Model.md). All models are assumed to have an id trait and the [bookkeeping traits](./2 - Data Model.md#effective-bookkeeping). Note that all models are also [property](3 - Access Control.md), in the elos access control defintion, via their respective owner relation definitions.

##### Task

    Kind: 'task'
    Space: Tasks
    Domain: { 'tasks' }
    Traits: { ('name', Strings), ('deadline', Dates), ('stages', Lists<Date>),
              ('completed_at', Dates) }
    Relations: { ('owner', Users), ('prerequisites', Tasks), ('tags', Tags) }
