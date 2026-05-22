## Clear.
execute in nest:_environment positioned 0.0 0.0 0.0 run test clearall

## Load.
function #nest:load

## Get data.
data modify storage nest:_test/run << set value {}
$data modify storage nest:_test/run <<.unit set value $(unit)
$data modify storage nest:_test/run <<.data set from storage nest:run data._$(unit)
## Run.
execute in nest:_environment positioned 0.0 0.0 0.0 run function nest:_test/run

## Success.
return 1