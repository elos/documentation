Winter 2016 Progress

Past
----

Over break I pursued a new idea for an interface for elos. I have been dissapointed in the past that I could conjure up these ontologies and systems and models for doing things only have to then need to design an entire user interface to go along with it. I think it is fair to say that GUI programming is a distinct form of programming in itself, and today it is loathesomely tied to platforms. In order to build an elos iOS app I must learn swift and cocoa, but in order to build an android app, I must learn the android SDKs. In order to build a web app I must learn some sort of framework. And I'm not sure how to build a native app.  On the one hand you have hegemony, where a single company controls an entire ecosystem. On the other hand, you find fragmentation with the plethora of web standards and varying degrees of implementation. And it was paralyzing.

So I began to consider: what if elos just had a text interface. You need only send text messages, and the interface need only respond to them. It reminded me of how when I worked at Zeal, we used to use a console to checkin on the database, make changes to data, and generally just manage things. That was the most powerful interface we had at our disposal. More powerful than any 'admin' site we ever built. So that got me thinking about text based interface. Command based interfaces. I had log thought that it would be cool to have an elos console, where you could build and interact with your own elos objects, but I had never thought about having elos start as a CLI.

That is the history of how I came to architect and build an elos command line interface. And it has been working, allowing me to test out some of the ideas I have long held. I also wanted to move Devan's LocateMe app into the elos ecosystem, and get it posting events to elos. It was a tremendous thing that you got that off the ground and it deserved to be connected, when I saw the demo over winter break I could see elos coming together. So I needed to build a server that could allow Devan to modify records in the elos ontology, and have them be persisted to the elos database.

I put one together, and it is tremendously simple compared to it's predecessors. I call it gaia, for lack of a better name, and it lives in it's namesake repository on github. I have documented the two HTTP endpoints.

Before I came back to Berkeley I "released" elos v0.1. The command line interface is available [here](https://github.com/elos/elos/releases/tag/v0.1). It is a binary built for OSX, and dropping it somewhere in your PATH should give you the command. It should give you the command. It contains the todo, habit and people commands. It also includes a setup command that will either create an account or configure the command with the information about your current account. The command calls home to a gaia server running on an EC2 box. It currently does not use HTTP, and therefore is really not secure.

Future
------

I'd like to hear your thoughts but I think we can start to be more goal oriented, as you mentioned before, setting up rough timelines.

    - Get LocateMe calling home to Gaia, posting location events
    - Prototype the command interface you envisaged and setup the stream for communicating with a socket
