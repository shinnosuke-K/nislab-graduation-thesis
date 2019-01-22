# graduation_thesis

## Usage

`thesis.tex` というファイルに書いていってください

## Init

最初に環境を整えるために実行してください

```bash
make install-dependency
```

## Auto Build by watching file

これを実行するとtexファイルを監視して変更時にbuildしてくれます.

```bash
make watch
```

これを実行すると `img/` を監視して画像ファイル追加時に `.eps` ファイルに変更してくれます.

```bash
make watch-img
```

## Manual Build 

texファイルをbuildする

```bash
make build
```

画像ファイルを `.eps` に変換する.

```bash
make convert-img
```
