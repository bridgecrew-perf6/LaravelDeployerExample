#!/bin/sh
echo "0" >> /tmp/hoge
nginx
status=$?
if [ $status -ne 0 ]; then
  echo "E0" >> /tmp/hoge
  echo "Failed to start nginx: $status"
  exit $status
fi

echo "1" >> /tmp/hoge
php-fpm -D
status=$?
if [ $status -ne 0 ]; then
  echo "E1" >> /tmp/hoge
  echo "Failed to start php-fpm: $status"
  exit $status
fi

echo "2" >> /tmp/hoge
/usr/sbin/sshd -D
status=$?
if [ $status -ne 0 ]; then
  echo "E2" >> /tmp/hoge
  echo "Failed to start sshd: $status"
  exit $status
fi
echo "3" >> /tmp/hoge
