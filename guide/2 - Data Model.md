Data Model
----------

The Elos Data Model (EDM, intentionally named to be confused with electronic dance music) is the underlying system defining all object models in the elos universe. It describes the fundamental building blocks of the elos core ontology, and even - as we will see - provides the building blocks for dynamic ontologies built on top of elos.

### Records

It is easiest to think about elos data records (same thing as objects) as you would imagine algebraic objects. Much like in mathematics, we will define these objects and their formal properties and behaviors axiomatically. We will use the terminology of sets, domains, codomains and spaces with similar intent to their algebraic counterparts.

The first distinction to be made is between a class archetype of an elos model and instances of that definition. We will deal with the general case always, as we will define what determines validity for a base model. We classify differnt "types" of models by their "kind," which you will see is a formal construct in the elos data model.

#### Definitions

Let *Strings* be the set of all string binary representations in UTF-8.

Let *K* be the set of "kinds" of data models we want to represent. For a simple todo app, *K* might be { 'user', 'task', 'list'}. *K* is much larger for elos. Note: *K* ⊂ *Strings*.

Let *I* be the set of all ids in the system. *I* ⊂ *Strings*.

Let *R* be the set of all records in the elos system:

    ∀ r ∈ R:
     * Kind: R → K
     * ID: R → I

    ∀ m, n ∈ R: (Kind(m) = Kind(n)) ⇒ (ID(m) ≠ ID(n))
    ∀ m, n ∈ R: (Kind(m) = Kind(n)) ^ (ID(m) = ID(n)) ⇒ m = n

So at the purest level, the elos data model uses a two-dimensional coordinate system to identify all records. Namely, the kind and the id. You will note that we can now define the *Find* function on the elos data system to be the following:

    (∀ k ∈ K, i ∈ I)(∃ r ∈ R)(Find(k, i) → r)

Moreover, *Find(k, s)* is injective (one-to-one). We uniquely identify a record by its kind and id. Note, here, that some databases have unique ids for _every_ record, r ∈ R. Some don't. SQL databases generally use incrementing ids for each table. In SQL, an elos kind would map to a table and the id to the primary key field. No new ideas here, just a slightly more general and formal statement of what we are working with.

#### Spaces

So we know that a kind and an id can uniquely identify a record in the EDM. But consider the set of all "users" in elos, or all "credentials" in elos. These are two disjoint sets (by definition), though they are both subsets of *R*, all records in elos. We want to handle various sets of records which share a "kind" independently and conveniently.

To achieve this goal, we associate with each kind a "space."

     ∀ k ∈ K, ∃ s ∈ S : space(k) → s

     ∀ x, y ∈ K, space(x) = space(y) ⇒ x = y (injective)

A space is the term we use to refer to the set of all instances of a record of kind k. And *S* is the set of all spaces.

Returning to our example of a todo app. If we had the kinds, { "user", "task", "list" }, we would have the following spaces:

Formally:

    ∀ k ∈ K, space(k) → s ∈ S, the set of all spaces

    U = { r ∈ R : kind(r) → "user" }
    T = { r ∈ R : kind(r) → "task" }
    L = { r ∈ R : kind(r) → "list" }

    ∴ S ≡ { U, T, L }

We would refer to U, T, L as users, tasks, and lists, respecitively. Yes, the space name, because of how english works, is generically the plural of the kind. Ahah! Now you see the connection to database tables or collections if you didn't see it before! Or perhaps you see it more clearly. Indeed, the implementation of a todo app using the EDM in SQL would involve a users, tasks and lists table. 

#### Primitives

Before we continue we need to speak at least quickly regarding the theory of information.

All information can be encoded using a two digit alphabet. If this doesn't sound familiar, you can check out information theory. We will use Binary for our two digit alphabet. One way to think about it:

    Binary ≡ { B, ¬B }

So we have presence and abscence, true and false, and we will use these bits to represent all information. But our definition of binary isn't so important to our own goal as it is to the justification of the following primitive types we will define. It is so as a chemist recognizes atoms and the constituencies they form before and in justification of her ability to talk instead of molecules.

The EDM uses several primitive types. They are:

    Boolean ≡ the set of all boolean values, true and false
    Integer ≡ the set of all 64-bit integers, range -9223372036854775808 through 9223372036854775807
    Float   ≡ the set of all IEEE-754 64-bit floating-point numbers
    String  ≡ the set of all UTF-8 binary encoded strings
    Date    ≡ the set of all RFC3099 binary encoded dates
    List    ≡ the set of all sets of mappings from Integer to Primitives
    Map     ≡ the set of all sets of mappings from { Integer, Float, String } to Primitive

#### Traits

Now that we have an idea of the abstract nature of elos records, we can discuss their individually defining features. A record's archetype is defined by the *Traits* which is has. Traits are key/value pairs from a String to a Primitive.

    T: Strings → Primitives
    
    ∀ r ∈ R, ∃ several traits which belong to that record.

 A primitive is anything which can be encoded in binary -- which is everything -- but can be something like a date, for example.

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

