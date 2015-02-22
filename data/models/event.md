Event
-----
The event is the primary means of scheduling in elos. A user has many events. Each event belongs to a user and has a start and ending time.

### Implementation
| Kind   | Concerns        |
| ------ | --------------- |
| event  | [user](user.md) |

### Transfer Structure
| Attribute     | JSON Key      | Type               | Access    |
| ------------- | ------------- | ------------------ | --------- |
| ID            | id            | bson.ObjectId      | Public    |
| CreatedAt     | created_at    | RFC 3339 DateTime  | Personal  |
| UpdatedAt     | updated_at    | RFC 3339 DateTime  | Personal  |
| Name          | name          | String             | Personal  |
| StartTime     | start_time    | RFC 3339 DateTime  | Personal  |
| EndTime       | end_time      | RFC 3339 DateTime  | Personal  |
| UserID        | user_id       | bson.ObjectId      | Personal  |
