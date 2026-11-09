#!/bin/bash
# 隨機產生 3 個 N，比對程式輸出與公式 N(N+1)/2
pass=0
for t in 1 2 3; do
  n=$(( (RANDOM * 32768 + RANDOM) % 1000000 + 1 ))
  out=$(echo "$n" | ./sum | grep -o '= [0-9]*' | tr -d '= ')
  expect=$(( n * (n + 1) / 2 ))
  if [ "$out" = "$expect" ]; then r=PASS; pass=$((pass+1)); else r=FAIL; fi
  echo "Test $t: N=$n  program=$out  formula=$expect  $r"
done
echo "Result: $pass/3 passed"
