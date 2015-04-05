Class [![GoDoc](https://godoc.org/github.com/elos/data?status.svg)](https://godoc.org/github.com/elos/models#Class)
--------

A class is the formal specification for an class of objects.

### Implementation
| Kind       | Concerns        |
| ---------- | --------------- |
| class      | [user](user.md) |

### Transfer Structure
| Attribute       | JSON Key          | Type                                        | Access    |
| --------------- | ----------------- | ------------------------------------------- | --------- |
| ID              | id                | bson.ObjectId                               | Public    |
| CreatedAt       | created_at        | RFC 3339 DateTime                           | Personal  |
| UpdatedAt       | updated_at        | RFC 3339 DateTime                           | Personal  |
| Name            | name              | string                                      | Personal  |
| UserID          | user_id           | bson.ObjectId                               | Personal  |
| ObjectIDs       | object_ids        | []bson.ObjectId                             | Personal  |
| OntologyID      | ontology_id       | bson.ObjectId                               | Personal  |
| Traits          | traits            | map[string][Trait](trait.md)                | Personal  |
| Relationship    | relationships     | map[string][Relationship](relationship.md)  | Personal  |
