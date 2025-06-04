#!/bin/bash

# 少ない場合はエラーメッセージ
# 多い場合


if [ $1 = $2 ]; then
	echo "equal"
else
	echo "not equal"
fi

