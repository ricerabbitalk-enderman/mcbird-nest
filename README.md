# mcbird-nest ver.2.0

**nest** は、Minecraftのテストシステムを使った**簡単な単体テスト環境**です。

`mcbird-js/nest.js` で変換したテスト用データパックを、nestデータパックで実行できます。

### 基本的な使い方

```mcfunction
function nest:run {unit:"テストユニット名"}
```

* テストは専用のテストディメンションで実行されます。
* 2000 tick（100秒）でタイムアウトします。
* 目視確認が必要なテストは `in minecraft:overworld` で強制移動させてください。

**詳細なテストケースの書き方は [mcbird-js](https://github.com/ricerabbitalk-enderman/mcbird-js) を参照してください。**