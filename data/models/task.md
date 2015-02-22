Task
----

A task is the archetypal action.


### Implementation
| Kind   | Concerns        |
| ------ | --------------- |
| task   | [user](user.md) |

### Transfer Structure
| Attribute      | JSON Key      | Type                | Access    |
| -------------- | ------------- | ------------------- | --------- |
| ID             | id              | bson.ObjectId     | Public    |
| CreatedAt      | created_at      | RFC 3339 DateTime | Personal  |
| UpdatedAt      | updated_at      | RFC 3339 DateTime | Personal  |
| Name           | name            | String            | Personal  |
| StartTime      | start_time      | RFC 3339 DateTime | Personal  |
| EndTime        | end_time        | RFC 3339 DateTime | Personal  |
| UserID         | user_id         | bson.ObjectId     | Personal  |
| Completed      | completed       | boolean           | Personal  |
| ActionableKind | actionable_kind | string            | Personal  |
| ActionableID   | actionable_id   | bson.ObjectId     | Personal  |
