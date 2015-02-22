Fixture
-------

A fixture is a planned future event. Fixtures are composed into [schedules](schedule.md).

### Implementation
| Kind    | Concerns        |
| ------- | --------------- |
| fixture | [user](user.md) |

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
| ScheduleID     | schedule_id     | boolean           | Personal  |
| Description    | description     | string            | Personal  |
