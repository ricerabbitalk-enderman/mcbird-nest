## Check key.
execute at @s positioned ~ ~-16 ~ unless entity @e[distance=..1,tag=nest.key] if function nest:_test/-/fatal_error \
  at @s as @e[distance=..2,tag=nest.proxy.failure] at @s if function nest:_test/-/set_redstone_block run return 1

## Get registry.
execute at @s positioned ~ ~-16 ~ as @e[distance=..1,tag=nest.key] run data modify storage nest:_test/-/new_unit key set from entity @s data.nest.key
function nest:_registry/macro/get with storage nest:_test/-/new_unit key

## New.
data modify storage nest:_unit/-enable << set value {}
data modify storage nest:_unit/-enable <<.name set from storage nest:_test/-/new_unit key.name
data modify storage nest:_unit/-enable <<.data set from storage nest:_registry/macro/get >>
execute summon minecraft:text_display run function nest:_unit/-enable

## Success.
return 1
