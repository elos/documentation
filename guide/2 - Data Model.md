Data Model
----------

The Metis Data Model (MDM) is a theoretical framework for defining a system of data records and their relationships. It can describe the fundamental building blocks of the elos core ontology, and even - as we will see - provides the building blocks for dynamic ontologies built on top of elos.

#### Motivation

We need to be able to persist and store structured data. If this is not something that intuitively sounds useful, think about your brain. Your brain persists information all the time, and some researchers would argue that it is in fact the brain's ability to do so which permits consciousness.

A system must maintain state, which represents the things it wants to remember or needs to rememeber in order to continue functioning. This can be everything from user information like email and password, to a history of orders and payments, to the current list of tasks on a todo list. We must be able to store this data in a structured way, and be able to retrieve it and reason about it.

We talk here about the fundamentals of persisted data structures, which we call *records* and their cookie-cutter archetypes, which we call *models*. These models compose the ontology of our system, namely the structured data which we need in order to operate. Hopefully this provides some motivation to the novice for working through the slightly abstract document which follows.

#### The Paradigm of Set Theory

It is easiest to think about metis data records as you would imagine algebraic objects. Much like in mathematics, we will define these objects and their formal properties and behaviors axiomatically. We will use the lexicon of [set theory](../theory/1 - sets.md) to talk about their relationships.

The universal set while discussing the MDM is the set of all data records, *R*. But we must now make our first distinction, that between the archtype of a record and instances of that record. You can imagine the object-oriented equivalents of a class and instance respectively. We will state axioms about record archetypes, which we will henceforth refer to as models, but we will generally state theorems about our universe of record instances. We use the terminology "theorems" because these statements are implications of our axioms.

The second distinction to be made is between different types of models. Intuitively, and formally, there is a difference between the data record which represents a task and that which represents the task list. Data records often break into discrete structures much as you define them and implemented them in a programming language. 

We refer to the different types of models by their _kind_, which we make a formal construct in the MDM.

#### Primitives vs. Structures

We need to speak at least quickly regarding the theory of information. All information can be encoded using a two digit alphabet. If this doesn't sound familiar, you can check out information theory. We will use Binary for our two digit alphabet. One way to think about it:

    Binary ≡ { B, ¬B }

So we have presence and abscence, true and false, and we will use these bits to represent all information. But our definition of binary isn't so important to our own goal as it is to the justification of the following primitive set we will define. It is so as a chemist recognizes atoms and the constituencies they form before and in justification of her ability to talk instead of molecules. Indeed we want to talk about data records, the structures (molecules) which are composed of these primitives (atoms).

The EDM uses several "primitive," data structures, and assumes they are available to the system implementation.

    Bytes    ≡ the set of all binary strings
    Booleans ≡ the set of all boolean values, {True , False}
    Integers ≡ the set of all 64-bit integers, {x ∈ ℤ |  -9223372036854775808 ≤ x ≤ 9223372036854775807}
    Floats   ≡ the set of all IEEE-754 64-bit floating-point numbers
    Strings  ≡ the set of all UTF-8 binary encoded strings
    Dates    ≡ the set of all RFC3099 binary encoded dates
    Lists    ≡ the set of all sets of mappings from Integer to Primitives
    Maps     ≡ the set of all sets of mappings from { Integer, Float, String } to Primitive
    
    and Primitives := { Booleans, Integers, Floats, Strings, Dates, Lists, Maps }
    
Note that "a set of mappings" can be thought of as a function. We avoid using the explicity term function here because it is often conflated with a physical function implementation. It is fair that indexing into an array or a map by an integer or hashable value, respectively, is equivalent to calling a function. Indeed, everything is a function. Note also that *Bytes* is isomorphic to all other primitive sets.

### Records

We defined the set of all records to be *R*. We now define the *K* to be the set of the kinds of data models we want to represent. For a simple todo app, *K* might be { 'user', 'task', 'list' }. *K* is much larger for elos, I think the cardinality now hovers around 20 -- but there is work being done to bring that number down. Note that *K* ⊂ *Strings*. It is, indeed, a proper subset. As we have defined the set *Strings* here, it is infinite (uncountable).

We have made two distinctions thus far:

 * The 'Ontic' Distinction: That between the ontology and the ontic, between the class and the instance, the model and the record, the phenomenal as opposed to the physical
 * The 'Kind' Distinction: That we want different structures of data records

We will now introduce a third distinction:

 * The 'ID' Distinction: We must be able to identify and retrieve different instances of the same model kind, we will do so with a unique independently assigned identifier

