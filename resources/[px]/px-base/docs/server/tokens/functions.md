# Tokens Functions (server side)
Functions usign the 'Tokens' class for generating tokens against dev tool exploiting.

## Px.tokens:new(src)
When called it will check if the current player table holds the propperty tokens if so it uses the one already asigned otherwise it will create one for the player. The function sould be called like this.

```lua
Px.tokens:new(source)
```

## Px.tokens:create(src, resource)
When called it will create and return a token for the given resource

```lua
local token = Px.tokens:create(
    source --[[ number ]],
    GetCurrentResourceName() --[[ string ]]
)

print(token) -- xpl result -> TKN00AAA000AAAA
```

## Px.tokens:check(src, resource, old_token, refresh)
When called it will check if the given token exists for the given resource if wanted it could refesh the token. the player src and resource params need to be there the old_token and refresh params are optional.

In the example below we act as if the given token is correct otherwise think of it as nil was given
```lua
local success, token = Px.tokens:check(
    source --[[ number ]],
    GetCurrentResourceName() --[[ string ]],
    old_token --[[ nil or string ]],
    refesh --[[ nil or bool]]
)

--[[ old_token = nil, refresh = nil ]]
print(
    success --[[ false ]],
    token --[[ false ]]
) 

--[[ old_token = nil, refresh = bool ]]
print(
    success --[[ false ]],
    token --[[ false ]]
)

--[[ old_token = string, refresh = nil ]]
print(
    success --[[ true ]],
    token --[[ false ]]
)

--[[ old_token = string, refresh = bool ]]
print(
    success --[[ true ]],
    token --[[ 'TKN00AAA000AAAA' ]]
)
```

<hr>

### [_*<- Back To Main Page*_](https://github.com/5Pixel-FiveM/px-base#documentation-refrences)