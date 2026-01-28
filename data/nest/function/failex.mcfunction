$tellraw @a ["[TEST FAILURE] ",{text:$(message)}]
$tellraw @a ["[TEST FAILURE] file:",{text:$(file)},"(",{text:$(line)},")"]
tellraw @a ["[TEST FAILURE] dump:",{entity:"@s",nbt:"data"}]

return run scoreboard players get #nest|fail --