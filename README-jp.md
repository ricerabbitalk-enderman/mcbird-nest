# nest

**nest, Nest is Easy and Simple Test unit.**

Minecraft のテストシステムを使った簡単なテスト環境構築を手助けします。

### メモ
mcbird-js/nest.js を利用することで、より簡単にテスト環境を構築できます。

## テストケース

### 定義

テストケースは１つの関数 (mcfunction) です。

0 を返すとテストは続行され、次の tick で同じ関数をもう一度呼び出します。
カウンタなどで回数管理をするなどしてテストを終了させる分岐が必要です。

1 を返すとテストは成功します。

-1 を返すとテストは失敗します。

-2 は致命的エラーを意味し、後続のテストケースが全部破棄されます。

テストケースは `nest.case` エンティティを `@s` として関数を実行します。

`nest.case` エンティティは `nest.case.tick` という「テスト開始からの tick 数」を保持しています。

試行回数の参考に利用してください。

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

## テストスイート

テストスイートは複数のテストケースを１つにまとめたグループです。

テストスイート内のテストケースは、下記の構築・解体処理がそれぞれのテストケースの前後に処理されるため、テストに必要な共通の処理を記述しておくことで手間が減ります。

### 構築 (setup) と解体 (teardown)

構築・解体関数はそれぞれ１つの関数 (mcfunction) です。

成功時は必ず 1 を返し、エラーが発生した場合は fail を返してください。

これを省略すると fail と混同されて全部エラー扱いになります。

```mcfunction
# Initialize (and Failure).
execute unless function xxx:initialize run return fail

...

# Success.
return 1
```

## 別名（alias）

テストケース・構築・解体には、それぞれの関数に対応した別名を定義する必要があります。

別名は関数タグであり `data/nest/tags/function/alias/` ディレクトリに定義してください。

サブディレクトリは利用できません。平坦なファイル名を指定してください。

### `data/xxx/function/.../example.mcfunction` (`function xxx:.../example`)

例として下記のようなテストケースを作った場合、

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

別名はこのように定義します。

```json
{
  "replace": true,
  "values": [
    "xxx:.../example"
  ]
}
```

## テストユニット

### テスト構築
テストを構築する際は `storage nest:test/run <<` に情報を設定してから `function nest:test/run` を実行します。

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

これでテスト環境が生成され、自動でテストが開始されます。

削除する際は `/test clearthise` などで削除してください。

## より簡単に構築するために

一連の作業は結構な手間かと思います。

これをより簡単に構築するためのコンバータが mcbird-js/nest.js で提供されています。
ぜひご利用ください。

