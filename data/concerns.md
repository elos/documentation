Concerns
--------

Each model in elos has concerns. The concerns of a model is a list id of the users who care about this model being updated. Concerns are the primary means of managing relevance to limit the need to propogate data across the distributed clients.

A concern is the model whose data depends on the changing model in question

e.g., An event changes its name. The event's concerns consist only of the owner user. Every client managing data for the user would benefit from learning of the event's new updated name.

### For use in the Hub(link needed)

Elos' hub uses conerns to manage model notifications. The hub listens to a channel of every updated model. When it recieves a model over this channel (implying the model has been updated and persisted) the hub inspects the model's concerns and notifies those concerned.
