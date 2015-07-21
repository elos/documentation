Access Control
--------------

Formal systems that maintain a collection of resources need a notion of access control. This is a foundational concept in operating systems, database systems, and also organizational systems. Elos is no different, and the elos ontology (including the dynamic ontology) are governed by the Elos Access Control (EAC) model.

### Overview

#### Universe (Elos Systems)

We must first defined the environment for the implementation of the formal rules governing our system. For elos, it is our codebase. The unviverse can be thought of as the Elos System, as the rules and logic programmed by elos engineers. The services. Basically, all of the infrastructure we have set up in order to maintain this access control. I will often refer to the "system" or "environment" and the laws which we set up to govern it. You can think of this as a spec for the implementation of the system.

#### Entry Point (Users)

Godel postulated that no formal system can be both consistent and complete. Such is the way with the EAC. We need an entry point. There must be a notion of a "God" object, an un-ownable entity. For these entities need to act on the resources (in our case, property) which the system maintains. Whenever you have an un-contained object, who itself is not governed by the access model, you also introduce the new formal rules of the universe (our environment). First, let us formally define a user, and the properties which for the basis of such an object. Then we can discuss the formal rules for their creation, existence, and deletion.

##### User Data Model

A user consists of a few traits:

 * id
 * created_at
 * updated_at
 * password

And a few links:

 * Multiple credentials
 * Multiple groups
 * Multiple authorizations (domain of groups)
 * Multiple sessions

Here we have introduced the 3 other data models which we will need to implement the EAC. Namely, credentials, groups, and sessions.

##### Formal Rules

A user is _valid_ so long as it has an id, created_at field, updated_at field, password and at least one credential.

###### Creation

let C be the creation function.

let public, private in String be the public and private parts of a credential which will be the first credential for the user.

then C = function(public, private) => User

the universe assigns the user's id, created_at, updated_at, and password fields. The universe creates a valid credential and assigns it to the user.

#### Interaction (Property)
