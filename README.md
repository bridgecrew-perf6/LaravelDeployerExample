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
