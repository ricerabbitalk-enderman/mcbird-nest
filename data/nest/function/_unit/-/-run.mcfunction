## Run.
execute on passengers if entity @s[type=minecraft:text_display,tag=nest.suite,tag=!nest.suite.running] \
  run function nest:_suite/-run

## Success.
return 1