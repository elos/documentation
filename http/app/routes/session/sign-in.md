SignIn
------

| Route    |
| -------- |
| /sign-in |

### GET

#### Description
Displays the elos sign in page. Consists of id and key fields with submit button.

![Image of Authentication](/http/app/img/authentication.png)


#### Action
``` c
 1. Serve the sign in page
```

#### Access
 * Open

### POST

#### Description
Authenticates a user

#### Action
``` c
 1. Obtain id and key from form values
 2. Authenticate user
 3. If Authed:
    1. Redirect to [UserCalendar](/http/app/routes/user/calendar.md#get)
 4. Else:
    1. Redirect to [SignIn](/http/app/routes/sign-in.md#get)
    2. Flash error message
```

#### Access
* Open
