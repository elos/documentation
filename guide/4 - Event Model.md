Event Model
-----------

One of the pillars of the elos system is that it establishes an event stream which carries information about your life. The event model for elos follows:

### Definition

#### The Models

These definitions are in the form of the [metis data model](./2 - Data Model.md). All models are assumed to have an id trait and the [bookkeeping traits](./2 - Data Model.md#effective-bookkeeping). Note that all models are also [property](3 - Access Control.md), in the elos access control defintion, via their respective owner relation definitions.

##### Quantity

    Kind: 'quantity'
    Space: Quantities
    Domain: { 'quantities' }
    Traits: { ('value', Floats), ('unit', Strings) }
    Relations: { ('owner', Users) }
    
A quantity is related to an event allows us to visualize trends graphically. Examples of quantities range from (10, 'pushups') to (3.4, 'miles), to (390, "calories").

##### Note

    Kind: 'note'
    Space: Notes
    Domain: { 'notes' }
    Traits: { ('text', String)
    Relations: { ('owner', Users) }

Notes are unstructured text that a user can attach to an event.

##### Location

    Kind: 'location'
    Space: Locations
    Domain: { 'locations' }
    Traits: { ('latitude', Floats), ('longitude', Floats), ('altitude', Floats) }
    Relations: { ('owner', Users) }
    
A location represents, of course, a three coordinate representation of the location an event occured.

##### Tags

    Kind: 'tag'
    Space: Tags
    Domain: { 'tags' }
    Traits: { ('name', Strings) }
    Relations: { ('owner', Users), ('events', Events) }

A tag is analogous to a [context](./2 - Access Control.md#context). Why not just use a list of string primitives on the event model? Well, we know that tags will be heavily queried, so we treat them as a separate model that can serve as a sort of index for going from tag -> event that doesn't require checking the list of tags on every event in the system.

This illustrates an important component of the elos event system, it's data is constructed and aggregated as we go. Sure, ad-hoc queries are nice, but if we can predict what some of these classifications will be, we can aggregate them as we go.

##### Media

    Kind: 'media'
    Space: 'Medias'
    Domain: { 'medias' }
    Traits: { ('content', Bytes), ('codec', Strings) }
    Relations: { ('owner', Users) }
    
Media is any sort of binary blob which can be interpreted. Common examples include an image or a video. Maybe you are taking images of a wound to see that it is healing well. 

The 'codec' trait is narrowed to a subset, C of Strings. C defines the valid codecs. Currently,

    C := { 'png', 'mp4' }

##### Event

    Kind: 'event'
    Space: Events
    Domains: { 'events' }
    Traits: { ('name', Strings), ('time', Dates) }
    Relations: { ('owner', Users), ('prior', Events), ('quantity', Quantities), ('note', Notes),
                 ('location', Location), ('tags', Tags), ('media', Medias) }

This model is the composition of each we have enumerated thus far. It has arbitrary human-readable string name. It also a time, which does not necessarily equal the date at which it was created. An event can point to a parent event.

             /-- C       
            /
    A <-- B 
            \
             \-- D
             
    A has no prior. B's prior is A. C and D's prior is B.
