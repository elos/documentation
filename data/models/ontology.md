Ontology [![GoDoc](https://godoc.org/github.com/elos/data?status.svg)](https://godoc.org/github.com/elos/models#Ontology)
--------

An ontology is the user's dynamic ontology of [class](class.md) definitions and [object](object.md) instances.

### Implementation
| Kind       | Concerns        |
| ---------- | --------------- |
| ontology   | [user](user.md) |

### Transfer Structure
| Attribute       | JSON Key          | Type              | Access    |
| --------------- | ----------------- | ----------------- | --------- |
| ID              | id                | bson.ObjectId     | Public    |
| CreatedAt       | created_at        | RFC 3339 DateTime | Personal  |
| UpdatedAt       | updated_at        | RFC 3339 DateTime | Personal  |
| UserID          | user_id           | bson.ObjectId     | Personal  |
| ClassIDs        | class_ids         | []bson.ObjectId   | Personal  |
| ObjectIDs       | object_ids        | []bson.ObjectId   | Personal  |