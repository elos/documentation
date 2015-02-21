User
----

| Kind   | Concerns   |
| ------ | ---------- |
| user   | itself     |

#### Structure
| Attribute     | JSON Key      | Type              | Access    |
| ------------- | ------------- | ----------------- | --------- |
| ID            | id            | bson.ObjectId     | Public    |
| CreatedAt     | created_at    | RFC 3339 DateTime | Personal  |
| UpdatedAt     | updated_at    | RFC 3339 DateTime | Personal  |
| Name          | name          | String            | Personal  |
| Key           | key           | String            | Password  |
| EventIDs      | event_ids     | []bson.ObjectId   | Personal  |

The user is the primary point of access for elos. A user that logs in is able to access all other pieces of data through this single model.
