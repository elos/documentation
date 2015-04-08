Object [![GoDoc](https://godoc.org/github.com/elos/data?status.svg)](https://godoc.org/github.com/elos/models#Object)
--------

An object is an instance of a [class](class.md).

### Implementation
| Kind       | Concerns        |
| ---------- | --------------- |
| object     | [user](user.md) |

### Transfer Structure
| Attribute       | JSON Key          | Type                                        | Access    |
| --------------- | ----------------- | ------------------------------------------- | --------- |
| ID              | id                | bson.ObjectId                               | Public    |
| CreatedAt       | created_at        | RFC 3339 DateTime                           | Personal  |
| UpdatedAt       | updated_at        | RFC 3339 DateTime                           | Personal  |
| Name            | name              | string                                      | Personal  |
| UserID          | user_id           | bson.ObjectId                               | Personal  |
| ClassID         | class_id          | bson.ObjectId                               | Personal  |
| OntologyID      | ontology_id       | bson.ObjectId                               | Personal  |
| Traits          | traits            | map[string]string                           | Personal  |
| Relationship    | relationships     | map[string]mongo.IDSet                      | Personal  |
