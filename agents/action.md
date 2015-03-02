Action
------

The action agent is responsible for assigning the current user's current action. The action agent maintains a hierarchy of agents that make decisions on it's behalf. The action agent is the archetype of a common paradigm in elos autonomous agent design. The action agent maintains and enforces the salience of each possible action source (for now this maitenance is simply checking with certain agents before others). Thus you can think of the action agent as the root node of a decision heirarchy.

### Life
 1. Start routine agent
 2. Subscribe to database updates on user
 3. When user updates:
    1. Check if current action is complete
    2. Try set action
    3. Go to (3)


### Spawns
 * [Routine Agent](routine.md)
