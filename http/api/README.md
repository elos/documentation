### Elos HTTP Web API

#### Routes

##### V1
| Action      | Endpoint                          | Name                                                                               | Access                          |
| ----------- | --------------------------------- | ---------------------------------------------------------------------------------- | ------------------------------- |
| POST        | /v1/users                         | [Users](/http/api/routes/v1/users.md#post)                                         | Open                            |
| POST        | /v1/events                        | [Events](/http/app/routes/v1/events.md#post)                                       | ElosAuth                        |
| GET         | /v1/authenticate                  | [SignIn](/http/app/routes/v1/sign-in.md#get)                                       | SocketAuth                      |
| GET         | /v1/repl                          | [Register](/http/app/routes/v1/repl.md#get)                                        | SocketAuth                      |
