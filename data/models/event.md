Event
-----

| Kind   | Concerns
| ------ | ----------|
| event  | [user](https://github.com/elos/documentation/blob/master/data/models/user.md) |

#### Fields
| Field         | JSON          | Type          | Access    |
| ------------- | ------------- | ------------- | --------- |
| Id            | id            | bson.ObjectId | Public    |
| CreatedAt     | created_at    | ISO Date      | Personal  |
| Name          | name          | String        | Personal  |
| StartTime     | start_time    | ISO DateTime  | Personal  |
| EndTime       | end_time      | ISO DateTime  | Personal  |
| UserId        | user_id       | bson.ObjectId | Personal  |

The event is the primary means of scheduling in elos. A user has many events. Each event belongs to a user and has a start and ending time.
