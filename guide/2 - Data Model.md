Data Model
----------

The Elos Data Model (EDM, intentionally named to be confused with electronic dance music) is the underlying system defining all object models in the elos universe. It describes the fundamental building blocks of the elos core ontology, and even - as we will see - provides the building blocks for dynamic ontologies built on top of elos.

### Records

It is easiest to think about elos data records (same thing as objects) as you would imagine algebraic objects. Much like in mathematics, we will define these objects and their formal properties and behaviors axiomatically. We will use the terminology of sets, domains, codomains and spaces with the similar intent to that used in its algebraic counterpart.

The first distinction to be made is between a class archetype of an elos model and instances of that definition. We will deal with the general case always, as we will define what determines validity for a base model. We classify differnt "types" of models by their "kind," which you will see is a formal construct in the elos data model.

#### Definitions

Let Strings be the set of all string binary representations in UTF-8.

Let K be the set of "kinds" of data models we want to represent. For a simple todo app, K might be { 'user', 'task', 'list'}. K is much larger for elos. Note: K is a subset of Strings.


Let R be the set of all records in the elos system. Let r be a member of the set R.

For all r in R,

    Kind(m) -> k in K
    ID(m) -> s in Strings

    for n, m in R: Kind(m) == Kind(n) => ID(m) != ID(n)

So at the purest level, the elos data model uses a two-dimensional coordinate system to identify all records. You will note that we can now define the Find function on the elos data system to be the following:

For every k in K and s in Strings there exists r in R such that Find(k, s) -> r. Moreover, Find(k, s) is injective (one-to-one).

This is to say that we uniquely identify a record by its "kind" and its id. Note, here, that some database systems have unique ids for _every_ record. Some don't. SQL databases generally use incremental ids for each table. To help you grok this, in SQL, Elos kind would map to a table and the ID to the primary key field. There really aren't any new ideas here, just a formal statement of what we are working with.

#### Validity

To be a valid record in the elos data model a record must have an ID and an a kind. The kind is often represented implicitly through the user of database "collections" or "tables." Elos views this as mostly an optimization, you can think about it as if you had an index on the kind field and you had one big table of 'records.' Obviously this isn't as tenable if you know up front you are going to have that kind field, which is why databases are built the way they are.

In elos we attach two additionaly pieces of information to each record. Created At and Updated At timestamps. So extending our axioms of r in R:

let D be the set of all RFC3099 binary encoded dates.

    created_at(r) -> d in D
    updated_at(r) -> d in D

    We can see that for r in R, created_at(r) == updated_at(r) => r has not mutated since creation. This can be used as an invariant for records that are determined to be immutable, such as credentials, security groups, etc (all things we will get into later).
