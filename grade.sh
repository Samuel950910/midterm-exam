#!/bin/bash
# 任務達成評分系統：檢查前四題，達標各給 20 分；本系統能執行完成即 Q5 得 20 分
score=0
ok(){ echo "[PASS] $1 (+20)"; score=$((score+20)); }
ng(){ echo "[FAIL] $1 (+0)"; }

# Q1 編譯並執行
if gfortran -o sum sum.f90 2>/dev/null && echo 10 | ./sum | grep -q '= 55'; then ok "Q1 compile & run (N=10 -> 55)"; else ng "Q1 compile & run"; fi

# Q2 三次隨機驗證
if ./verify.sh | grep -q 'Result: 3/3 passed'; then ok "Q2 three random tests"; else ng "Q2 three random tests"; fi

# Q3 Git v1 / v2，且 v2 有註解
log=$(git log --format=%s)
if echo "$log" | grep -q '^v1' && echo "$log" | grep -q '^v2' && grep -q '^ *!' sum.f90 && ! git show "$(git log --format=%H --grep='^v1' -1)":sum.f90 | grep -q '!'; then
  ok "Q3 git v1 (original) + v2 (commented)"; else ng "Q3 git versions"; fi

# Q4 已推送到 GitHub（遠端含 v2 commit）
v2=$(git log --format=%H --grep='^v2' -1)
if [ -n "$v2" ] && git branch -r --contains "$v2" 2>/dev/null | grep -q origin; then
  ok "Q4 pushed to GitHub"; else ng "Q4 pushed to GitHub"; fi

ok "Q5 grading system executed"
echo "TOTAL: $score / 100"
