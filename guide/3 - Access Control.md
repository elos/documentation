Access Control
--------------

Formal systems that maintain a collection of resources need a notion of access control. This is a foundational concept in operating systems, database systems, and also organizational systems. Elos is no different, and the elos ontology is governed by the Elos Access Control (EAC) model.

### Overview

#### Universe (Elos Systems)

We must first defined the environment for the implementation of the formal rules governing our system. For elos, it is our codebase. The unviverse can be thought of as the Elos System, as the rules and logic programmed by elos engineers. The services. Basically, all of the infrastructure we have set up in order to maintain this access control. I will often refer to the "system" or "environment" and the laws which we set up to govern it. You can think of this as a spec for the implementation of the system.

#### Entry Point (Users)

Gödel postulated that no formal system can be both consistent and complete. Such is the way with the EAC. We need an entry point. There must be a notion of a "God" object, an un-ownable entity. For these entities need to act on the resources (in our case, property) which the system maintains. Whenever you have an un-contained object, who itself is not governed by the access model, you also introduce the new formal rules of the universe (our environment). First, let us formally define a user, and the properties which for the basis of such an object. Then we can discuss the formal rules for their creation, existence, and deletion.

##### User Data Model

Recall that *R* is the set of all records in the EDM.

Let *U* be the set of all users.

    U ⊂ R
    u ∈ U ⇒  u ∈ R

A user *u* is a record with one additional property. Recall *Strings* is the set of all strings. We didn't mention this yet, but Chars is the set of all characters. Think of a string, *s* ∈ Strings. s ≡ (c₁, c₂, ..., ck). An ordered set of characters.

Let S₅₀⁺ be the set of strings composed of 50 or more characters.

    password(u) → p ∈ S₅₀⁺

note: the user inherits id, created_at, updated_at, and deleted_at properties by virtue of being a member of the set of Records

Remember that the EDM is a directed graph. A user has four links (edges).

    credentials(u) → C', where C' ⊂  C, the set of all credentials
    groups(u) →  G', where G' ⊂ G, the set of all groups
    authorizations(u) → A', where G' ⊂ G, the set of all groups
    sessions(u) → S', where S' ⊂ S, the set of all sessions

    Security Exclusion Principal: G' ∩ A' = ∅, namely G' and A' share no members
    Credentialed Axiom: credentials(u) ≠ ∅

Here we have introduced the 3 other data models which we will need to implement the EAC. Namely, credentials, groups, and sessions.

###### Creation

let C be the creation function.

let public, private in String be the public and private parts of a credential which will be the first credential for the user.

then C = function(public, private) => User

the universe assigns the user's id, created_at, updated_at, and password fields. The universe creates a valid credential and assigns it to the user.

#### Interaction (Property)

### Models

All models have an id and the [bookkeeping traits](./2 - Data Model.md#effective-bookkeeping).

#### User

    Kind: 'user'
    Space: Users
    Domains: { 'users' }
    Traits: { (password, Strings) }
    Links: { ('credentials', Credentials), ('groups', Groups), ('authorizations', Groups), ('sessions', Sessions) }
    
#### Credential

    Kind: 'credential'
    Space: Credentials
    Domains: { 'credentials' }
    Traits: { ('public', Strings), ('private', Strings), ('spec', Strings), ('name', Strings) }
    Links: { ('owner', Users), ('sessions', Sessions) }
    
Credentials are immutable.
    
#### Session

    Kind: 'session'
    Space: Sessions
    Domains: { 'sessions' }
    Traits: { ('token', Strings), ('expires_after', Integers)
    Links: { ('owner', Users), ('credential', Credentials) }

Sessions are immutable.
    
#### Group

    Kind: 'group'
    Space: Groups
    Domains: { 'groups' }
    Traits: { ('name', Strings), ('access', Integers) }
    Links: { ('contexts', Contexts) ('owner', Users), ('grantees', Users) }
    
Groups are immutable.
    
Access:
 * 0 := none
 * 1 := read
 * 2 := write

The initial value of 'access' is 0. So unless a user gives explicity permissions, _after_ creating the group, the group's effect is nil. This group is known as an impotent group.
    
#### Context

    Kind: 'context'
    Space: Contexts
    Domains: { 'contexts' }
    Traits: { ('domain', Strings), ('ids', Lists<String>)
    Links: { ('owner', Users) }
    
Contexts are immutable.

You may have noticed that each of the models except for the user has an 'owner' relation. Indeed every model in the system must have a owner. 


### Actions

Every mutation of data is taken on behalf of either the system or a user. Generally speaking, the system can do whatever it wants. We obviously will establish formal rules to be reasonable. But otherwise, actions are taken on behalf of the user. There are four actions that a user can take: create a record, read a record, write a record and delete a record.

#### Creating

A user can create any record of any kind k, *except* for another user. Another way of stating this rule is that a user can create any ownable record. Every record in the system is ownable except for a user record.

#### Reading

A user can read their own record, and the records which they own. Additionally a user can read any records which are enumerated in the contexts of any groups with access level > 0 of which the user is a a 'grantee'.

Another way of stating this is that if a user is 'authorized' to read or write to a record, they may read or write. Sounds tautological but it is this is the nature of proofs by definition.

#### Writing

A user can write to their own record, and the *mutable* records which they own. Additionally a user can write to any *mutable* records which are enumerated in the contexts of any groups with access level > 1 of which the user is a 'grantee.' A *mutable* record is defined as any record which is not explicitly *immutable*.

As with reading, they can write if authorized by definition of the groups they are a part of.

#### Deleting

A user can only delete records which they own.
