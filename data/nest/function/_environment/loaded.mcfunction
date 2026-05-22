## Loaded.
execute unless score #nest:_environment|loaded -- matches 0 run return 1

## Load.
execute \
  in nest:_environment \
  if loaded 0 0 0 \
  if loaded -1 0 0 \
  if loaded -1 0 -1 \
  if loaded 0 0 -1 \
    run return run scoreboard players set #nest:_environment|loaded -- 1

## Unloaded yet.
return 0