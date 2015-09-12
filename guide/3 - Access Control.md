Access Control
--------------

Formal systems that maintain a collection of resources need a notion of access control. This is a foundational concept in operating systems, database systems, and also organizational systems. Elos is no different, and the elos ontology is governed by the Elos Access Control (EAC) model.

### Overview

#### Universe (Elos Systems)

We must first defined the environment for the implementation of the formal rules governing our system. For elos, it is our codebase. The unviverse can be thought of as the Elos System, as the rules and logic programmed by elos engineers. The services. Basically, all of the infrastructure we have set up in order to maintain this access control. I will often refer to the "system" or "environment" and the laws which we set up to govern it. You can think of this as a spec for the implementation of the system.

#### Entry Point (Users)

Gödel postulated that no formal system can be both consistent and complete. Such is the way with the EAC. We need an entry point. There must be a notion of a "God" object, an un-ownable entity. For these entities need to act on the resources (in our case, property) which the system maintains. Whenever you have an un-contained object, who itself is not governed by the access model, you also introduce the new formal rules of the universe (our environment). First, let us formally define a user, and the properties which for the basis of such an object. Then we can discuss the formal rules for their creation, existence, and deletion.

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
    
Credentials are immutable. The public part of a credential is unique in the space of Credentials.
    
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

The initial value of 'access' is 0. So unless a user gives explicity permissions, _after_ creating the group, the group's effect is nil. This group is known as an impotent group. An impotent record is generally a record which is invalid without any negative side effects, or a record which has no effect on the system.
    
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

### Functionality

As a quick aside, whenever a external agent is communicating with the elos system we can classify them into 1 of three categories

##### Identified-Agent (IA)

An identified agen is any external agent communicating with the elos system whom ee have authorized. That is to say, there exists a user whom we have associated with this agent.

As a rule, elos serves the IA.

##### Unidentified-Agent (UA)

An unindentified agent is any external agent communicating with the elos system. They are not any user in particular, although they may be, and may eventually be authorized as such subsequently. The UA represents an unmalicious entity though that the system is willing to communicate with. Willing is key here.

As a rule, elos acknowledges a UA.

##### Malicious-Agent (MA)

A malicious agent is any external agent communicating with the elos system, whom the elos system has deemed as not fit to communicate with. Hopefully that decision would not have been made arbitrarily, but rather on a collection of intel regarding number of requests, number of failed actions, etc. 

As a rule, elos does not acknowledge a MA.

#### User

##### Creation

Any UA can attempt to create a user. When they do so, the user is assigned a 50 character password string, the user must create a credential also. A user without a credential is known as impotent. 

##### Deletion

In order to delete their account, a user must provide their 50 character password string, as an IA.

##### Modification

A user can personally change their 50 character password string, as an IA. Once an IA, they can also create any other ownable records. For example, create a credential and add it to their record.

##### Authorization (Identification + Authentication)

We've talked already about the distinction between an IA and UA. So how does a user become an identified agent, and what explicitly is associated with being an IA? An agent starts as an UA:

* UA attempts the Authorize Action, provides public key

System looks for a credential with that public key (Identification)
 1. Credential found: in which case the system issues a challenge based on the private key
 2. Credential not found: in which case the action fails (this counts towards the UA's failed action count

 * UA attempts to front the challenge, and sends decrypted message

System verifies decrypted challenge (Authentication)
 1. Correct: The user as authorized, as the user who owns the given credential, UA --> IA. At this point the system creates a session on behalf of the user, and allocates a unique token and appropriate expiration time.
 2. Incorrect: Now the action fails, and this counts towards the UA's failed action count

#### Credential

##### Creation

Any user u, can a credential, c. The credential must have a public and private componenent, as well a spec, which is a member of the set of explicitly supported authentication specifications, X.

    X := { 'password' } 

Currently a credential is just a id and password. So the private part would actually be an encrypted hash

##### Deletion

Only a user can delete its credentials. A user can not delete a credential if this will leave it without a credential. This is called the ensurance of access principal, given by the invariant:

    for u in User, |credentials(u)| > 0
    
##### Modification

Credentials are immutable.
