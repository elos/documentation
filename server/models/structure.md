Structure
---------

The elos model structure is, at first, non-intuitive.

There is an elos models package, which only manages the serialization of models. It is very general and abstract and knows nothing of the individual models relationships.

### Individual Models

#### Type File (type.go)

The type file of a models individual model contains three sub-categories. The model's definition, it's constructors and it's type methods. Remember that go is _not_ object oriented. There is no "class" or "object." The being so, we can still think about functions that are members of the type package, but do not act specifically on an instance of a model as being class methods. In Java, we use the term static. The general rule: these methods do not act strictly on an instance of the model type. But they do deal with instances of the models.

##### Definition

In the definition subsection of a model's type file there is the db.Kind definition. This is the "name" of the model, it is also known as the json_string (for serialization), collection name (for mongo storage) or table name (for relational storage). The models type definition is also here - it is always a subtype of a go struct. See elos' data documentation(link needed) for the official specification of a model's data, ultimately the go code is an _implementation_ of this spec.

##### Constructors

The Constructors section of the type file is generally self-explanatory. It normally consists of a New() function which will return an empty instance of the model type. It also consists of a Create() function whose parameters generally vary, but include the necessary constituent parts to "create" a new version of the model. Specifically, the create method **saves** the newly _created_ record. This is a huge distinction, New simply instantiates the model in memory for go, Create will persist it to the current database system.

##### Type Methods

As mentioned earlier type methods can be considered a static methods or class methods. I defer to the name type methods because it ultimately acts on the go "type." Currently there is atrocious duplication of these type methods and I am working to resolve this issue. Basically, the user.Find explicitly looks for users whereas the event.Find explicitly looks fors events. There might be a better abstraction here.


#### Instance File (instance.go)

The functions contained in this file are, in object-oriented parlance, _instance_ methods. In more idiomatic go terminology, they are functions which act specificically on an instance of the model's type.

This is where the models Save(), Concerned(), Link(), and GetLink() methods are defined. Each of these is necessary to fulfill the db.Model interface.

#### Selectors File (selectors.go)

The name says it here, these functions select particular pieces of information from the model. The only required selectors are GetId(), SetId(), and the oddly named Kind(). Kind is not GetKind() because, well I don't know. I think it's because go doesn't let you specifiy interfaces based on property definitions or something so I had to do it and maybe I did it before I realized it should be GetKind.... I don't know right now.
