# このプロジェクトについて
このプロジェクトはLaravelプロジェクトをDeployerでデプロイするためのサンプルプロジェクトです。

# 構成
* リポジトリのルートはLaravelプロジェクトです
* dockerコンテナからdockerコンテナにデプロイする構成です
* dockerディレクトリにdocker関連ファイルがあります
* documentsディレクトリはメモなどあります

# 使い方
ホスト
```
docker/docker_helper.sh up
docker/docker_helper.sh attach_deployer
```

deployerのコンテナ内
```
composer install
vendor/bin/dep deploy # githubからデプロイ
```

ホストで以下のページにアクセスし、webが更新されることを確認
http://localhost:8000

# メモ
* デプロイ対象のマシンにデプロイするマシンからssh接続できる必要があります

デプロイ後に↓が必要だった。たぶん何かをすれば不要になるけど。
php artisan route:clear
php artisan cache:clear
php artisan config:clear
php artisan view:clear
npm run dev
php artisan key:generate
