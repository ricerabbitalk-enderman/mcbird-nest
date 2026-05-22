## Reset loaded.
scoreboard players set #nest:_environment|loaded -- 0
## Force load request.
execute in nest:_environment positioned 0.0 0.0 0.0 run forceload add -1 -1 0 0

## Success.
return 1