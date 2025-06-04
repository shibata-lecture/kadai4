#!/bin/bash

# 少ない場合はエラーメッセージ
# 多い場合
if [ $# -ne 2 ]; then
  echo "input 2 argments" 1>&2
  exit 1
fi




if [ $1 = $2 ]; then
	echo "equal"
else
	echo "not equal"
fi

