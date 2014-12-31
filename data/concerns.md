Concerns
--------

Concerns are elos' method of data synchronization. A models conerns are those other models that care about this models update. A concern is often a model that also changes as a result of this change, or a model that would be interested in this change. e.g., an event changes its name, the event has concerns, in this case only it's owner user. This makes sense, every client managing data for the user would benefit from learning of the event's new updated name.

### For use in the Hub

The main elos hub(need to add link) uses conerns to manage model notifications. The hub listens to a channel from the database manager for every updated model. When it recieves a model over this channel (meaning the model has been updated and persisted) the hub looks up the models concerns and notifies those concerns.
