User
----

The user is the primary point of access for elos. A user that logs in is able to access all other pieces of data through this single model.

A user has [actions](action.md), [events](event.md), [tasks](task.md), and [routines](routine.md). Additionally a user has a [calendar](calendar.md), an [ontology](ontology.md), a current [action](action.md) and a current actionable.


### Implementation
| Kind   | Concerns   |
| ------ | ---------- |
| user   | itself     |

### Transfer Structure
| Attribute       | JSON Key          | Type              | Access    |
| --------------- | ----------------- | ----------------- | --------- |
| ID              | id                | bson.ObjectId     | Public    |
| CreatedAt       | created_at        | RFC 3339 DateTime | Personal  |
| UpdatedAt       | updated_at        | RFC 3339 DateTime | Personal  |
| Name            | name              | String            | Personal  |
| Key             | key               | String            | Password  |
| ActionIDs       | action_ids        | []bson.ObjectId   | Personal  |
| EventIDs        | event_ids         | []bson.ObjectId   | Personal  |
| TaskIDs         | task_ids          | []bson.ObjectId   | Personal  |
| RoutineIDs      | routine_ids       | []bson.ObjectId   | Personal  |
| CalendarID      | calendar_id       | bson.ObjectId     | Personal  |
| OntologyID      | ontology_id       | bson.ObjectId     | Personal  |
| CurrentActionID | current_action_id | bson.ObjectId     | Personal  |
| ActionableID    | actionable_id     | bson.ObjectId     | Personal  |
| ActionableKind  | actionable_kind   | string            | Personal  |
