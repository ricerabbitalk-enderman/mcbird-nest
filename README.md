# nest

**nest, Nest is Easy and Simple Test unit.**

[English](README.md) / [日本語](README-jp.md)

Helps build a simple test environment using Minecraft's test system.

### Notes
Using mcbird-js/nest.js makes building a test environment even easier.

## Test Cases

### Definition

A test case is a single function (mcfunction).

Returning 0 causes the test to continue, calling the same function again at the next tick.
You need a branch to terminate the test, such as managing the count with a counter.

Returning 1 indicates the test passed.

Returning -1 indicates the test failed.

-2 indicates a fatal error, discarding all subsequent test cases.

Test cases execute functions using the `nest.case` entity as `@s`.

The `nest.case` entity holds `nest.case.tick`, representing the number of ticks since the test started.

Use this as a reference for the number of attempts.

```mcfunction
# Use nest.case.tick.
execute if score @s nest.case.tick = ... run ...

# Error.
execute unless function xxx:check_fatal_error run return -2

# Failure.
execute unless function xxx:do_something run return -1

...

# Success.
execute if ... run return 1

# Continue.
return 0
```

## Test Suite

A test suite is a group that combines multiple test cases into one.

Since the following setup and teardown processes are executed before and after each test case within a test suite, describing common processing required for testing reduces effort.

### Setup and Teardown

Setup and teardown functions are each a single function (mcfunction).

Always return 1 on success and return fail if an error occurs.

Omitting this will cause confusion with fail and result in everything being treated as an error.

```mcfunction
# Initialize (and Failure).
execute unless function xxx:initialize run return fail...



# Success.
return 1
```

## Alias

For test cases, construction, and deconstruction, you must define aliases corresponding to each function.

Aliases are function tags and should be defined in the `data/nest/tags/function/alias/` directory.

Subdirectories are not permitted. Specify flat filenames.

### `data/xxx/function/.../example.mcfunction` (`function xxx:.../example`)

For example, when creating a test case like the following:

```mcfunction
# Use nest.case.tick.
execute if score @s nest.case.tick = ... run ...

# Error.
execute unless function xxx:check_fatal_error run return -2

# Failure.
execute unless function xxx:do_something run return -1

...

# Success.
execute if ... run return 1

# Continue.
return 0
```

### `data/nest/tags/function/alias/case-example.json` (`function #nest:alias/case-sample`)

Aliases are defined like this.

```json
{
  “replace”: true,
  “values”: [
    “xxx:.../example”
  ]
}
```

## Test Unit

### Test Construction
When constructing tests, configure information in `storage nest:test/run <<` before executing `function nest:test/run`.

```mcfunction
data modify storage nest:test/run << set value { \
  unit:..., \
  data:[ \
    { \
      suite:..., \
      setup:xxx-setup, \
      teardown:xxx-teardown, \
      cases:[ \
        case-hoge, \
        case-piyo, \
        case-hogepiyo
      ] \
    }, \
    { \
      suite:..., \
      setup:yyy-setup, \
      teardown:yyy-teardown, \
      cases:[ \
        case-foo, \
        case-bar, \
        case-foobar \
      ] \
    } \
  ] \
}
function nest:test/run
```

This will generate the test environment and automatically start the tests.

To delete it, use `/test clearthise` or similar.

## For Easier Setup

This series of steps can be quite tedious.

A converter for easier setup is provided at mcbird-js/nest.js.
Please feel free to use it.
