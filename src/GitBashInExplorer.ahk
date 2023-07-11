#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
#IfWinActive ahk_class CabinetWClass ; only for explorer
^!g:: ; ctrl+alt+g
ClipSaved := ClipboardAll
clipboard = 
Send !d ; 选择当前文件夹地址
Send ^c ; 复制
ClipWait, 1
If ErrorLevel
    return
Run "C:\Program Files\Git\git-bash.exe" --cd="%clipboard%" ; 修改'Run'与'--cd'的部分为自己的 git-bash.exe路径
Clipboard := ClipSaved
return
#IfWinActive
