## Runnable.
execute unless function nest:_unit/-/-runnable run return run function nest:_unit/-exit

## Run.
execute unless function nest:_unit/-/-running run function nest:_unit/-/-run
## Update.
execute \
  on passengers \
  if entity @s[type=minecraft:text_display,tag=nest.suite] \
  store result score #nest:_unit/-update|state -- \
    run function nest:_suite/-update
## Fail.
execute if score #nest:_unit/-update|state -- <= #nest|fail -- run tag @s add nest.unit.failure
## Error.
execute if score #nest:_unit/-update|state -- = #nest|error -- if function nest:_unit/-abort \
  run return run scoreboard players get #nest|error --

## Continue.
return run scoreboard players get #nest|continue --