Event
-----
An event records a state of or the occurance of something happening to the user. For example, "Blood Pressure High" could be an event. Likewise, "Doctor's appointment" may be another. Events should not be confused with actions, which are the directives guiding a user's course. For more on the distinction see [action](action.md). 

Each event belongs to a user and has a start and ending time.

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
