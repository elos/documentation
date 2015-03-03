Calendar
-------

A calendar is the central data structure for a user's planned, future "events." In elos, an event or appointment that has been planned for the future is known as a [fixture](fixture.md). Fixtures are arranged in [schedules](schedule.md), which are arranged in a calendar.

Elos's calendar representation keeps track of several schedules:
 - There is a base schedule - the default schedule for _every_ day
 - There is a day schedule, for each day of the week - the default schedule for _said_ day
 - There are date-specific unique schedule additions and overrides

Though the calendar model is the basic data structure, the actual calendar resolution is implemented in an agent that is acting on behalf of a user.

### Implementation
| Kind     | Concerns        |
| -------- | --------------- |
| calendar | [user](user.md) |

### Transfer Structure
| Attribute           | JSON Key              | Type                                | Access    |
| ------------------- | --------------------- | ----------------------------------- | --------- |
| ID                  | id                    | bson.ObjectId                       | Public    |
| CreatedAt           | created_at            | RFC 3339 DateTime                   | Personal  |
| UpdatedAt           | updated_at            | RFC 3339 DateTime                   | Personal  |
| UserID              | user_id               | bson.ObjectId                       | Personal  |
| BaseScheduleID      | base_schedule_id      | bson.ObjectId                       | Personal  |
| MondayScheduleID    | monday_schedule_id    | bson.ObjectId                       | Personal  |
| TuesdayScheduleID   | tuesday_schedule_id   | bson.ObjectId                       | Personal  |
| WednesdayScheduleID | wednesday_schedule_id | bson.ObjectId                       | Personal  |
| ThursdayScheduleID  | thursday_schedule_id  | bson.ObjectId                       | Personal  |
| FridayScheduleID    | friday_schedule_id    | bson.ObjectId                       | Personal  |
| SaturdayScheduleID  | saturday_schedule_id  | bson.ObjectId                       | Personal  |
| SundayScheduleID    | sunday_schedule_id    | bson.ObjectId                       | Personal  |
| ScheduleIDs         | schedules             | map[int]bson.ObjectId               | Personal  |
