## Reset loaded.
scoreboard players set #nest:_environment|loaded -- 0
## Auto load request.
execute in nest:_environment positioned 0.0 0.0 0.0 run forceload remove -1 -1 0 0

## Success.
return 1