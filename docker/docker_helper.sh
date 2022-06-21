#!/bin/bash
PROJECT_NAME="deployer_example"
SCRIPT_DIR=$(cd $(dirname $0);pwd)

usage(){
  echo "Usage: docker_helper.sh command"
}
case $1 in
  "up" )
    docker-compose -p $PROJECT_NAME -f $SCRIPT_DIR/docker-compose.yml up -d
  ;;
  "stop" )
    docker-compose -p $PROJECT_NAME -f $SCRIPT_DIR/docker-compose.yml stop
  ;;
  "build" )
    docker-compose -p $PROJECT_NAME -f $SCRIPT_DIR/docker-compose.yml build
  ;;
  "build_no_cache" )
    docker-compose -p $PROJECT_NAME -f $SCRIPT_DIR/docker-compose.yml build --no-cache
  ;;
  "attach_deployer" )
    docker exec -it `docker ps -q -f name=${PROJECT_NAME}_deployer` bash
  ;;
  "attach_web" )
    docker exec -it `docker ps -q -f name=${PROJECT_NAME}_web` bash
  ;;
  "copy_dotenv" )
    docker cp ${SCRIPT_DIR}/../.env `docker ps -q -f name=${PROJECT_NAME}_web`:/app/shared
  ;;
  "attach_dev" )
    docker exec -it `docker ps -q -f name=${PROJECT_NAME}_dev` bash
  ;;
  * )
    usage
  ;;
esac
