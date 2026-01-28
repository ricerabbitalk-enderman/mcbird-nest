$tellraw @a ["[TEST FAILURE] ",{text:$(text)}]
tellraw @a ["[TEST FAILURE] dump:",{entity:"@s",nbt:"data"}]

return run scoreboard players get #nest|fail --