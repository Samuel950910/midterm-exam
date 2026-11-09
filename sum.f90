! 程式名稱：sum_to_n —— 計算 1 + 2 + ... + N 的總和
program sum_to_n
  ! 關閉隱式型別宣告，所有變數都必須明確宣告
  implicit none
  ! 宣告 8 位元組整數：n 為上限、i 為迴圈變數、total 為累加總和（8 位元組可避免大數溢位）
  integer(kind=8) :: n, i, total

  ! 顯示提示文字，advance='no' 讓游標停在同一行等待輸入
  write(*,'(A)', advance='no') 'Enter N: '
  ! 從鍵盤讀入 N
  read(*,*) n

  ! 檢查輸入：N 必須是正整數
  if (n < 1) then
    ! 輸入不合法時顯示錯誤訊息
    write(*,'(A)') 'Error: N must be a positive integer.'
    ! 以錯誤代碼 1 結束程式
    stop 1
  ! 結束 if 判斷
  end if

  ! 累加前先把總和歸零
  total = 0
  ! 迴圈：i 從 1 跑到 n
  do i = 1, n
    ! 把目前的 i 加進總和
    total = total + i
  ! 結束 do 迴圈
  end do

  ! 輸出結果，I0 表示依數字實際長度輸出整數
  write(*,'(A,I0,A,I0)') 'Sum of 1 to ', n, ' = ', total
! 程式結束
end program sum_to_n
