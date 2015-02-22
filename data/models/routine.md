Routine
-------

A routine is a collection of [tasks](task.md).


### Implementation
| Kind    | Concerns        |
| ------- | --------------- |
| routine | [user](user.md) |

### Transfer Structure
| Attribute        | JSON Key           | Type                 | Access    |
| ---------------- | ------------------ | -------------------- | --------- |
| ID               | id                 | bson.ObjectId        | Public    |
| CreatedAt        | created_at         | RFC 3339 DateTime    | Personal  |
| UpdatedAt        | updated_at         | RFC 3339 DateTime    | Personal  |
| Name             | name               | String               | Personal  |
| StartTime        | start_time         | RFC 3339 DateTime    | Personal  |
| EndTime          | end_time           | RFC 3339 DateTime    | Personal  |
| UserID           | user_id            | bson.ObjectId        | Personal  |
| TaskIDs          | task_ids           | []bson.ObjectId      | Personal  |
| CompletedTaskIDs | completed_task_ids | []bson.ObjectId      | Personal  |
| ActionIDs        | action_ids         | []bson.ObjectId      | Personal  |
| CurrentActionID  | current_action_id  | bson.ObjectIdA       | Personal  |
