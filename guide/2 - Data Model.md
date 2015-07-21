Data Model
----------

The Elos Data Model (EDM, intentionally named to be confused with electronic dance music) is the underlying system defining all object models in the elos universe. It describes the fundamental building blocks of the elos core ontology, and even - as we will see - provides the building blocks for dynamic ontologies built on top of elos.

### Records

It is easiest to think about elos data records (same thing as objects) as you would imagine algebraic objects. Much like in mathematics, we will define these objects and their formal properties and behaviors axiomatically. We will use the terminology of sets, domains, codomains and spaces with the similar intent to that used in its algebraic counterpart.

The first distinction to be made is between a class archetype of an elos model and instances of that definition. We will deal with the general case always, as we will define what determines validity for a base model. We classify differnt "types" of models by their "kind," which you will see is a formal construct in the elos data model.

#### Definitions

Let Strings be the set of all string binary representations in UTF-8.

Let K be the set of "kinds" of data models we want to represent. For a simple todo app, K might be { 'user', 'task', 'list'}. K is much larger for elos. Note: K ⊆ Strings.


Let R be the set of all records in the elos system:

    ∀ r ∈ R:
      * Kind(r) → k ∈ K
      * ID(r) → s ∈ Strings

    ∀ m, n ∈ R: Kind(m) = Kind(n) ⇒  ID(m) ≠ ID(n)

So at the purest level, the elos data model uses a two-dimensional coordinate system to identify all records. You will note that we can now define the Find function on the elos data system to be the following:

Let I be the set of all ids in the system. I ⊂ Strings.

    ∀ k ∈ K, i ∈ I; ∃ r ∈ R : Find(k, i) → r

Moreover, Find(k, s) is injective (one-to-one). We uniquely identify a record by its kind and id. Note, here, that some databases have unique ids for _every_ record. Some don't. SQL databases generally use incrementing ids for each table. To hel you grok this, if it's still unclear, is SQL, and elos kind would map toa  table and the id to the primary key field. There really aren't any new ideas here, just a slightly general formal statement of what we are working with.

#### Validity

To be a valid record in the elos data model a record must have an ID and an a kind. The kind is often represented implicitly through the user of database "collections" or "tables." Elos views this as mostly an optimization, you can think about it as if you had an index on the kind field and you had one big table of 'records.' Obviously this isn't as tenable if you know up front you are going to have that kind field, which is why databases are built the way they are.

In elos we attach two additionaly pieces of information to each record. Created At and Updated At timestamps. So extending our axioms of r in R:

let D be the set of all RFC3099 binary encoded dates.

    created_at(r) → d ∈ D
    updated_at(r) → d ∈ D

We can see that ∀ r ∈ R, created_at(r) = updated_at(r) ⇒  r has not mutated since creation. This can be used as an invariant for records that are determined to be immutable, such as credentials, security groups, etc (all things we will get into later).

#### Spaces

So we know that an id and kind can uniquely identify a data record in elos. But what if we want to talk about all the users in elos, or all the credentials in elos. There are two disjoint sets, and though they are both subsets of all records, R, we may want to deal with them independently. Therefore we associate with each kind a "space." A space is a term we use to refer to the set of all instances of a record of kind k.

Formally:
    for k in K, space(k) -> s in S, the set of all spaces

Once again for our simple todo app example. If we had the kinds user, task, list, we would have the spaces users, tasks, lists. Yes, the space name, because of how english works, is generically the plural of the kind. Ahah! Now you see the connection to database tables or collections if you didn't see it before! Or perhaps you see it more clearly. Indeed, the implementation of a todo app using the Elos data model in SQL would involve a users, tasks and lists table. EAch would contain _at least_ an id, created_at and updated_at field.

#### Polymorphism (Domains)

But you may be thinking, what about polymorphism. I know we haven't yet talked about links between records but you can probably see that coming down the pike, and when it does we want to have some notion of how to deal with it in our type system. How can I make type information variable regarding the kind of a link. The answer is domains.

