## New key.
data modify storage nest:_test/reset key set value {}
data modify storage nest:_test/reset key.name set from storage nest:_test/reset <<.unit
data modify storage nest:_registry/macro/set << set from storage nest:_test/reset <<.data
function nest:_registry/macro/set with storage nest:_test/reset key

## Success.
return 1