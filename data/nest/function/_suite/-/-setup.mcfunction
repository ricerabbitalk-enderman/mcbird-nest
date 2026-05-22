## Check.
execute unless data entity @s data.nest.suite._setup run return 1

## Setup.
data modify storage nest:_alias/macro/call << merge value {}
data modify storage nest:_alias/macro/call <<.name set from entity @s data.nest.suite._setup
execute at @s store success score #nest:_suite/-/-setup|success -- \
  run function nest:_alias/macro/call with storage nest:_alias/macro/call <<

## Success.
execute unless score #nest:_suite/-/-setup|success -- matches 0 run return 1

## Fatal error.
function nest:_suite/-/macro/fatal_error {type:setup}
return fail