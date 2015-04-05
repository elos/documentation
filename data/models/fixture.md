Fixture
-------

A fixture is a planned future event. Fixtures are composed into [schedules](schedule.md).

Understanding the elos calendrical model is understanding the dichotomy between fixtures and [events](event.md). A fixture is something in the future, something planned, something that has not yet occured. An [event](event.md) is something that is in the past, definitely happened, and already occured. A fixture is the archetype for an [event](event.md).

For example, you may have "Math Lecture," which is a reoccurring fixture every Monday from 9:00-10:30AM. There would, in this case, only be one fixture - that of the weekday [schedule](schedule.md) for Monday. But there would be several [events](event.md): there would be one for every Monday on which the user had attended the lecture.

### Implementation
| Kind    | Concerns        |
| ------- | --------------- |
| fixture | [user](user.md) |

### Transfer Structure
| Attribute      | JSON Key      | Type                  | Access    |
| -------------- | ------------- | --------------------- | --------- |
| ID             | id              | bson.ObjectId       | Public    |
| CreatedAt      | created_at      | RFC 3339 DateTime   | Personal  |
| UpdatedAt      | updated_at      | RFC 3339 DateTime   | Personal  |
| Name           | name            | String              | Personal  |
| StartTime      | start_time      | RFC 3339 DateTime   | Personal  |
| EndTime        | end_time        | RFC 3339 DateTime   | Personal  |
| UserID         | user_id         | bson.ObjectId       | Personal  |
| ActionableKind | actionable_kind | string              | Personal  |
| ActionableID   | actionable_id   | bson.ObjectId       | Personal  |
| EventableKind  | eventable_kind  | string              | Personal  |
| EventableID    | eventable_id    | bson.ObjectId       | Personal  |
| Description    | description     | string              | Personal  |
| Rank           | rank            | int                 | Personal  |
| Label          | label           | boolean             | Personal  |
| Expires        | expires         | RFC 3339 DateTime   | Personal  |
| DateExceptions | date_exceptions | []RFC 3339 DateTime | Personal  |
| ScheduleID     | schedule_id     | bson.ObjectId       | Personal  |
| ActionIDs      | action_ids      | []bson.ObjectId     | Personal  |
| EventIDs       | event_ids       | []bson.ObjectId     | Personal  |