We define *I* to be the set of all ids in the system. As with *K*, *I* ⊂ *Strings*. *I* is definitely countable, in fact its cardinality is the number of records in the system.

#### Definition

So at the purest level, the metis data model uses a two-dimensional coordinate system to identify all records. Namely, the kind and id. We can partition the set of all records based on their kind, and we can identifiy a record within the space of its kind by it's id. Formally, we define these two property functions for each record:

     * Kind: R → K
     * ID:   R → I

    ∀ m, n ∈ R: (Kind(m) = Kind(n)) ⇒ (ID(m) ≠ ID(n))
    ∀ m, n ∈ R: (Kind(m) = Kind(n)) ^ (ID(m) = ID(n)) ⇒ m = n

We now define the function *Find: (K, I) → R*. We can say:

    (∀ k ∈ K, i ∈ I)(∃ r ∈ R) Find(k, i) ↦ r

Moreover, *Find* is a bijection. It's inverse is given by the tuple of the *Kind* and *ID* property functions we defined earlier. We note, here, that some databases have unique ids for _every_ record, r ∈ R. Some don't -- namely SQL. SQL databases generally use incrementing ids for each table. In SQL, a metis kind would map to a table and the id to the primary key field. This illustrates a general point, you can probably follow along with the metis system and see the connections to SQL as we go. Indeed SQL is a working implementation. We formally define these concepts here so that we can further reason and abstract them.

##### Spaces

We established that we can retrieve (*Find*) any record based on the two coordinates of a it's kind and id. Now consider the physical data records which constitute the collection instances of a particular model. We alluded earlier to our interest in partitioning these sets and reasoning about them independenty. For example, consider an ontology with *K* := { 'user', 'credential' }. Then we would want to think about the set of all "users" or "credentials" in our system. These are two disjoint sets (by definition), though they are both subsets of *R*. We want to handle various sets of records which share a "kind" independently and conveniently.

To achieve this goal, we associate with each kind a space. We define *S* to be the set of all spaces of an ontology.

    Space: K → S

    (∀ k ∈ K)(∃ s ∈ S) Space(k) → s          (surjective)
    (∀ i, j ∈ K) Space(i) = Space(j) ⇒ i = j (injective)

*Space* is another property function, but we also use the term space to refer to the set of all instances of a record of kind k. Space is also a bijection.

To further illustrate this, we can return to our example of a todo app. If we had the K := { "user", "task", "list" }, we would have the following spaces:

    U = { r ∈ R : kind(r) → "user" }
    T = { r ∈ R : kind(r) → "task" }
    L = { r ∈ R : kind(r) → "list" }

    ∴ S ≡ { U, T, L }

We would refer to U, T, L as users, tasks, and lists, respectively. The space name, because of english, is generically the plural of the kind. Ahah! Now you see the connection to database tables or collections if you didn't see it before! Or perhaps you see it more clearly. Indeed, the implementation of a todo app using the metis logical core in SQL involves a users, tasks and lists table. 

#### Traits

Now that we have an idea of the abstract nature of elos records, we can discuss their individually defining features; the primitives of which they are composed. A record's archetype is defined by the *Traits* which is has. Traits are String to Primitive key/value pairs.

    T: Strings → Primitives
    
    ∀ k ∈ K, ∃ several traits which belong to that kind
    
    Let Traits: K → (Strings, Primitives)
    
Here it is useful to think of the function *Traits* as a set of ordered pairs. As we will refer to the *Traits* of a model regularly. So a trait could be ('completed', Booleans) or ('created_at', Dates). But recall the 'Ontic' distinction. 

##### Attributes

We have the framework of traits, but each individual record will have a different value associated with each trait. We call this value the record's 'attribute.' This is implicit in our above definition because *T* is a function from *Strings*, a simple set, to *Primitives*, a set of sets.

    A_r: Traits → (P ∈ Primitives) for some r ∈ R
    
    Attributes: R  → (Traits, P ∈ Primitives)
    
    ∀ r ∈ R, |Attributes(r)| = |(Links ○ Kind)(r)|


Continuing our task list example.

    Traits('task') := { ('created_at', Dates), ('completed_at', Dates), ('name', Strings) } ≡ { t₁, t₂, t₃ }
    
    (Attributes ○ Find)('task', 1) = Attributes(Find('task', 1)) = { (t₁, '2009-11-10 23:00:00 +0000 UTC'), (t₂, '2009-11-10 23:00:00 +0000 UTC'), (t₃, 'Take out the trash')}
    
It can be nice to think of the attributes of a record as just the string to their value, and then the primitive type is implicit is that it is the superset (universe) of whichever value is given. We prefer to be explicit here.

