## Initialize scoreboards.
scoreboard players set #nest:_case/-update|success -- 0
scoreboard players operation #nest:_case/-update|state -- = #nest|continue --

## Call case.
data modify storage nest:_alias/macro/call << merge value {}
data modify storage nest:_alias/macro/call <<.name set from entity @s data.nest.case._case.alias
execute at @s \
  store success score #nest:_case/-update|success -- \
  store result score #nest:_case/-update|state -- \
    run function nest:_alias/macro/call with storage nest:_alias/macro/call <<

## Update tick.
scoreboard players add @s nest.tick 1

## Continue.
execute if score #nest:_case/-update|state -- = #nest|continue -- run return run scoreboard players get #nest|continue --

## Fatal error.
execute \
  if score #nest:_case/-update|success -- matches 0 \
  if function nest:_case/-/-fatal_error \
    run scoreboard players operation #nest:_case/-update|state -- = #nest|error --

## Error.
execute if score #nest:_case/-update|state -- = #nest|error -- run function nest:_case/-/-error

## Delete.
function nest:_case/-/-delete
## Return state.
return run scoreboard players get #nest:_case/-update|state --