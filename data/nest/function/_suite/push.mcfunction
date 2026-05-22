## Finished.
execute unless data storage nest:_suite/push <<list[-1] run return 1
## Pop data.
data modify storage nest:_suite/-enable << set from storage nest:_suite/push <<list[-1]
data remove storage nest:_suite/push <<list[-1]

## Push.
tag @s add nest.suite._vehicle
execute summon minecraft:text_display if function nest:_suite/-enable run ride @s mount @e[tag=nest.suite._vehicle,limit=1]
tag @s remove nest.suite._vehicle
## Recursive call.
return run function nest:_suite/push