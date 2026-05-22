## Delete keys.
execute as @e[type=minecraft:marker,tag=nest.key] at @s unless block ~ ~15.5 ~ minecraft:command_block run kill @s

## Delete test proxy (on reset).
kill @e[type=minecraft:marker,tag=nest.proxy.key]

## New unit.
execute as @e[type=minecraft:marker,tag=nest.proxy.unit] at @s if function nest:_test/-/new_unit run kill @s

## Update units.
execute store result score #nest:_test/_tick|result -- as @e[type=minecraft:text_display,tag=nest.unit] run function nest:_test/-/-update_unit