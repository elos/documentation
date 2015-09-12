Data Model
----------

The Metis Data Model (MDM) is a theoretical framework for defining a system of data records and their relationships. It can describe the fundamental building blocks of the elos core ontology, and even - as we will see - provides the building blocks for dynamic ontologies built on top of elos.

### The Pardigm of Set Theory

It is easiest to think about metis data records as you would imagine algebraic objects. Much like in mathematics, we will define these objects and their formal properties and behaviors axiomatically. We will use the lexicon of [set theory](../theory/1 - sets.md) to talk about their relationships.

The universal set while discussing the MDM is the set of all data records, *R*. But we must now make our first distinction, that between the archtype of a record and instances of that record. You can imagine the object-oriented equivalents of a class and instance respectively. We will state axioms about record archetypes, which we will henceforth refer to as models, but we will generally state theorems about our universe of record instances. We use the terminology "theorems" because these statements are implications of our axioms.

The second distinction to be made is between different types of models. Intuitively, and formally, there is a difference between the data record which represents a task and that which represents the task list. Data records often break into discrete structures much as you define them and implemented them in a programming language. 

We refer to the different types of models by their _kind_, which we make a formal construct in the MDM.

#### Primitives vs. Structures

We need to speak at least quickly regarding the theory of information. All information can be encoded using a two digit alphabet. If this doesn't sound familiar, you can check out information theory. We will use Binary for our two digit alphabet. One way to think about it:

    Binary ≡ { B, ¬B }

So we have presence and abscence, true and false, and we will use these bits to represent all information. But our definition of binary isn't so important to our own goal as it is to the justification of the following primitive set we will define. It is so as a chemist recognizes atoms and the constituencies they form before and in justification of her ability to talk instead of molecules. Indeed we want to talk about data records, the structures (molecules) which are composed of these primitives (atoms).

The EDM uses several "primitive," data structures, and assumes they are available to the system implementation.

    Booleans ≡ the set of all boolean values, {True , False}
    Integers ≡ the set of all 64-bit integers, {x ∈ ℤ |  -9223372036854775808 ≤ x ≤ 9223372036854775807}
    Floats   ≡ the set of all IEEE-754 64-bit floating-point numbers
    Strings  ≡ the set of all UTF-8 binary encoded strings
    Dates    ≡ the set of all RFC3099 binary encoded dates
    Lists    ≡ the set of all sets of mappings from Integer to Primitives
    Maps     ≡ the set of all sets of mappings from { Integer, Float, String } to Primitive
    
    and Primitives := { Booleans, Integers, Floats, Strings, Dates, Lists, Maps }
    
Note that "a set of mappings" can be thought of as a function. We avoid using the explicity term function here because it is often conflated with a physical function implementation. It is fair that indexing into an array or a map by an integer or hashable value, respectively, is equivalent to calling a function. Indeed, everything is a function.

### Records

We defined the set of all records to be *R*. We now define the *K* to be the set of the kinds of data models we want to represent. For a simple todo app, *K* might be { 'user', 'task', 'list' }. *K* is much larger for elos, I think the cardinality now hovers around 20 -- but there is work being done to bring that number down. Note that *K* ⊂ *Strings*. It is, indeed, a proper subset. As we have defined the set *Strings* here, it is infinite (uncountable).

We have made two distinctions thus far:

 * The 'Ontic' Distinction: That between the ontology and the ontic, between the class and the instance, the model and the record, the phenomenal as opposed to the physical
 * The 'Kind' Distinction: That we want different structures of data records

We will now introduce a third distinction:

 * The 'ID' Distinction: We must be able to identify and retrieve different instances of the same model kind, we will do so with a unique independently assigned identifier

We define *I* to be the set of all ids in the system. As with *K*, *I* ⊂ *Strings*. *I* is definitely countable, in fact its cardinality is the number of records in the system.

#### Formal Definitions

So at the purest level, the metis data model uses a two-dimensional coordinate system to identify all records. Namely, the kind and id. We can partition the set of all records based on their kind, and we can identifiy a record within the space of its kind by it's id. Formally, we define these two property functions for each record:

     * Kind: R → K
     * ID:   R → I

    ∀ m, n ∈ R: (Kind(m) = Kind(n)) ⇒ (ID(m) ≠ ID(n))
    ∀ m, n ∈ R: (Kind(m) = Kind(n)) ^ (ID(m) = ID(n)) ⇒ m = n

We now define the function *Find: (K, I) → R*. We can say:

    (∀ k ∈ K, i ∈ I)(∃ r ∈ R) Find(k, i) ↦ r

Moreover, *Find* is a bijection. It's inverse is given by the tuple of the *Kind* and *ID* property functions we defined earlier. We note, here, that some databases have unique ids for _every_ record, r ∈ R. Some don't -- namely SQL. SQL databases generally use incrementing ids for each table. In SQL, a metis kind would map to a table and the id to the primary key field. This illustrates a general point, you can probably follow along with the metis system and see the connections to SQL as we go. Indeed SQL is a working implementation. We formally define these concepts here so that we can further reason and abstract them.

#### Spaces

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
    
Here it is useful to think of the function *Traits* as a set of ordered pairs. As we will refer to the *Traits* of a model regularly. So a trait could be ('completed', Booleans) or ('created_at', Dates). But recall the 'Ontic' distinction. We have the framework of traits, but each individual record will have a different value associated with each trait. We call this value the records 'attribute.' This is implicit in our above formal definition because T is a function from Strings, a simple set, to Primitives a set of sets.

