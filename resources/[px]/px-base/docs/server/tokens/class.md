# Tokens Class (server side)
Class for generating tokens against dev tool exploiting.
<hr>
<br>

## Tokens:new(tbl)
This functions requires a table as parameter, you call this function and create a new token table for every player.

When called it should look like this.
<br>
<br>

```lua
Px.players[source].tokens = Tokens:new({
    name = Px.players[source].name,
    made = {}
})
```

Add the property made to the tbl param and asign an empty table to it so the class is able to store the created tokens in memory.
<hr>
<br>

## Tokens:create(resource, cb)
This function checks if there a table asigned to the made table with the resource as key.

If this isn't the case it will asign an empty table where the created tokens for the current resource are stored.

After that it wil call the 'Tokens:brew' function when it recieves the created token it will be returned to the callback as an parameter like shown below.
<br>
<br>

```lua
Px.players[source].tokens:create(GetCurrentResourceName(), function(myNewToken)
    print('created Tokens: '..myNewToken)
end)
```
<hr>
<br>

## Tokens:brew(resource)
Creates a token and stores it within the current resource table that the 'Tokens:create' function made, after it will return the created token.
<hr>
<br>

## Tokens:check(resource, token, cb)
Once a token is given back by the js file you want to check if it is a valid token thats where you call this function which will check if there is a table asigned to the made table for the current resource. then it will call the 'Tokens:delete' function and checks if it recieved info if the returned info is nil the asigns a message printed to the server which shows the given token, who passed it on and the format of a normal token for the human verification that it was created by the player or if there is any mistake. this function also returns a bool to determit the success of finding the given token which will be returned to the callback as parameter like shown below.
<br>
<br>

```lua
Px.players[source].tokens:check(GetCurrentResourceName(), tokenGivenByPlayer, function(success)
    if success then
        -- code here
    end
    if not success then
        -- code here
    end
end)
```

The 'if not success' should only be used in case the player closes a nui application which doesn't return a token and deletes all the tokens for the given resource by default. if you use this if statement for a token check it could be a security risk which is the opposite point of this functionality (lul).
<hr>
<br>

## Tokens:delete(resource, token)
This function checks if there is any token given back by the player if this is the case it will loop through the table of the given resource and check if it finds the given token. if so the token will be removed from the table and success will return true. If there isn't any token given back by the player (which could be on purpose like mentioned above but for this example we say it isn't) the function will automaticly remove all the tokens for the given resource so the player can't get lucky and gues the correct token in this case the function returns the print info as nil and the success as false. 
<hr>

### [_*<- Back To Main Page*_](https://github.com/5Pixel-FiveM/px-base#documentation-refrences)