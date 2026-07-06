#Requires AutoHotkey v2.0

try DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")

; 1. 【关键修改】完全接管左 Win 键的按下动作：只告诉系统“Win键被按下了”，不再提前发送屏蔽键
$LWin::Send("{Blind}{LWin down}") 

; 2. 接管左 Win 键的松开动作
$LWin up:: {
    ; 判断期间是否按下了其他键（如果是单独按并松开 Win 键，A_PriorKey 就是 LWin）
    if (A_PriorKey = "LWin") {
        
        ; 3. 此时再发送屏蔽键 vkE8，并松开 Win 键，借此吃掉原生的开始菜单
        Send("{Blind}{vkE8}{LWin up}")
        
        ; --- 以下为你原有的自定义多屏点击逻辑 ---
        CoordMode("Mouse", "Screen")
        MouseGetPos(&OriginalX, &OriginalY) 

        MonitorCount := MonitorGetCount()
        Loop MonitorCount {
            MonitorGet(A_Index, &Left, &Top, &Right, &Bottom)
            
            if (OriginalX >= Left && OriginalX <= Right && OriginalY >= Top && OriginalY <= Bottom) {
                
                StartX := Left + 24
                StartY := Bottom - 24
                
                MouseMove(StartX, StartY, 0)
                Sleep(20) 
                Click()
                Sleep(80) 
                MouseMove(OriginalX, OriginalY, 0)
                break
            }
        }
    } else {
        ; 如果期间按下了其他键（比如按了 V），说明这是个组合键操作 (Win+V)
        ; 我们原样正常松开 Win 键即可，系统会完美识别到组合键
        Send("{Blind}{LWin up}")
    }
}