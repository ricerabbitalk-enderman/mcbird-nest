## Report.
data modify storage nest:_suite/-/macro/report << merge value {}
execute store result storage nest:_suite/-/macro/report <<.cases int 1 run scoreboard players get @s nest.suite.cases
execute store result storage nest:_suite/-/macro/report <<.passes int 1 run scoreboard players get @s nest.suite.passes
execute store result storage nest:_suite/-/macro/report <<.errors int 1 run scoreboard players get @s nest.suite.errors
function nest:_suite/-/macro/report with storage nest:_suite/-/macro/report <<

## Success.
return 1