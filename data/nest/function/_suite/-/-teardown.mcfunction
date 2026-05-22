## Check.
execute unless data entity @s data.nest.suite._teardown run return 1

## Teardown.
data modify storage nest:_alias/macro/call << merge value {}
data modify storage nest:_alias/macro/call <<.name set from entity @s data.nest.suite._teardown
execute at @s store success score #nest:_suite/-/-teardown|success -- \
  run function nest:_alias/macro/call with storage nest:_alias/macro/call <<

## Fatal error.
execute unless score #nest:_suite/-/-teardown|success -- matches 0 run return 1

## Fatal error.
function nest:_suite/-/macro/fatal_error {type:teardown}
return fail