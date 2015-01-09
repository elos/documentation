Concerns
--------

Each model in elos has concerns. A model's "concerns" is a list of IDs of the users interested in this models creation, mutation or deleteion. Concerns are the primary means of managing which client nodes receive updated data. Concerns govern the [transfer propogation](link needed) of data.

A concern is the model who depends on the changing model in question

e.g., An event changes its name. The event's concerns consist of the owner user. Every client managing data for the user should be informed of the even's updated name.

### For use in the Hub(link needed)

Elos' hub uses conerns to manage model notifications. The hub listens to a channel of every updated model. When it recieves a model over this channel (implying the model has been updated and persisted) the hub inspects the model's concerns and notifies those concerned.