An individual record may then have the attribute, ('completed', True) and ('created_at', '2009-11-10 23:00:00 +0000 UTC'). We define attributes on the set of records (recall the Ontic distinction):

    A: Traits → (P ∈ Primitives)
    
    ∀ r ∈ R, ∃ several attributes which belong to that record
    
    Let Attributes: R  → (Traits, P ∈ Primitives)

Continuing our task list example.

    Traits('task') := { ('created_at', Dates), ('completed_at', Dates), ('name', Strings) } ≡ { t₁, t₂, t₃ }
    
    (Attributes ○ Find)('task', 1) = Attributes(Find('task', 1)) = { (t₁, '2009-11-10 23:00:00 +0000 UTC'), (t₂, '2009-11-10 23:00:00 +0000 UTC'), (t₃, 'Take out the trash')}
    
It can be nice to think of the attributes of a record as just the string to their value, and then the primitive type is implicit is that it is the superset (universe) of whichever value is given. We prefer to be explicit here.

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

#### Relationships (Links)

You may be thinking, "Aren't abstraction and encapsulation important ideas?" Ha! You are right, which is why we don't have one big record which we modify, we split them up. This idea was, in a way, implicit in the fact we were talking about kinds and spaces but I guess we could have pursued such formality for the sake of of "generality." But as soon as you have multiple kinds of records, you want to be able to model their relations. Graphs are beautiful data structures which appear everywhere. We have a graph here. The cool thing is that we can represent relationships with standardized trait definitions. So links are truly an abstraction. Let's see.

Let's say we have records r and s. r wants to point to information encapsulated in s. So this is a directed graph indeed. Say r is a task list and s is a task. We want the task list to _have_ the task. So a nice way of thinking of it is to say that the a TaskLisk has many tasks. So you may be thinking easy, a trait with a name of "tasks." And yep, that's right, for starters.

    L: Strings → r ∈ R
    
    ∀ r ∈ R, ∃ zero or more links which belong to that record.
    
There are three bits here. The name of the link, the kind of the other record and the id of the record. But wait a TaskList could have many Tasks. So in fact we want a set of record in R. So there's another bit, whether this arrow "splits," if you will. So a link is an abstraction. And we also have a multiple link.

    M: Strings → {r, ...} ∈ R
    
    ∀ r ∈ R, ∃ zero or more multiple links which belong to that record.
    
So there are four bits: name, kind, id(s) of the other record, and whether we expect it to be multiple link.

Let's extend our notion of a record:

    ∀ r ∈ R:
        * Traits(r) → { t, ... ∈ Traits } (we said a record must have at least an id, and book keep traits)
        * Links(r) → ∅ ∨ { t, ... ∈ Traits } (a record need not have links)
    
    and remember 
    
    ∀ l ∈ Links, ∃ a function or correspondence, LinkRepresentation: Links → Traits
    
    Representation is isomorphic
    
    ∴  ∀ l ∈ Links, ∃ t ∈ Traits
    
Because of the book keeping traits, 

    ∀ r ∈ R, |Traits(r)| ≥ 4

Because all links are ultimately represented by traits

    ∀ r ∈ R, |Traits(r)| - 4 ≥ |Links(r)|
    
The obvious question is, if a Link needs 4 "bits" of information to be fully understood, then why doesn't one link abstraction yield four traits. And the answer is that at the static elos data model level, these bits of information can be encoded programmatically. For example, if you stored those 4 bits on the model you would still have to implement the manner in which you go about retrieving the corresponding records. This maneuver is just an algorithm, and so at the actual representation level, if we have the archetype abstraction of knowing that a TaskList's "tasks" trait is multiple, and that the codomain is "task," then need only store the trait "tasks" -> []id. We know to interpret these ids as tasks. And this is truly the relationship the LinkRepresentation function defines.

    LinkRepresentation: L → T, ∀ l ∈ L
        iff l is singular: LinkRepresentation(l) → t ∈ T, t: name(l) → id
        iff l is multiple: LinkRepresentation(l) → t ∈ T, t: name(l) → []id
        
    LinkRepresentation establishes a function if l is singular and a correspondance if l is multiple.

#### Polymorphism (Domains)

But you may be thinking, what about polymorphism. How can I make type information variable regarding the kind of a link. The answer is domains. We defined a link to have a codomain, which thus far was always a kind. But now we introduce the notion of domains an extend our idea of a record a bit further:

    Let D be the set of domains for the entire ontology.
    
    ∀ r ∈ R:
     * Domains(r) → {d ∈ D, such that the record satisfies the requirements of d}
     
    S, the set of all spaces, is a subset of D, the set of all domains
    
Any domain that is not a physical space, itself defines a virtual space. Namely no individual record physically substantiates that space but rather records of many kinds do. The domain is a restriction on what you can put in the box, but we still need to retain the information on what is actually inside. So whenever you have a polymorphic link, when Codomain(l) is not in S, you must also record the kind.
     
Now for some axioms.

        (∀ r ∈ R)
         * |Domains(r)| > 0, because the record always implements its physical space
         * (Domains(r) = 1) ⇒ (r satisfies no virtual spaces)

Finally we can generalize our definition of Codomain on a link:

     Codomain: L → D

Which makes sense of why we call it a codomain.

#### Meta (Dynamic) Base Models

