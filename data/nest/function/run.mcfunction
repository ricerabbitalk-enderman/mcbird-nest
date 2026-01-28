function #nest:load

data modify storage nest:test/run << set value {}
$data modify storage nest:test/run <<.unit set value $(unit)
$data modify storage nest:test/run <<.data set from storage nest:data $(unit)

function nest:test/run
