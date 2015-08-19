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
     * Kind(r) → k ∈ K
     * ID(r) → i ∈ I

    ∀ m, n ∈ R: Kind(m) = Kind(n) ⇒ ID(m) ≠ ID(n)

So at the purest level, the elos data model uses a two-dimensional coordinate system to identify all records. You will note that we can now define the *Find* function on the elos data system to be the following:

    ∀ k ∈ K, i ∈ I; ∃ r ∈ R : Find(k, i) → r

Moreover, *Find(k, s)* is injective (one-to-one). We uniquely identify a record by its kind and id. Note, here, that some databases have unique ids for _every_ record. Some don't. SQL databases generally use incrementing ids for each table. In SQL, an elos kind would map to a table and the id to the primary key field. No new ideas here, just a slightly more general and formal statement of what we are working with.

#### Validity

To be a valid record in the elos data model a record must have an ID and an a kind. The kind is often represented implicitly through the use of database "collections" or "tables." Elos views this as mostly an optimization. It can be thought of as if you had an index on the kind field and one big table of 'records.' Obviously this isn't as tenable if you know up front you are going to have that kind field, which is why databases are built the way they are.

In elos we attach three additional pieces of information to each record. *created_at*, *updated_at* and *deleted_at* timestamps. So extending our axioms of *r* ∈ *R*:

let *D* be the set of all RFC3099 binary encoded dates.

    created_at(r) → c ∈ D
    updated_at(r) → u ∈ D
    deleted_at(r) → d ∈ D

    New Axiom: created_at(r) = updated_at(r) ⇒ r is a 'new' record
    Del Axiom: created_at(r) < deleted_at(r) ⇒ r is a 'tombstone' record

The *New* axiom can be used as an invariant for records which are determined to be immutable, such as credentials, security groups, etc. (all things we will get into later).

#### Spaces

So we know that a kind and an id can uniquely identify a record in the EDM. But consider the set of all "users" in elos, or all "credentials" in elos. These are two disjoint sets (by definition), though they are both subsets of *R*, all records in elos. We want to handle various sets of records which share a "kind" independently and conveniently.

To achieve this goal, we associate with each kind a "space."

     ∀ k ∈ K, ∃ s ∈ S : space(k) → s

     ∀ x, y ∈ K, space(x) = space(y) ⇒ x = y

A space is the term we use to refer to the set of all instances of a record of kind k. And *S* is the set of all spaces.

Returning to our example of a todo app. If we had the kinds, { "user", "task", "list" }, we would have the following spaces:

Formally:

    ∀ k ∈ K, space(k) → s ∈ S, the set of all spaces

    U = { r ∈ R : kind(r) → "user" }
    T = { r ∈ R : kind(r) → "task" }
    L = { r ∈ R : kind(r) → "list" }

    ∴ S ≡ { U, T, L }

We would refer to U, T, L as users, tasks, and lists, respecitively. Yes, the space name, because of how english works, is generically the plural of the kind. Ahah! Now you see the connection to database tables or collections if you didn't see it before! Or perhaps you see it more clearly. Indeed, the implementation of a todo app using the EDM in SQL would involve a users, tasks and lists table. Each would contain _at least_ an id, created_at, updated_at, and deleted_at field.

#### Polymorphism (Domains)

But you may be thinking, what about polymorphism. I know we haven't yet talked about links between records but you can probably see that coming down the pike, and when it does we want to have some notion of how to deal with it in our type system. How can I make type information variable regarding the kind of a link. The answer is domains.

