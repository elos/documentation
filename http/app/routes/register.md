### Register

| Route     |
| --------- |
| /register |

#### GET

##### Description
Displays the elos registration page

![Image of Registration](/http/app/img/registration.png)

##### Action
 1. Serve elos registration page

##### Access
 * Open

#### POST

##### Description
Register a user

##### Action
 1. Obtain name form value
 2. If name good:
    1. Create user with name, generated id and key
    2. Server elos account-created page
 3. Else:
    1. Redirect to [Register](/http/app/routes/register.md#get)
    2. Flash error message

##### Access
 * Open
