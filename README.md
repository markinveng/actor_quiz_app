# 環境構築
## APIキーの追加
1. TMDBの[アカウントを作成](URL "https://www.themoviedb.org/signup")します
2. APIの[設定ページ](URL "https://www.themoviedb.org/settings/api")からAPIキーをコピーします
3. ルートフォルダに.envファイルを作成し、APIキーを以下のフォーマットでペーストします
```env
KEY=[API_KEY]
```
## コマンド
- クローン
```sh
## https
git clone https://github.com/markinveng/actor_quiz_app.git
## ssh
git clone git@github.com:markinveng/actor_quiz_app.git   
```
- パッケージインストール
```sh
fvm flutter pub get
```
- 国際化テキストの生成
```sh
fvm flutter gen-l10n  --no-nullable-getter 
```
- 生成コードの生成(Freezed, Riverpod generator, Envied)
```sh
fvm flutter pub run build_runner build --delete-conflicting-outputs
```
- 実行
```sh
fvm flutter run
```