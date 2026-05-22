## Set data.
data modify entity @s data merge value {nest:{key:{}}}
data modify entity @s data.nest.key.name set from storage nest:_key/-enable <<name
## Add tags.
tag @s add nest.key

## Success.
return 1
