Event Model
-----------

One of the pillars of elos is that is establishes streams of events (data) that carry the requisite information about your life. The event model for elos follows:

### Definition

#### The Models

These definitions are via the [metis data model](./2 - Data Model.md). All models are assumed to have an id and the [bookkeeping traits](./2 - Data Model.md#effective-bookkeeping). Note that all models are also [property](3 - Access Control.md), via their respective owner relation definitions.

##### Quantity

    Kind: 'quantity'
    Space: Quantities
    Domain: { 'quantities' }
    Traits: { ('value', Floats), ('unit', Strings) }
    Relations: { ('owner', Users) }

##### Note

    Kind: 'note'
    Space: Notes
    Domain: { 'notes' }
    Traits: { ('text', String)
    Relations: { ('owner', Users) }

##### Location

    Kind: 'location'
    Space: Locations
    Domain: { 'locations' }
    Traits: { ('latitude', Floats), ('longitude', Floats), ('altitude', Floats) }
    Relations: { ('owner', Users) }

##### Tags

    Kind: 'tag'
    Space: Tags
    Domain: { 'tags' }
    Traits: { ('name', Strings) }
    Relations: { ('owner', Users), ('events', Events) }

##### Media

    Kind: 'media'
    Space: 'Medias'
    Domain: { 'medias' }
    Traits: { ('content', Bytes), ('codec', Strings) }
    Relations: { ('owner', Users) }

##### Event

    Kind: 'event'
    Space: Events
    Domains: { 'events' }
    Traits: { ('name', Strings), ('time', Dates) }
    Relations: { ('owner', Users), ('prior', Events), ('quantity', Quantities), ('note', Notes),
                 ('location', Location), ('tags', Tags), ('media', Medias) }
