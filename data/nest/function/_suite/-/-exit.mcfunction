## Get errors.
scoreboard players operation #nest:_suite/-exit|errors -- = @s nest.suite.errors

## Delete.
function nest:_suite/-/-delete

## Return state.
execute if score #nest:_suite/-exit|errors -- matches 1.. run return run scoreboard players get #nest|fail --
return run scoreboard players get #nest|pass --