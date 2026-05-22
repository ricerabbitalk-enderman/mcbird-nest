## Create test.
test run nest:unit

## New key.
data modify storage nest:_key/-enable <<name set from storage nest:_test/run <<.unit
data modify storage nest:_registry/macro/set << set from storage nest:_test/run <<.data
execute as @e[type=minecraft:marker,tag=nest.proxy.key] at @s positioned ~ ~-16 ~ \
  summon minecraft:marker if function nest:_key/-enable run function nest:_registry/macro/set with entity @s data.nest.key
## Kill proxy.
kill @e[type=minecraft:marker,tag=nest.proxy.key]

## Success.
return 1