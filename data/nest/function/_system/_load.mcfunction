## Define scoreboards.
# Variable.
scoreboard objectives add -- dummy

## Set environment.
gamerule advance_time false
gamerule advance_weather false
time set minecraft:noon

## Load environment.
function nest:_environment/_load

## Setup data.
data modify storage nest:run data set value {}