Agents
------

Autonomous agents are designed to be containers for arbitrary code to be executed at particular times or time intervals on the server. They are managed by autonomous managers. See the bottom of this document for links to the currently implemented autonomous agents.

#### Base Agent
Every autonomous agent contains and embedded BaseAgent. The base agent manages everything about being an autonomous agent on the elos infrastructure. An agent which is composed of the BaseAgent need not implment the majority of the boilerplate code. A Base Agent has a mutex to manage it's data access and keeps track of how many instances of this agent's process are running, whether it is alive or dead, it's data owner and it's manager


#### Start
An agent should always be started through a manager, as managers provide the correct abstraction for managing autonomous processes.


#### Implemented Agents
 - Client Data Agent
 - Sleep Agent

