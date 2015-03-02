Main
----

The main agent is the primary access point for all agents on elos. You can think about the main agent as the main function of a program: if the main agent exits all agents for a user have effectively stopped.

The main agent represents the services for a user. We hope to have customizable agent specs in the future but for now we have universal defaults. The [action agent](action.md) is currently the only agent started by main.

### Life
 1. Start all default agents
 2. Wait for stop signal

### Spawns
 * [Action Agent](action.md)