#### Relations

At this point you may be thinking, we know about definining records as compositions of primitives, but what about relations between records. "Aren't abstraction and encapsulation important ideas?" Ha! You are right, which is why we don't have one big record which we modify, we split them up. This idea was, in a way, implicit in the fact we were talking about kinds and spaces. As soon as you have multiple kinds of records, you want to be able to model their relations. 

Graphs are beautiful data structures which appear everywhere, and indeed we have a graph. We will first formally define links and how they connect records. Then we will show that we can represent these relationships with standardized trait definitions. So links are truly an abstraction. Let's see.

Let's say we have r, s  ∈ R, and r wants to point to information encapsulated in s (So this is a directed graph indeed). Say r is a task list and s is a task. We want the task list to _have_ the task. So a nice way of thinking of it is to say that the a TaskLisk has many tasks. We have _named_ our link "tasks," and have said that it points to records in the space of Tasks. Suppose though that we want to have the currently active task on the task list. We want to say that a TaskLisk has one current task. Is this fundamentally different than saying that TaskList has many tasks? Indeed it is. Because appending to a set is a fundamentally different operation than replacing a task. We introduced the latter with the implicity constraint that you could only have _one_ "current task." Formally, we can generalize our: notion of a one-link and multi-link to

    R: Strings → K'
    
    Relations: K → (Strings, K')
    
    ∀ k ∈ K, |Relations(k)| ≥ 0

We call *K'* the codomain the of the relation. The domain of the relation is *K*. Note that it is entirely possible that *K = K'*. That would be a recursive data structure.

Now recall the ontic distinction. With traits we defined the concept of an attribute as their physical manifestion. The physical manifestation of a relation is a link. We stated earlier that we need two-coordinates to identify all records in the system. The kind and id. We have only captured the kind. But we have associated each kind with a space. As we had *Primitives* as a set of sets,  K can likewise be thought of as a set of a sets.

##### Links

The component which varied when we discussed traits was the value within the trait's domain that varied. What date was the record created, is the task completed? The component which varies with links is the id of the other records. Indeed we could also carry dynamically the kind of the other record, but since we define that along with the record, and since it is invariant, it can be thought of as an immediate and therefore a component of the implementation -- not of the dynamic storage itself. We have a second variation, that of a one-link vs. a mul-link. A one-link maps to a single id whereas a multi-link maps to a list of ids. We require this distinction because replacement is not fundamentally equivalent to concatenation. We define a link, L:

    L: Relations → I or []I
    
    Links: R → (Relations,  I or []I))
    
    ∀ r ∈ R, |Links(r)| = |(Relations ○ Kind)(r)|
    
#### Relation-Trait & Link-Attribute Isomorphism 

We mentioned earlier that a link has several components, it's size, it's codomain, it's name and it's actual value, but that it could still be treated as a trait. The obvious question is, if a Link needs 4 "bits" of information to be fully understood, then why doesn't one link abstraction yield four traits. Well, at the static elos data model level, these bits of information can be encoded programmatically. They are immediates. Because the name of a link, it's size and it's codomain are known and are invariant, we need not make them a part of our dynamic record. They are constant.

If you stored those 4 pieces of information on the model you would still have to implement the procedure in which you go about retrieving the corresponding records. This routine effectively reduces an algorithm, and so at the actual representation level, if we have the archetype abstraction of knowing that a TaskList's "tasks" trait is multiple, and that the codomain is "task," then we need only store the trait "tasks" -> []id. We know to interpret these ids as tasks.

To prove our point, note that *I ⊂ Strings* and therefore *[]I* is eqivalent to an *[]Strings*. Therefore *I* and *[]I* are actually just primitive sets. The link multiplicity and codomain are immediates, so we need only the name of the link and it's primitive value. Indeed this is a trait! 

    (∀ k ∈ K)(∀ r ∈ Relations(k)) let t be the corresponding Trait which isomorphically represent this link.
        (r is singular): t := (name(r), Strings)
        (r is multiple): t := (name(r), []Strings)
    
This may seem at first to be just a technicality. But in fact this equivalence is what allows us to state that in order to implement the metis data model, we need only a data store which can hold structures composed of primitive tuples. Still don't see it? Well we picked string "names" for our traits and links because that is the most sensible way to understand them. But a string is just a primitive. Therefore a trait is a (Primitive, Primitive) tuple. And a link is a trait. Therefore records are truly just sets of primitive-primitive tuples. Every other construction we have introduced so far is just a logical abstraction.

#### Polymorphism (Domains)

