#!/bin/sh

CONCURRENT_COUNT=100
NUM_PROCESS=0

check() {
  curl localhost:8000/hello/$i
}

for i in `seq 1 1 100`; do
  let NUM_PROCESS=${NUM_PROCESS}+1

  check &
  if ( (test $NUM_PROCESS -ge $CONCURRENT_COUNT ) ) ; then
    wait
    NUM_PROCESS=0;
  fi
done;

wait;

