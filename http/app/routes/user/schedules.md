UserSchedules
-------------

| Route           |
| --------------- |
| /user/schedules |

### GET

#### Description

Main navigation to a user's scheduling facilities. Currently consists of three buttons, namely: "Base," "Weekly," "Yearly"

#### Action
``` c
 1. Serve schedules template
```

#### Access
 * User, if not authenticated redirect to [SignIn](/http/app/routes/sign-in.md#get)