But you may be thinking, what about polymorphism. How can I make type information variable regarding the kind of a relation. We have so far ignored this point. We defined a link to have a codomain, which thus far was always a kind, and that kind was backed by a physical space of records -- which knew to exist. But now we introduce the notion of domains an extend our ideas a bit further:

    Let D be the set of domains for the entire ontology.
    
    ∀ k ∈ K:
     * Domains(k) → {d ∈ D, such that the record satisfies the requirements of d}
     
    K ⊆ D
    
Any domain d, which is not a kind k, is not connected to a physical space and therefore itself defines a virtual space. That is to say no single kind physically substantiates that virtual space but rather records of many kinds do, perhaps only one kind. The domain is a restriction on what you can put in the relation.

        (∀ k ∈ K)
         * |Domains(k)| > 0, because Domains(k) is at least {k}
         * |Domains(r)| = 1 ⇒ r is purely physical (substantiates no virtual spaces)
         
If ou are familiar with the notions of interfaces or protocols, a virtual domain is like an interface because it implicitly represents the variability of type information. But we need to know that kind somehow, since we stated that in order to retrieve a record, we need the kind-id tuple. So any polymorphic link reduces to two traits. One associated with the variable kind(s) and one associated with the variable id(s). We generalize our relation R:

    R: Strings → D
    
### Meta-Models: Toward a Dynamic Ontology

A lot of the formalities we have established so far are relatively well understood in the computer systems community. We have SQL databases and a plethora of ORM libraries which allow us to interface with these data stores. One of the motivations though for formally defining all the structures needed to represent a robust ontology, is the possibility that we can use that system in order to define a dynamic ontology. We can use metis in order to implement metis for a novice user. Indeed we claim that using the theory we have established above, this is possible using a finite set of meta-models. We will define these here:

#### Ontology

    Kind: 'ontology'
    Space: Ontologies
    Domains: { 'ontologies' }
    Traits: {}
    Relations: { ('models', Models), ('ontics', Ontics) }

#### Model

    Kind: 'model'
    Space: Models
    Domains: { 'models' }
    Traits: { ('name', Strings) }
    Relations: { ('traits', Traits), ('relations', Relations), ('ontology', Ontologies) }
    
#### Trait

    Kind: 'trait'
    Space: Traits
    Domains: { 'traits' }
    Traits: { ('name', Strings), ('primitive', Strings) }
    Relations: { ('model', Models), (attributes, Attributes) }
    
#### Relation

    Kind: 'relation'
    Space: Relations
    Domains: { 'relations' }
    Traits: { ('name', Strings), ('multiplicity', Strings), ('codomain', Strings), ('inverse', Strings) }
    Relations: { ('model', Models), ('links', Links) }
    
#### Ontic

    Kind: 'ontic'
    Space: Ontics
    Domains: { 'ontics' }
    Traits: {}
    Relations: { ('attributes', Attributes), ('links', Links), ('model', Model), ('ontology', Ontologies) }

#### Attribute

    Kind: 'attribute'
    Space: Attributes
    Domains: { 'attributes' }
    Traits: { ('value', Bytes) }
    Relations: { ('ontic', Ontics), ('trait', Traits) }

#### Link

    Kind: 'link'
    Space: Links
    Domains: { 'links' }
    Traits: { (ids, Lists) }
    Relations: { ('ontic', Ontics), ('relation', Relations) }
    
We claim that these models are structurally sufficient structures to implement the aforedeveloped metis data model. Therefore, we can build an ontology, that allows for dynamic ontologies.

#### Validity

To be a valid record in the elos data model a record must have an ID and a kind. The kind is often represented implicitly through the use of database "collections" or "tables." Elos views this as mostly an optimization. It can be thought of as if you had an index on the kind field and one big table of 'records.' Obviously this isn't as tenable if you know up front you are going to have that kind field, which is why databases are built the way they are.

In elos we attach three additional traits to each record. *created_at*, *updated_at* and *deleted_at* timestamps. So extending our axioms of *r* ∈ *R*:

let *D* be the set of all RFC3099 binary encoded dates.

    created_at(r) → c ∈ D
    updated_at(r) → u ∈ D
    deleted_at(r) → d ∈ D

    New Axiom: created_at(r) = updated_at(r) ⇒ r is a 'new' record
    Del Axiom: created_at(r) < deleted_at(r) ⇒ r is a 'tombstone' record

The *New* axiom can be used as an invariant for records which are determined to be immutable, such as credentials, security groups, etc. (all things we will get into later). These, along with the implicit "id" trait, are collectively the known as "bookeeping" traits. Every record is for some sort of book keeping, but this is sort of meta book keeping.

#### Meta (Dynamic) Base Models

