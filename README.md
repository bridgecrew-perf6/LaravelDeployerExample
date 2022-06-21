# このプロジェクトについて
このプロジェクトはLaravelプロジェクトをDeployerでデプロイするためのサンプルプロジェクトです。

# 構成
* リポジトリのルートはLaravelプロジェクトです
* dockerコンテナからdockerコンテナにデプロイする構成です
* dockerディレクトリにdocker関連ファイルがあります
* documentsディレクトリはメモなどあります

# コンテナの構成(docker-compose.yml)
* web: 本番サーバー役のコンテナ
* deployer: デプロイ作業するマシン役のコンテナ
* dev: 開発環境役のコンテナ

# 使い方
dockerホスト
```
docker/docker_helper.sh up
docker/docker_helper.sh attach_deployer # deployerに接続
```

deployerのコンテナ内
```
cd /app
composer install
vendor/bin/dep deploy # githubからデプロイ
scp .env web:/app/shared/.env # .envをコピー
vendor/bin/dep deploy # 検証用.envコピーの関係で再度デプロイする必要がある
```

ホストで以下のページにアクセスし、「デプロイされました」という日本語があればGithub無事にリポジトリからデプロイされています。

http://localhost:8000

# メモ
* デプロイ先やデプロイ時の処理はdeploy.phpで定義する
* デプロイ対象のマシンにデプロイするマシンからssh接続できる必要があります.今回はテスト用の鍵を作ってリポジトリに含めています。
