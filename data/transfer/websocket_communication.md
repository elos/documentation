WebSocket Communication
=======================

3 Prerequisites
---------------
Sockets provide a psuedo-synchronous form of communication with a server. There is no blocking on a request (or message) as with traditional HTTP.

Because the communication is bi-directional, the client store can remain up to date without polling the server.

This general and assumed consistency can lead to a guarantee that data is accurate, and allows assumptions to be made on data existence.

Problem
-------

How do you retrieve data for which you only have identifiers, no data? How do you coordinate a server's response to a specific client request? Does this degrade the elos models of agent communication, wherein all agents connected with the same ids receive the updates of a single request?

Solution
--------

Acting as though the identifiers the client has been supplied thus far are guarantees for expected data returns, act aggressively on those promises.

When the need for data arrives, query the server, but move forward synchronously as though you have the data. Instantiate a record with the said id(s) in the store.

The subsequent server POST action with the data should fill in the null (loading) values of the records instantiated on query.

In practice this should prove very quick, as the UI renders along with the servers response over the socket.
