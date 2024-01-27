## コマンド
- クローン
```sh
git clone 
```
- パッケージインストール
```sh
fvm flutter pub get
```
- 生成コードの生成
```sh
fvm flutter pub run build_runner build --delete-conflicting-outputs
```
- 国際化テキストの生成
```sh
fvm flutter gen-l10n  --no-nullable-getter 
```