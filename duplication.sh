#!/bin/bash

if [ -z "$1" ]
  then echo "Usage: ./duplication.sh [src] [test]"
  exit 1
fi

src=`find $1 -name '*.js' -print0 | xargs -0 node_modules/.bin/uglifyjs 2>/dev/null`
tst=`find $2 -name '*.js' -print0 | xargs -0 node_modules/.bin/uglifyjs 2>/dev/null`

(diff <(echo "$src") <(echo "$tst") > /dev/null && echo "Test succeeded!") || (echo "Test failed!" && exit 1)
