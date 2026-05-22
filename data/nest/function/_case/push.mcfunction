## Finished.
execute unless data storage nest:_case/push <<list[-1] run return 1
## Pop data.
data modify storage nest:_case/-enable <<case set from storage nest:_case/push <<list[-1]
data remove storage nest:_case/push <<list[-1]

## Push.
tag @s add nest.case._vehicle
execute summon minecraft:text_display if function nest:_case/-enable run ride @s mount @e[tag=nest.case._vehicle,limit=1]
tag @s remove nest.case._vehicle

## Recursive call.
return run function nest:_case/push