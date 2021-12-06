#!/bin/sh
cd $(dirname $0)

cd ../complete
./gradle build
ret=$?
if [ $ret -ne 0 ]; then
  exit $ret
fi
rm -rf build

cd ../initial
../complete/gradle -b ../initial/build.gradle wrapper
./gradle compileJava
ret=$?
if [ $ret -ne 0 ]; then
  exit $ret
fi
rm -rf build
rm -rf gradle
rm gradle*

exit
