Protocol
--------

The transfer protocol is purely JSON. The general form is:

```json
{
  "action": "<action>",
  "data": {
    "<kind>":{
      "some":"data"
    }
  }
}
```

There are 5 recognized actions:

| Action | JSON String | Server | Client |
| ------ | ----------- | ------ | ------ |
| Post   | "POST"      | X      | X      |
| Delete | "DELETE"    | X      | X      |
| Get    | "GET"       |        | X      |
| Sync   | "SYNC"      |        | X      |
| Echo   | "ECHO"      |        | X      |

#### Post

A post is issued to create or update a record. Both the server and clients issue a post. Recall that though the clients and server can both "create" and "id" records, the server is the master in terms of data vetting and persistence.

##### Client:

```json
{
  "action": "POST",
  "data": {
    "event": {
      "id": "lkajdsf12",
      "name": "This is my new event",
      "start_time": "2014-7-13-101200",
      "end_time": "2014-7-13-101200",
      "user_id": "asdfk1kl1"
    }
  }
}
```

##### Server:

###### Success:

```json
  {
    "action": "POST",
    "data": {
      "event": {
        "id": "lkajdsf12",
        "name": "This is my new event",
        "start_time": "2014-7-13-101200",
        "end_time": "2014-7-13-101200",
        "user_id": "asdfk1kl1"
    }
  }
}
```

###### Failure:

```json
    {
        "action": "DELETE",
        "data": {
            "event": {
                "id": "lkajdsf12",
            }
        }
    }
```

Notice that the client is able and permitted to populate the id. The server's response is confirmation can be viewed as a decision and action on whether the data should stand.

#### Delete

Delete is issued to remove a record.

##### Client

```json
  {
    "action": "DELETE",
    "data": {
      "event": {
        "id": "kaljslfjk1",
         "name": "This is my new event",
         "start_time": "2014-7-13-101200",
         "end_time": "2014-7-13-101200",
         "user_id": "asdfk1kl1"
    }
  }
}
```

All the model information is necessary, under the conditions that the server may be unable to actually reach the database to determine why the model could not be deleted. In that case, the best option is simply to return the information to the client.

##### Server:

###### Success:

```json
{
    "action": "DELETE",
    "data": {
        "event": {
          "id": "kaljslfjk1",
          "name": "This is my new event",
          "start_time": "2014-7-13-101200",
          "end_time": "2014-7-13-101200",
          "user_id": "asdfk1kl1"
        }
    }
}
```

No response is required.

###### Failure:

```json
{
  "action": "POST",
  "data": {
    "event": {
      "id": "kaljslfjk1",
      "name": "This is my new event",
      "start_time": "2014-7-13-101200",
      "end_time": "2014-7-13-101200",
      "user_id": "asdfk1kl1"
    }
  }
}
```


#### GET

##### Client:

```json
{
  "action": "GET",
  "data": {
    "event": {
      "id": "alksdj1"
    }
  }
}
  ```

##### Server:

```json
{
  "action": "POST",
  "data": {
    "event": {
      "id": "alksdfj1",
      "name": "This is the event",
      "start_time": "2014-7-13-101200",
      "end_time": "2014-7-13-101200",
      "user_id": "asdfk1kl1"
    }
  }
}
```

#### Sync

A sync is the clients method of notifying the server it has been offline, and would like the most recent data since it's last request.

##### Client

```json
{
    "action": "SYNC",
    "data": {
        "last_communication": "2014-7-13-101200",
    }
}
```

##### Server

The server responds with POSTs and DELETEs as necessary.

#### Echo

Echo is used for testing. The server will simply respond with the same payload it was sent.



