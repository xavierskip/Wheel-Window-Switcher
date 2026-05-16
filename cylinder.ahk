#Requires AutoHotkey v2.0
#SingleInstance Force

; =====================================================================
;  WheelWindowSwitcher — 快捷键 + 滚轮 循环切换当前屏幕窗口
;  需要 AutoHotkey v2.0+  |  https://www.autohotkey.com/
; =====================================================================
;  向下滚：当前顶层窗口沉底，下一个窗口浮上来
;  向上滚：底层窗口浮到顶部
;  多屏幕：只切换鼠标所在屏幕的窗口
; =====================================================================

A_IconTip := "cylinder — 快捷键+滚轮循环切换窗口"

; 改用 [Alt] + [Shift] + [滚轮]，避开 Windows 键引发的 Office 网页弹窗冲突
; 可根据文档 https://www.autohotkey.com/docs/v1/Hotkeys.htm 来修改快捷键
!+WheelDown::CycleWindowsOnMonitor("Next")
!+WheelUp::CycleWindowsOnMonitor("Prev")

CycleWindowsOnMonitor(Direction) {
    CoordMode "Mouse", "Screen"
    MouseGetPos &mouseX, &mouseY

    ; 1. 获取鼠标当前所在的显示器
    monitorCount := MonitorGetCount()
    currentMon := 1
    Loop monitorCount {
        MonitorGet A_Index, &mLeft, &mTop, &mRight, &mBottom
        if (mouseX >= mLeft && mouseX <= mRight && mouseY >= mTop && mouseY <= mBottom) {
            currentMon := A_Index
            break
        }
    }

    ; 2. 获取屏幕上所有的窗口，并筛选出当前显示器上的有效窗口
    MonitorGet currentMon, &mLeft, &mTop, &mRight, &mBottom
    allWindows := WinGetList()
    validWindows := []

    for hwnd in allWindows {
        ; 过滤掉没有标题的隐藏程序
        if (WinGetTitle(hwnd) == "")
            continue
        
        ; 过滤掉工具窗口 (WS_EX_TOOLWINDOW)
        exStyle := WinGetExStyle(hwnd)
        if (exStyle & 0x80) 
            continue

        ; 获取窗口位置，判断是否在当前鼠标所在的显示器内
        try {
            WinGetPos &wX, &wY, &wW, &wH, hwnd
            wCenterX := wX + (wW / 2)
            wCenterY := wY + (wH / 2)
            
            if (wCenterX >= mLeft && wCenterX <= mRight && wCenterY >= mTop && wCenterY <= mBottom) {
                validWindows.Push(hwnd)
            }
        }
    }

    ; 3. 执行切换逻辑
    if (validWindows.Length == 0)
        return ; 没有窗口时不进行操作

    if (validWindows.Length == 1) {
        ; 只有一个窗口时，循环切换最大化和还原状态
        hwnd := validWindows[1]
        try {
            if (WinGetMinMax(hwnd) == 1) {
                WinRestore(hwnd)
            } else {
                WinMaximize(hwnd)
            }
        } catch {
            ; 遇到权限不足的窗口，静默忽略
        }
        return
    }

    if (Direction == "Next") {
        ; 使用 try-catch 包裹，如果遇到管理员权限的窗口导致拒绝访问，直接忽略，防止脚本崩溃报错
        try {
            WinMoveBottom(validWindows[1])
            WinActivate(validWindows[2])
        } catch {
            ; 遇到权限不足的窗口，静默忽略
        }
    } else {
        bottomWin := validWindows[validWindows.Length]
        try {
            WinActivate(bottomWin)
        } catch {
            ; 遇到权限不足的窗口，静默忽略
        }
    }
}