Calendar
-------

A calendar is the central data structure for a user's planned, future "events." In elos, an event or appointment that has been planned for the future is known as a [fixture](fixture.md). Fixtures are arranged in [schedules](schedule.md), which are arranged in a calendar.

Elos's calendar representation keeps track of several schedules:
 - There is a base schedule - the default schedule for _every_ day
 - There are weekday schedules, for each day of the week
 - There are yearday schedules, for each day of the year

Weekday schedules are stored:
```json
    {
        "monday": "<bson.ObjectId>"
    }
 ```

Yearday schedules are stored:
```json
    {
        "109": "<bson.ObjectId>",
        "1231": "<bson.ObjectId>"
    }
 ```

The canonical elos representation of a year day is calculated:

    `100 * time.MonthInteger + time.MonthDay`

For example: December 31st is the integer 1231.

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
| WeekdaySchedules    | weekday_schedules     | map[string]bson.ObjectId            | Personal  |
| YeardaySchedules    | yearday_shedules      | map[string]bson.ObjectId            | Personal  |
| CurrentFixtureID    | current_fixtured_id   | bson.ObjectId                       | Personal  |
