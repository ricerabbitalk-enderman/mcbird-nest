## Runnable.
execute \
  unless function nest:_suite/-/-runnable \
  if function nest:_suite/-/-report \
    run return run function nest:_suite/-/-exit

## Run.
execute \
  unless function nest:_suite/-/-running \
  unless function nest:_suite/-/-run \
    run return run scoreboard players get #nest|error --

## Update.
scoreboard players operation #nest:_suite/-update|state -- = #nest|continue --
execute \
  on passengers \
  if entity @s[type=minecraft:text_display,tag=nest.case,tag=nest.case.running] \
  store result score #nest:_suite/-update|state -- \
    run function nest:_case/-update

## Continue.
execute if score #nest:_suite/-update|state -- = #nest|continue -- run return run scoreboard players get #nest|continue --

## Set result.
scoreboard players add @s nest.suite.cases 1
execute if score #nest:_suite/-update|state -- = #nest|error -- run scoreboard players add @s nest.suite.errors 1
execute if score #nest:_suite/-update|state -- = #nest|fail -- run scoreboard players add @s nest.suite.errors 1
execute if score #nest:_suite/-update|state -- = #nest|pass -- run scoreboard players add @s nest.suite.passes 1

## Teardown.
execute \
  unless function nest:_suite/-/-teardown \
  if function nest:_suite/-/-delete \
    run return run scoreboard players get #nest|error --

## Abort.
execute \
  if score #nest:_suite/-update|state -- = #nest|error -- \
  if function nest:_suite/-/-report \
  if function nest:_suite/-/-delete \
    run return run scoreboard players get #nest|error --

##Continue.
return run scoreboard players get #nest|continue --