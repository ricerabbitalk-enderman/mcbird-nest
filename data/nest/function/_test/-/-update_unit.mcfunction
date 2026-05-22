## Update.
execute store result score #nest:_test/-/-update_unit|result -- run function nest:_unit/-update

## Set result.
# Success
execute if score #nest:_test/-/-update_unit|result -- >= #nest|pass -- \
  at @s as @e[distance=..2,tag=nest.proxy.success] at @s if function nest:_test/-/set_redstone_block if function nest:_test/-/say_pass run kill @s
# Failure
execute if score #nest:_test/-/-update_unit|result -- <= #nest|fail -- \
  at @s as @e[distance=..2,tag=nest.proxy.failure] at @s if function nest:_test/-/set_redstone_block if function nest:_test/-/say_fail run kill @s

## Return result.
return run scoreboard players get #nest:_test/-/-update_unit|result --