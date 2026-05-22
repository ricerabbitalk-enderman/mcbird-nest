## Set scoreboard.
scoreboard players set @s nest.suite.cases 0
scoreboard players set @s nest.suite.errors 0
scoreboard players set @s nest.suite.passes 0
## Set data.
data modify entity @s data merge value {nest:{suite:{}}}
data modify entity @s data.nest.suite._setup set from storage nest:_suite/-enable <<.setup
data modify entity @s data.nest.suite._teardown set from storage nest:_suite/-enable <<.teardown
data modify entity @s data.nest.suite._suite set from storage nest:_suite/-enable <<.suite
data modify entity @s CustomName set string storage nest:_suite/-enable <<.suite 1
## Add tags.
tag @s add nest.suite

## Push cases.
data modify storage nest:_case/push <<list set from storage nest:_suite/-enable <<.cases
function nest:_case/push

## Success.
return 1