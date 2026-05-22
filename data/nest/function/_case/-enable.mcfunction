## Set scoreboards.
scoreboard players set @s nest.tick 0

## Set data.
data modify entity @s data merge value {nest:{case:{}}}
data modify entity @s data.nest.case._case set from storage nest:_case/-enable <<case
data modify entity @s CustomName set string storage nest:_case/-enable <<case.name 6
## Add tags.
tag @s add nest.case

## Success.
return 1