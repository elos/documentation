User
----

Kind: user

#### Fields
| Field         | JSON          | Type          | Access    |
| ------------- | ------------- | ------------- | --------- |
| Id            | id            | bson.ObjectId | Public    |
| CreatedAt     | created_at    | ISO Date      | Personal  |
| Name          | name          | String        | Personal  |
| Key           | key           | String        | Private   |
| EventIds      | event_ids     | []Event       | Personal  |

The user is the primary point of access for elos. A user that logs in is able to access all other pieces of data through this single model.
