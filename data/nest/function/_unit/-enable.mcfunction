## Set data.
data modify entity @s CustomName set string storage nest:_unit/-enable <<.name 1
## Add tags.
tag @s add nest.unit

## Push suites.
data modify storage nest:_suite/push <<list set from storage nest:_unit/-enable <<.data
function nest:_suite/push

## Success.
return 1